import 'package:design_system/design_system.dart' show AppButton, AppChip;
import 'package:design_system/src/molecules/enums/app_card_variant.dart';
import 'package:design_system/src/tokens/border_width_tokens.dart';
import 'package:design_system/src/tokens/color_tokens.dart';
import 'package:design_system/src/tokens/elevation_tokens.dart';
import 'package:design_system/src/tokens/opacity_tokens.dart';
import 'package:design_system/src/tokens/radius_tokens.dart';
import 'package:design_system/src/tokens/spacing_tokens.dart';
import 'package:flutter/material.dart';

/// Card container. [variant] `filled` defaults to `primaryContainer`
/// (matches the "info card" mockup) — pass [backgroundColor] to override
/// for any variant. [header]/[footer] are optional slots rendered
/// above/below [child], separated by [AppSpacing.sm].
///
/// Thin styling layer over Flutter's own [Card]/[Card.filled]/
/// [Card.outlined] — not hand-rolled `Material`. Same reasoning as
/// [AppButton]/[AppChip].
class AppCard extends StatelessWidget {
  /// Creates a card. [child] is required; everything else has a default — see
  /// the class doc for what each one controls.
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

  /// Content inside the card. Required.
  final Widget child;

  /// Card variant: `elevated` (default), `filled` or `outlined`. See the
  /// class doc for how each one is styled.
  final AppCardVariant variant;

  /// Background color. Defaults to `null` (transparent) for `elevated` and
  /// `outlined`, and `primaryContainer` for `filled`.
  final Color? backgroundColor;

  /// Called when the card is tapped. If `null`, the card is not tappable.
  final VoidCallback? onTap;

  /// Padding around [child]. Defaults to [AppSpacing.md] on all sides.
  final EdgeInsetsGeometry padding;

  /// Optional widget rendered above [child], separated by [AppSpacing.sm].
  final Widget? header;

  /// Optional widget rendered below [child], separated by [AppSpacing.sm].
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
        // ignore: avoid_redundant_argument_values, token-first — explicit on purpose, not relying on BorderSide's default matching AppBorderWidth.thin.
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
              if (headerSlot != null) ...[
                headerSlot,
                const SizedBox(height: AppSpacing.sm),
              ],
              child,
              if (footerSlot != null) ...[
                const SizedBox(height: AppSpacing.sm),
                footerSlot,
              ],
            ],
          );

    final body = InkWell(
      onTap: onTap,
      customBorder: variant == AppCardVariant.outlined
          ? outlineShape
          : plainShape,
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
