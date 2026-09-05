import 'dart:math' as math;

import 'package:design_system/src/atoms/enums/app_button_size.dart';
import 'package:design_system/src/tokens/border_width_tokens.dart';
import 'package:design_system/src/tokens/color_roles.dart';
import 'package:design_system/src/tokens/color_tokens.dart';
import 'package:design_system/src/tokens/enums/app_emphasis.dart';
import 'package:design_system/src/tokens/icon_size_tokens.dart';
import 'package:design_system/src/tokens/opacity_tokens.dart';
import 'package:design_system/src/tokens/radius_tokens.dart';
import 'package:design_system/src/tokens/spacing_tokens.dart';
import 'package:flutter/material.dart';

/// Minimum logical tap target per accessibility guidelines. The visible
/// pill can be smaller (`small`/micro is 36dp tall); the tappable area
/// never is.
const double _minTouchTarget = 44;

/// Pill-shaped button. [emphasis] controls the color treatment
/// (solid/light/outline) and [size] the height (medium/small). Passing
/// `onPressed: null` renders the disabled state automatically.
///
/// Thin styling layer over Flutter's own [FilledButton]/[OutlinedButton] —
/// not a hand-rolled `Material`+`InkWell`. That gets keyboard focus/hover,
/// Enter/Space activation and button semantics for free instead of us
/// reimplementing them, and stays dependency-free (the project avoids
/// unnecessary packages, not the Flutter SDK's own widgets).
class AppButton extends StatelessWidget {
  /// Creates a button. [label] and [onPressed] are required; everything
  /// else has a default — see the class doc for what each one controls.
  const AppButton({
    required this.label,
    required this.onPressed,
    super.key,
    this.emphasis = AppEmphasis.solid,
    this.size = AppButtonSize.medium,
    this.isLoading = false,
    this.isDestructive = false,
    this.leadingIcon,
    this.trailingIcon,
  });

  /// Text shown inside the button.
  final String label;

  /// Called when the button is tapped. Pass `null` to render it disabled.
  final VoidCallback? onPressed;

  /// Color treatment: `solid` (filled), `light` (tinted container) or
  /// `outline`.
  final AppEmphasis emphasis;

  /// Button height: `medium` (48dp) or `small` (36dp).
  final AppButtonSize size;

  /// Shows a spinner in place of the label without changing the button's
  /// size.
  final bool isLoading;

  /// Swaps the emphasis color source from `primary`/`primaryContainer` to
  /// `error`/`errorContainer`. Not present in the design mockups this atom
  /// was built from — added so the atom covers the "destructive" variant
  /// needed for delete/cancel/irreversible actions.
  final bool isDestructive;

  /// Optional icon shown before the label.
  final IconData? leadingIcon;

  /// Optional icon shown after the label.
  final IconData? trailingIcon;

  bool get _isDisabled => onPressed == null || isLoading;

  @override
  Widget build(BuildContext context) {
    final colors = context.colors;
    final style = _buildStyle(context, colors);
    final foreground = _isDisabled
        ? colors.onSurface.withValues(alpha: AppOpacity.disabledForeground)
        : _enabledForegroundColor(colors);
    final child = _buildChild(context, foreground);
    final callback = _isDisabled ? null : onPressed;

    if (emphasis == AppEmphasis.outline) {
      return OutlinedButton(onPressed: callback, style: style, child: child);
    }
    return FilledButton(onPressed: callback, style: style, child: child);
  }

