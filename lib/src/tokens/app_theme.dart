import 'package:flutter/material.dart';

import 'color_tokens.dart';
import 'enums/app_brand.dart';
import 'typography_tokens.dart';

/// Ready-to-use [ThemeData] built from the design system tokens. Any
/// consumer app should use these instead of building its own [ThemeData],
/// so visual consistency is guaranteed across every app that depends on
/// this package.
class AppTheme {
  const AppTheme._();

  static ThemeData light({AppBrand brand = AppBrand.indigo}) =>
      _themeFor(Brightness.light, brand);

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
