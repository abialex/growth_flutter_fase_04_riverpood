import 'package:flutter/material.dart';

/// Border radius scale. Use for card/button/chip corners instead of a
/// hardcoded [BorderRadius].
class AppRadius {
  const AppRadius._();

  /// 0dp radius — for sharp corners.
  static const double none = 0;

  /// 4dp radius — for subtle rounding on small components.
  static const double sm = 4;

  /// 8dp radius — for medium rounding on cards and buttons.
  static const double md = 8;

  /// 16dp radius — for large rounding on chips and other small components.
  static const double lg = 16;

  /// 24dp radius — for extra-large rounding on large components.
  static const double xl = 24;

  /// 999dp radius — for pill-shaped components.
  static const double full = 999;
}
