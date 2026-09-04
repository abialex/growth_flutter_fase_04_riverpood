/// Opacity applied over `onSurface`/`primary` to derive states (disabled,
/// borders, shadows, shimmer) without needing brand-specific colors.
class AppOpacity {
  const AppOpacity._();

  static const double disabledBackground = 0.12;
  static const double disabledForeground = 0.38;

  /// Subtle hairline border/divider over `onSurface` (e.g. outlined card).
  static const double border = 0.12;

  /// Drop shadow tint over `onSurface`.
  static const double shadow = 0.2;

  /// `focusColor`/`hoverColor` tint over `primary` for interactive
  /// components (buttons, chips).
  static const double focus = 0.12;
  static const double hover = 0.08;
}
