import 'package:design_system/src/atoms/enums/app_loader_size.dart';
import 'package:design_system/src/tokens/color_tokens.dart';
import 'package:design_system/src/tokens/spacing_tokens.dart';
import 'package:flutter/material.dart';

/// Indeterminate circular loader. See [AppLoaderSize.diameter] for how each
/// size maps to the spacing scale.
class AppLoader extends StatelessWidget {
  /// Creates a loader. [size] controls the diameter, and [message] is an
  /// optional label shown below the spinner.
  const AppLoader({
    super.key,
    this.size = AppLoaderSize.medium,
    this.message,
  });

  /// Diameter of the spinner, in logical pixels.
  final AppLoaderSize size;

  /// Optional label shown below the spinner. If `null` or empty, no label
  /// is shown.
  final String? message;

  @override
  Widget build(BuildContext context) {
    final colors = context.colors;
    final indicator = SizedBox(
      height: size.diameter,
      width: size.diameter,
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
          style: Theme.of(
            context,
          ).textTheme.bodyMedium?.copyWith(color: colors.onSurface),
          textAlign: TextAlign.center,
        ),
      ],
    );
  }
}
