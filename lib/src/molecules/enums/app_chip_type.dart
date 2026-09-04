/// [assist] is a plain, informational/tap-to-act tag (the "Tag" mockup).
/// [filter] is selectable on/off — pass `onSelected` and `isSelected` on
/// `AppChip`.
/// [input] shows a trailing delete icon — pass `onDeleted` on `AppChip`.
enum AppChipType {
  /// A plain, informational/tap-to-act tag (the "Tag" mockup).
  assist,

  /// A selectable on/off chip (the "Filter Chip" mockup).
  filter,

  /// A chip with a trailing delete icon (the "Input Chip" mockup).
  input,
}
