import 'package:flutter/material.dart';

import '../tokens/color_roles.dart';
import '../tokens/color_tokens.dart';
import '../tokens/icon_size_tokens.dart';
import '../tokens/radius_tokens.dart';
import '../tokens/spacing_tokens.dart';
import 'enums/app_banner_variant.dart';

/// Inline message banner. [variant] selects color + icon from tokens.
/// Pass [actionLabel]/[onAction] for an optional inline action, and
/// [onDismiss] to show a close icon.
class AppBanner extends StatelessWidget {
  const AppBanner({
    required this.message,
    super.key,
    this.variant = AppBannerVariant.info,
    this.actionLabel,
    this.onAction,
    this.onDismiss,
  });

  final String message;
  final AppBannerVariant variant;
  final String? actionLabel;
  final VoidCallback? onAction;
  final VoidCallback? onDismiss;

  @override
  Widget build(BuildContext context) {
    final colors = context.colors;
    final textTheme = Theme.of(context).textTheme;
    final style = _resolveStyle(colors);

    return Material(
      color: style.background,
      borderRadius: BorderRadius.circular(AppRadius.md),
      child: Padding(
        padding: const EdgeInsets.all(AppSpacing.md),
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Icon(style.icon, color: style.foreground, size: AppIconSize.md),
            const SizedBox(width: AppSpacing.sm),
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(message, style: textTheme.bodyMedium?.copyWith(color: style.foreground)),
                  if (actionLabel != null && onAction != null) ...[
                    const SizedBox(height: AppSpacing.xs),
                    InkWell(
                      onTap: onAction,
                      child: Text(
                        actionLabel!,
                        style: textTheme.labelLarge?.copyWith(
                          color: style.foreground,
                          fontWeight: FontWeight.w700,
                          decoration: TextDecoration.underline,
                        ),
                      ),
                    ),
                  ],
                ],
              ),
            ),
            if (onDismiss != null) ...[
              const SizedBox(width: AppSpacing.xs),
              InkWell(
                onTap: onDismiss,
                borderRadius: BorderRadius.circular(AppRadius.full),
                child: Icon(Icons.close, color: style.foreground, size: AppIconSize.sm),
              ),
            ],
          ],
        ),
      ),
    );
  }

  _BannerStyle _resolveStyle(AppColorRoles colors) {
    return switch (variant) {
      AppBannerVariant.info => _BannerStyle(
          background: colors.primaryContainer,
          foreground: colors.onPrimaryContainer,
          icon: Icons.info_outline,
        ),
      AppBannerVariant.success => _BannerStyle(
          background: colors.successContainer,
          foreground: colors.onSuccessContainer,
          icon: Icons.check_circle_outline,
        ),
      AppBannerVariant.warning => _BannerStyle(
          background: colors.warningContainer,
          foreground: colors.onWarningContainer,
          icon: Icons.warning_amber_outlined,
        ),
      AppBannerVariant.error => _BannerStyle(
          background: colors.errorContainer,
          foreground: colors.onErrorContainer,
          icon: Icons.error_outline,
        ),
    };
  }
}

class _BannerStyle {
  const _BannerStyle({required this.background, required this.foreground, required this.icon});

  final Color background;
  final Color foreground;
  final IconData icon;
}
