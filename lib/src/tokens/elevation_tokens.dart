/// Material elevation scale. Use instead of a hardcoded `elevation:`.
class AppElevation {
  const AppElevation._();

  /// 0dp — for flat components (e.g. cards, buttons, chips).
  static const double none = 0;

  /// 2dp — for low elevation components (e.g. cards, buttons, chips).
  static const double low = 2;

  /// 4dp — for medium elevation components (e.g. cards, buttons, chips).
  static const double high = 8;
}
