import 'package:flutter/material.dart' show BorderSide;

/// Border/divider stroke width scale. Use instead of a hardcoded `width:`
/// on a [BorderSide].
class AppBorderWidth {
  const AppBorderWidth._();

  /// Hairline border — outlined cards, dividers, chip borders.
  static const double thin = 1;

  /// Slightly heavier border — outlined buttons, chips and text field
  /// borders, where the border itself carries the component's shape.
  static const double medium = 1.5;
}