  Widget _buildChild(BuildContext context, Color foregroundColor) {
    final isMedium = size == AppButtonSize.medium;
    final baseTextStyle = isMedium
        ? Theme.of(context).textTheme.labelLarge
        : Theme.of(context).textTheme.labelMedium;

    final content = Row(
      mainAxisSize: MainAxisSize.min,
      children: [
        if (leadingIcon != null) ...[
          Icon(leadingIcon, size: AppIconSize.md, color: foregroundColor),
          const SizedBox(width: AppSpacing.xs),
        ],
        Text(
          label,
          style: baseTextStyle?.copyWith(color: foregroundColor),
        ),
        if (trailingIcon != null) ...[
          const SizedBox(width: AppSpacing.xs),
          Icon(trailingIcon, size: AppIconSize.md, color: foregroundColor),
        ],
      ],
    );

    if (!isLoading) return content;

    // Keep the label laid out (just invisible) so the button doesn't
    // resize when it flips into/out of the loading state.
    return Stack(
      alignment: Alignment.center,
      children: [
        Opacity(opacity: 0, child: content),
        SizedBox(
          height: AppIconSize.md,
          width: AppIconSize.md,
          child: CircularProgressIndicator(
            strokeWidth: 2,
            color: foregroundColor,
          ),
        ),
      ],
    );
  }

  ButtonStyle _buildStyle(BuildContext context, AppColorRoles colors) {
    final isMedium = size == AppButtonSize.medium;
    final tapTargetHeight = math.max(size.visualHeight, _minTouchTarget);
    final horizontalPadding = isMedium ? AppSpacing.lg : AppSpacing.md;
    final accentColor = isDestructive ? colors.error : colors.primary;
    final enabledForeground = _enabledForegroundColor(colors);
    final shape = RoundedRectangleBorder(
      borderRadius: BorderRadius.circular(AppRadius.full),
    );

    return ButtonStyle(
      shape: WidgetStatePropertyAll(shape),
      minimumSize: WidgetStatePropertyAll(Size(0, tapTargetHeight)),
      padding: WidgetStatePropertyAll(
        EdgeInsets.symmetric(horizontal: horizontalPadding),
      ),
      tapTargetSize: MaterialTapTargetSize.shrinkWrap,
      elevation: const WidgetStatePropertyAll(0),
      side: emphasis == AppEmphasis.outline
          ? WidgetStateProperty.resolveWith(
              (states) => BorderSide(
                color: states.contains(WidgetState.disabled)
                    ? colors.onSurface.withValues(
                        alpha: AppOpacity.disabledForeground,
                      )
                    : accentColor,
                width: AppBorderWidth.medium,
              ),
            )
          : null,
      backgroundColor: WidgetStateProperty.resolveWith((states) {
        if (states.contains(WidgetState.disabled)) {
          return colors.onSurface.withValues(
            alpha: AppOpacity.disabledBackground,
          );
        }
        return switch (emphasis) {
          AppEmphasis.solid => accentColor,
          AppEmphasis.light =>
            isDestructive ? colors.errorContainer : colors.primaryContainer,
          AppEmphasis.outline => Colors.transparent,
        };
      }),
      foregroundColor: WidgetStateProperty.resolveWith((states) {
        if (states.contains(WidgetState.disabled)) {
          return colors.onSurface.withValues(
            alpha: AppOpacity.disabledForeground,
          );
        }
        return enabledForeground;
      }),
      overlayColor: WidgetStateProperty.resolveWith((states) {
        if (states.contains(WidgetState.disabled)) return null;
        if (states.contains(WidgetState.pressed)) {
          return enabledForeground.withValues(alpha: AppOpacity.focus);
        }
        if (states.contains(WidgetState.hovered)) {
          return enabledForeground.withValues(alpha: AppOpacity.hover);
        }
        if (states.contains(WidgetState.focused)) {
          return enabledForeground.withValues(alpha: AppOpacity.focus);
        }
        return null;
      }),
    );
  }

  Color _enabledForegroundColor(AppColorRoles colors) {
    if (isDestructive) {
      return switch (emphasis) {
        AppEmphasis.solid => colors.onError,
        AppEmphasis.light => colors.onErrorContainer,
        AppEmphasis.outline => colors.error,
      };
    }
    return switch (emphasis) {
      AppEmphasis.solid => colors.onPrimary,
      AppEmphasis.light => colors.onPrimaryContainer,
      AppEmphasis.outline => colors.primary,
    };
  }
}
