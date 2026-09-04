import 'package:design_system/src/tokens/spacing_tokens.dart';

/// [medium] matches the "secondary button" mockups (48dp tall).
/// [small] matches the "micro button" mockups (36dp tall).
enum AppButtonSize {
  /// Button height: 48dp.
  medium,

  /// Button height: 36dp.
  small;

  /// Visual height for this size. `medium` reuses [AppSpacing.xxl] (48dp);
  /// `small` (36dp) has no equivalent in the spacing scale, so it stays a
  /// documented literal instead of forcing a token that doesn't fit.
  double get visualHeight => switch (this) {
    AppButtonSize.medium => AppSpacing.xxl,
    AppButtonSize.small => 36,
  };
}
