/// Semantic intent of an `AppBanner`, each mapped to its matching
/// container/on-container color pair and icon.
enum AppBannerVariant {
  /// Neutral, informational message. Uses the primary container colors.
  info,

  /// Positive/confirmation message. Uses the success container colors.
  success,

  /// Caution message, not necessarily an error. Uses the warning container
  /// colors.
  warning,

  /// Failure/problem message. Uses the error container colors.
  error,
}
