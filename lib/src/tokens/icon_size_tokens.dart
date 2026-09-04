import 'package:flutter/cupertino.dart' show Icon;
import 'package:flutter/material.dart' show Icon;
import 'package:flutter/widgets.dart' show Icon;

/// Icon size scale. Use instead of a hardcoded `size:` on any [Icon].
class AppIconSize {
  const AppIconSize._();

  /// 16dp — for small icons (e.g. inside buttons).
  static const double sm = 16;

  /// 20dp — for medium icons (e.g. inside chips).
  static const double md = 20;

  /// 24dp — for large icons (e.g. inside cards).
  static const double lg = 24;

  /// 48dp — for extra-large icons (e.g. inside full-screen loaders).
  static const double xl = 48;
}
