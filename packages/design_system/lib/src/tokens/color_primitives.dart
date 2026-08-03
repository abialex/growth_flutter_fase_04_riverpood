import 'package:flutter/material.dart';

/// Raw color values with no semantic meaning. Only [AppColorTokens]
/// (via [AppColorRoles]) should reference these directly.
class AppColorPrimitives {
  const AppColorPrimitives._();

  /// Seed used to generate the "indigo" brand's Material 3 tonal palette.
  static const Color indigoSeed = Color(0xFF3D5AFE);

  // Material's ColorScheme has no built-in "success"/"warning" roles,
  // so those are hand-picked and kept separate per brightness. Shared by
  // every brand since neither mockup specifies brand-specific ones.
  static const Color successLight = Color(0xFF2E7D32);
  static const Color onSuccessLight = Color(0xFFFFFFFF);
  static const Color successContainerLight = Color(0xFFC8E6C9);
  static const Color onSuccessContainerLight = Color(0xFF1B3A1E);

  static const Color successDark = Color(0xFF81C784);
  static const Color onSuccessDark = Color(0xFF1B3A1E);
  static const Color successContainerDark = Color(0xFF1B5E20);
  static const Color onSuccessContainerDark = Color(0xFFC8E6C9);

  static const Color warningLight = Color(0xFFED6C02);
  static const Color onWarningLight = Color(0xFFFFFFFF);
  static const Color warningContainerLight = Color(0xFFFFE0B2);
  static const Color onWarningContainerLight = Color(0xFF4A2800);

  static const Color warningDark = Color(0xFFFFB74D);
  static const Color onWarningDark = Color(0xFF4A2800);
  static const Color warningContainerDark = Color(0xFF8B5000);
  static const Color onWarningContainerDark = Color(0xFFFFE0B2);

  // "Orange" brand — hand-picked to match design mockups (pill buttons,
  // peach containers). Estimated from screenshots; adjust here if exact
  // brand hex values become available, nothing else needs to change.
  //
  // orangeSolidLight and onOrangeErrorContainerLight were darkened from the
  // screenshot's literal tone (F5691D / D9483D) to meet WCAG AA 4.5:1
  // against white / their container — verified with a luminance-ratio
  // script, not eyeballed.
  static const Color orangeSeed = Color(0xFFC74C09);

  static const Color orangeSolidLight = Color(0xFFC74C09);
  static const Color onOrangeSolidLight = Color(0xFFFFFFFF);
  static const Color orangeContainerLight = Color(0xFFFBD7AC);
  static const Color onOrangeContainerLight = Color(0xFF8A4A1B);
  static const Color orangeBackgroundLight = Color(0xFFFAFAF8);
  static const Color onOrangeBackgroundLight = Color(0xFF2B2B2B);
  static const Color orangeErrorContainerLight = Color(0xFFFBE1DE);
  static const Color onOrangeErrorContainerLight = Color(0xFFBF3025);

  static const Color orangeSolidDark = Color(0xFFFF8A47);
  static const Color onOrangeSolidDark = Color(0xFF4A2200);
  static const Color orangeContainerDark = Color(0xFF6B3A12);
  static const Color onOrangeContainerDark = Color(0xFFFBD7AC);
  static const Color orangeBackgroundDark = Color(0xFF201F1D);
  static const Color onOrangeBackgroundDark = Color(0xFFEDEAE6);
  static const Color orangeErrorContainerDark = Color(0xFF5C2B26);
  static const Color onOrangeErrorContainerDark = Color(0xFFF6B4AC);
}
