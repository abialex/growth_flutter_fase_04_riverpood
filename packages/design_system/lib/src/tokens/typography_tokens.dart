import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

/// Single source of truth for the type scale. Built on Material 3's
/// [TextTheme] slots (display/headline/title/body/label, each in
/// large/medium/small), themed with the Inter font family.
///
/// Components must read styles from `Theme.of(context).textTheme`
/// (populated by [AppTypographyTokens.textTheme]) instead of building
/// [TextStyle]s inline.
class AppTypographyTokens {
  const AppTypographyTokens._();

  static TextTheme textTheme({required Brightness brightness}) {
    final baseColor = brightness == Brightness.light
        ? const Color(0xFF1B1B1F)
        : const Color(0xFFE4E1E6);
    return GoogleFonts.interTextTheme().apply(
      bodyColor: baseColor,
      displayColor: baseColor,
    );
  }
}
