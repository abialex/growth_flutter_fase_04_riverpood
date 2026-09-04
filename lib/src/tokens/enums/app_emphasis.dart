/// Visual weight shared by components that come in solid/light/outline
/// flavors (buttons, chips): [solid] uses `primary`/`onPrimary`, [light]
/// uses `primaryContainer`/`onPrimaryContainer`, [outline] uses `surface`
/// with a `primary` border and text.
enum AppEmphasis {
  /// Solid emphasis — uses `primary`/`onPrimary`.
  solid,

  /// Light emphasis — uses `primaryContainer`/`onPrimaryContainer`.
  light,

  /// Outline emphasis — uses `surface` with a `primary` border and text.
  outline,
}
