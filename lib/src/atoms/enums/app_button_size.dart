import 'package:app_ui_kit/src/tokens/app_button_tokens.dart';
import 'package:app_ui_kit/src/tokens/spacing_tokens.dart';

/// [medium] matches the "secondary button" mockups (48dp tall).
/// [small] matches the "micro button" mockups (36dp tall).
enum AppButtonSize {
  /// Button height: 48dp.
  medium,

  /// Button height: 36dp.
  small;

  /// Visual height for this size. `medium` reuses [AppSpacing.xxl] (48dp);
  /// `small` uses the component token defined for its visual contract.
  double get visualHeight => switch (this) {
    AppButtonSize.medium => AppSpacing.xxl,
    AppButtonSize.small => AppButtonTokens.smallHeight,
  };
}
