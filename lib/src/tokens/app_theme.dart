import 'package:design_system/src/tokens/color_tokens.dart';
import 'package:design_system/src/tokens/enums/app_brand.dart';
import 'package:design_system/src/tokens/typography_tokens.dart';
import 'package:flutter/material.dart';

/// Ready-to-use [ThemeData] built from the design system tokens. Any
/// consumer app should use these instead of building its own [ThemeData],
/// so visual consistency is guaranteed across every app that depends on
/// this package.
class AppTheme {
  const AppTheme._();

  /// Builds the light-mode [ThemeData] for [brand].
  static ThemeData light({AppBrand brand = AppBrand.indigo}) =>
      _themeFor(Brightness.light, brand);

  /// Builds the dark-mode [ThemeData] for [brand].
  static ThemeData dark({AppBrand brand = AppBrand.indigo}) =>
      _themeFor(Brightness.dark, brand);

  static ThemeData _themeFor(Brightness brightness, AppBrand brand) {
    final colorRoles = brightness == Brightness.light
        ? AppColorTokens.light(brand: brand)
        : AppColorTokens.dark(brand: brand);

    return ThemeData(
      useMaterial3: true,
      brightness: brightness,
      colorScheme: AppColorTokens.colorScheme(brightness, brand: brand),
      textTheme: AppTypographyTokens.textTheme(brightness: brightness),
      extensions: [colorRoles],
    );
  }
}
