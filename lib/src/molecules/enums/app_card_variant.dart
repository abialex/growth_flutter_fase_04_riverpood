/// [elevated] adds a token-driven shadow, [outlined] draws a border with
/// no shadow, [filled] uses a solid container color (e.g. the "info card").
enum AppCardVariant {
  /// A card with a token-driven shadow, no border, and a
  /// solid background color.
  elevated,

  /// A card with a border, no shadow, and a solid background color.
  outlined,

  /// A card with a solid background color, no shadow, and no border.
  filled,
}
