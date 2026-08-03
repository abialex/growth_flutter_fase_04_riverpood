import 'package:flutter/material.dart';

import '../atoms/app_button.dart';
import '../atoms/enums/app_button_size.dart';
import '../tokens/color_tokens.dart';
import '../tokens/icon_size_tokens.dart';
import '../tokens/opacity_tokens.dart';
import '../tokens/spacing_tokens.dart';

/// Reusable placeholder for "nothing to show" states — no search results,
/// no connection, empty list. Vary [icon]/[title]/[description]/[actionLabel]
/// per case; the layout stays the same everywhere it's used.
class AppEmptyState extends StatelessWidget {
  const AppEmptyState({
    required this.title,
    super.key,
    this.description,
    this.icon = Icons.inbox_outlined,
    this.actionLabel,
    this.onAction,
  });

  final String title;
  final String? description;
  final IconData icon;
  final String? actionLabel;
  final VoidCallback? onAction;

  @override
  Widget build(BuildContext context) {
    final colors = context.colors;
    final textTheme = Theme.of(context).textTheme;
    final label = actionLabel;
    final action = onAction;

    return Padding(
      padding: const EdgeInsets.all(AppSpacing.xl),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          Icon(icon, size: AppIconSize.xl, color: colors.onSurface.withValues(alpha: AppOpacity.disabledForeground)),
          const SizedBox(height: AppSpacing.md),
          Text(title, style: textTheme.titleMedium, textAlign: TextAlign.center),
          if (description != null) ...[
            const SizedBox(height: AppSpacing.xs),
            Text(
              description!,
              style: textTheme.bodyMedium?.copyWith(
                color: colors.onSurface.withValues(alpha: 0.7),
              ),
              textAlign: TextAlign.center,
            ),
          ],
          if (label != null && action != null) ...[
            const SizedBox(height: AppSpacing.md),
            AppButton(label: label, onPressed: action, size: AppButtonSize.small),
          ],
        ],
      ),
    );
  }
}
