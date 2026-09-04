/// Selects which brand palette `AppColorTokens`/`AppTheme` resolve to.
/// Both brands expose the same `AppColorRoles` shape, so components never
/// need to know which brand is active.
enum AppBrand {
  /// Blue-based brand, seeded from a Material 3 tonal palette.
  indigo,

  /// Orange-based brand, hand-picked to match its own design mockups.
  orange,
}
