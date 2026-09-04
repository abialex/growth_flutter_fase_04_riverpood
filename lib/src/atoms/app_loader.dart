import 'package:flutter/material.dart';

import '../tokens/color_tokens.dart';
import '../tokens/spacing_tokens.dart';
import 'enums/app_loader_size.dart';

/// Indeterminate circular loader. Diameters reuse the spacing scale
/// (`sm`→`AppSpacing.md`, `medium`→`AppSpacing.xl`, `large`→`AppSpacing.xxl`)
/// instead of introducing a new magic-number scale.
class AppLoader extends StatelessWidget {
  const AppLoader({
    super.key,
    this.size = AppLoaderSize.medium,
    this.message,
  });

  final AppLoaderSize size;
  final String? message;

  double get _diameter => switch (size) {
        AppLoaderSize.small => AppSpacing.md,
        AppLoaderSize.medium => AppSpacing.xl,
        AppLoaderSize.large => AppSpacing.xxl,
      };

  @override
  Widget build(BuildContext context) {
    final colors = context.colors;
    final indicator = SizedBox(
      height: _diameter,
      width: _diameter,
      child: CircularProgressIndicator(
        strokeWidth: size == AppLoaderSize.small ? 2 : 3,
        color: colors.primary,
      ),
    );

    final label = message;
    if (label == null || label.isEmpty) return indicator;

    return Column(
      mainAxisSize: MainAxisSize.min,
      children: [
        indicator,
        const SizedBox(height: AppSpacing.sm),
        Text(
          label,
          style: Theme.of(context).textTheme.bodyMedium?.copyWith(color: colors.onSurface),
          textAlign: TextAlign.center,
        ),
      ],
    );
  }
}
