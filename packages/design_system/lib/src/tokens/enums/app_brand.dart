/// Selects which brand palette [AppColorTokens]/[AppTheme] resolve to.
/// Both brands expose the same [AppColorRoles] shape, so components never
/// need to know which brand is active.
enum AppBrand {
  indigo,
  orange,
}
