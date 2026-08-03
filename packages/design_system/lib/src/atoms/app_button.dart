import 'dart:math' as math;

import 'package:flutter/material.dart';

import '../tokens/border_width_tokens.dart';
import '../tokens/color_roles.dart';
import '../tokens/color_tokens.dart';
import '../tokens/enums/app_emphasis.dart';
import '../tokens/icon_size_tokens.dart';
import '../tokens/opacity_tokens.dart';
import '../tokens/radius_tokens.dart';
import '../tokens/spacing_tokens.dart';
import 'enums/app_button_size.dart';

/// Minimum logical tap target per accessibility guidelines (see
/// `doc/PROJECT_RULES.md` — Botones). The visible pill can be smaller
/// (`small`/micro is 36dp tall); the tappable area never is.
const double _minTouchTarget = 44;

/// Pill-shaped button. [emphasis] controls the color treatment
/// (solid/light/outline) and [size] the height (medium/small). Passing
/// `onPressed: null` renders the disabled state automatically.
///
/// Thin styling layer over Flutter's own [FilledButton]/[OutlinedButton] —
/// not a hand-rolled `Material`+`InkWell`. That gets keyboard focus/hover,
/// Enter/Space activation and button semantics for free instead of us
/// reimplementing them, and stays dependency-free (`doc/PROJECT_RULES.md`
/// forbids unnecessary packages, not the Flutter SDK's own widgets).
class AppButton extends StatelessWidget {
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

  final String label;
  final VoidCallback? onPressed;
  final AppEmphasis emphasis;
  final AppButtonSize size;
  final bool isLoading;

  /// Swaps the emphasis color source from `primary`/`primaryContainer` to
  /// `error`/`errorContainer`. Not present in the design mockups this atom
  /// was built from — added so the atom covers the "destructive" variant
  /// required by `doc/PROJECT_RULES.md` (delete/cancel/irreversible actions).
  final bool isDestructive;

  final IconData? leadingIcon;
  final IconData? trailingIcon;

  bool get _isDisabled => onPressed == null || isLoading;

  @override
  Widget build(BuildContext context) {
    final colors = context.colors;
    final style = _buildStyle(context, colors);
    final child = _buildChild(context, _enabledForegroundColor(colors));
    final callback = _isDisabled ? null : onPressed;

    if (emphasis == AppEmphasis.outline) {
      return OutlinedButton(onPressed: callback, style: style, child: child);
    }
    return FilledButton(onPressed: callback, style: style, child: child);
  }

  Widget _buildChild(BuildContext context, Color enabledForegroundColor) {
    final isMedium = size == AppButtonSize.medium;
    final baseTextStyle =
        isMedium ? Theme.of(context).textTheme.labelLarge : Theme.of(context).textTheme.labelMedium;

    final content = Row(
      mainAxisSize: MainAxisSize.min,
      children: [
        if (leadingIcon != null) ...[
          Icon(leadingIcon, size: AppIconSize.md),
          const SizedBox(width: AppSpacing.xs),
        ],
        Text(label, style: baseTextStyle),
        if (trailingIcon != null) ...[
          const SizedBox(width: AppSpacing.xs),
          Icon(trailingIcon, size: AppIconSize.md),
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
          child: CircularProgressIndicator(strokeWidth: 2, color: enabledForegroundColor),
        ),
      ],
    );
  }

  ButtonStyle _buildStyle(BuildContext context, AppColorRoles colors) {
    final isMedium = size == AppButtonSize.medium;
    final visualHeight = isMedium ? 48.0 : 36.0;
    final tapTargetHeight = math.max(visualHeight, _minTouchTarget);
    final horizontalPadding = isMedium ? AppSpacing.lg : AppSpacing.md;
    final accentColor = isDestructive ? colors.error : colors.primary;
    final enabledForeground = _enabledForegroundColor(colors);
    final shape = RoundedRectangleBorder(borderRadius: BorderRadius.circular(AppRadius.full));

    return ButtonStyle(
      shape: WidgetStatePropertyAll(shape),
      minimumSize: WidgetStatePropertyAll(Size(0, tapTargetHeight)),
      padding: WidgetStatePropertyAll(EdgeInsets.symmetric(horizontal: horizontalPadding)),
      tapTargetSize: MaterialTapTargetSize.shrinkWrap,
      elevation: const WidgetStatePropertyAll(0),
      side: emphasis == AppEmphasis.outline
          ? WidgetStateProperty.resolveWith(
              (states) => BorderSide(
                color: states.contains(WidgetState.disabled)
                    ? colors.onSurface.withValues(alpha: AppOpacity.disabledForeground)
                    : accentColor,
                width: AppBorderWidth.medium,
              ),
            )
          : null,
      backgroundColor: WidgetStateProperty.resolveWith((states) {
        if (states.contains(WidgetState.disabled)) {
          return colors.onSurface.withValues(alpha: AppOpacity.disabledBackground);
        }
        return switch (emphasis) {
          AppEmphasis.solid => accentColor,
          AppEmphasis.light => isDestructive ? colors.errorContainer : colors.primaryContainer,
          AppEmphasis.outline => Colors.transparent,
        };
      }),
      foregroundColor: WidgetStateProperty.resolveWith((states) {
        if (states.contains(WidgetState.disabled)) {
          return colors.onSurface.withValues(alpha: AppOpacity.disabledForeground);
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
