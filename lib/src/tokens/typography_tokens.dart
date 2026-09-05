import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

/// Single source of truth for the type scale. Built on Material 3's
/// [TextTheme] slots (display/headline/title/body/large/medium/small),
/// themed with the Inter font family.
///
/// Components must read styles from `Theme.of(context).textTheme`
/// (populated by [AppTypographyTokens.textTheme]) instead of building
/// [TextStyle]s inline.
class AppTypographyTokens {
  const AppTypographyTokens._();

  /// Returns a [TextTheme] with the Inter font family and [baseColor]
  /// applied as the body/display color.
  ///
  /// [baseColor] should come from the resolved `AppColorRoles.onSurface`
  /// for the current brand/brightness, so text color stays sourced from the
  /// color token pipeline rather than a literal defined here.
  static TextTheme textTheme({required Color baseColor}) {
    return GoogleFonts.interTextTheme().apply(
      bodyColor: baseColor,
      displayColor: baseColor,
    );
  }
}
