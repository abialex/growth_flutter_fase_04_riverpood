import 'package:design_system/src/tokens/spacing_tokens.dart';

/// [small] is meant to sit inline (e.g. inside a button). [medium] and
/// [large] are for section/full-screen loading states.
enum AppLoaderSize {
  /// 16dp diameter — for inline use (e.g. inside a button).
  small,

  /// 32dp diameter — for section-level loading states.
  medium,

  /// 48dp diameter — for full-screen loading states.
  large;

  /// Diameter of the spinner, in logical pixels. Reuses the spacing scale
  /// instead of introducing a new magic-number scale.
  double get diameter => switch (this) {
    AppLoaderSize.small => AppSpacing.md,
    AppLoaderSize.medium => AppSpacing.xl,
    AppLoaderSize.large => AppSpacing.xxl,
  };
}
