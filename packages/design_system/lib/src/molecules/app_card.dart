import 'package:flutter/material.dart';

import '../tokens/border_width_tokens.dart';
import '../tokens/color_tokens.dart';
import '../tokens/elevation_tokens.dart';
import '../tokens/opacity_tokens.dart';
import '../tokens/radius_tokens.dart';
import '../tokens/spacing_tokens.dart';
import 'enums/app_card_variant.dart';

/// Card container. [variant] `filled` defaults to `primaryContainer`
/// (matches the "info card" mockup) — pass [backgroundColor] to override
/// for any variant. [header]/[footer] are optional slots rendered
/// above/below [child], separated by [AppSpacing.sm].
///
/// Thin styling layer over Flutter's own [Card]/[Card.filled]/
/// [Card.outlined] — not hand-rolled `Material`. Same reasoning as
/// [AppButton]/[AppChip].
class AppCard extends StatelessWidget {
  const AppCard({
    required this.child,
    super.key,
    this.variant = AppCardVariant.elevated,
    this.backgroundColor,
    this.onTap,
    this.padding = const EdgeInsets.all(AppSpacing.md),
    this.header,
    this.footer,
  });

  final Widget child;
  final AppCardVariant variant;
  final Color? backgroundColor;
  final VoidCallback? onTap;
  final EdgeInsetsGeometry padding;
  final Widget? header;
  final Widget? footer;

  @override
  Widget build(BuildContext context) {
    final colors = context.colors;
    final radius = BorderRadius.circular(AppRadius.lg);
    final plainShape = RoundedRectangleBorder(borderRadius: radius);
    final outlineShape = RoundedRectangleBorder(
      borderRadius: radius,
      side: BorderSide(
        color: colors.onSurface.withValues(alpha: AppOpacity.border),
        width: AppBorderWidth.thin,
      ),
    );

    final headerSlot = header;
    final footerSlot = footer;
    final content = headerSlot == null && footerSlot == null
        ? child
        : Column(
            mainAxisSize: MainAxisSize.min,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              if (headerSlot != null) ...[headerSlot, const SizedBox(height: AppSpacing.sm)],
              child,
              if (footerSlot != null) ...[const SizedBox(height: AppSpacing.sm), footerSlot],
            ],
          );

    final body = InkWell(
      onTap: onTap,
      customBorder: variant == AppCardVariant.outlined ? outlineShape : plainShape,
      child: Padding(padding: padding, child: content),
    );

    return switch (variant) {
      AppCardVariant.elevated => Card(
          color: backgroundColor,
          elevation: AppElevation.low,
          shape: plainShape,
          margin: EdgeInsets.zero,
          clipBehavior: Clip.antiAlias,
          child: body,
        ),
      AppCardVariant.filled => Card.filled(
          color: backgroundColor ?? colors.primaryContainer,
          shape: plainShape,
          margin: EdgeInsets.zero,
          clipBehavior: Clip.antiAlias,
          child: body,
        ),
      AppCardVariant.outlined => Card.outlined(
          color: backgroundColor,
          shape: outlineShape,
          margin: EdgeInsets.zero,
          clipBehavior: Clip.antiAlias,
          child: body,
        ),
    };
  }
}
