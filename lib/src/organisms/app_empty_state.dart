import 'package:design_system/src/atoms/app_button.dart';
import 'package:design_system/src/atoms/enums/app_button_size.dart';
import 'package:design_system/src/tokens/color_tokens.dart';
import 'package:design_system/src/tokens/icon_size_tokens.dart';
import 'package:design_system/src/tokens/opacity_tokens.dart';
import 'package:design_system/src/tokens/spacing_tokens.dart';
import 'package:flutter/material.dart';

/// Reusable placeholder for "nothing to show" states — no search results,
/// no connection, empty list. Vary [icon]/[title]/[description]/[actionLabel]
/// per case; the layout stays the same everywhere it's used.
class AppEmptyState extends StatelessWidget {
  /// Creates an empty state. [title] is required; everything else has a
  /// default — see the class doc for what each one controls.
  const AppEmptyState({
    required this.title,
    super.key,
    this.description,
    this.icon = Icons.inbox_outlined,
    this.actionLabel,
    this.onAction,
  });

  /// Main text shown below the icon.
  final String title;

  /// Optional secondary text shown below [title].
  final String? description;

  /// Icon shown above [title]. Defaults to a plain inbox icon.
  final IconData icon;

  /// Text for the optional action button. Only shown when [onAction] is
  /// also set.
  final String? actionLabel;

  /// Called when the action button is tapped. Only shown when
  /// [actionLabel] is also set.
  final VoidCallback? onAction;

  @override
  Widget build(BuildContext context) {
    final colors = context.colors;
    final textTheme = Theme.of(context).textTheme;
    final label = actionLabel;
    final action = onAction;
    final descriptionText = description;

    return Padding(
      padding: const EdgeInsets.all(AppSpacing.xl),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          Icon(
            icon,
            size: AppIconSize.xl,
            color: colors.onSurface.withValues(
              alpha: AppOpacity.disabledForeground,
            ),
          ),
          const SizedBox(height: AppSpacing.md),
          Text(
            title,
            style: textTheme.titleMedium,
            textAlign: TextAlign.center,
          ),
          if (descriptionText != null) ...[
            const SizedBox(height: AppSpacing.xs),
            Text(
              descriptionText,
              style: textTheme.bodyMedium?.copyWith(
                color: colors.onSurface.withValues(alpha: 0.7),
              ),
              textAlign: TextAlign.center,
            ),
          ],
          if (label != null && action != null) ...[
            const SizedBox(height: AppSpacing.md),
            AppButton(
              label: label,
              onPressed: action,
              size: AppButtonSize.small,
            ),
          ],
        ],
      ),
    );
  }
}
