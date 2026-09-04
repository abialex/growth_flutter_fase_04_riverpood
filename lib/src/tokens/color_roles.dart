import 'package:flutter/material.dart';

/// Semantic color roles the design system exposes to components.
/// A concrete instance is resolved per [Brightness] (and brand) by
/// [AppColorTokens].
@immutable
class AppColorRoles extends ThemeExtension<AppColorRoles> {
  const AppColorRoles({
    required this.primary,
    required this.onPrimary,
    required this.primaryContainer,
    required this.onPrimaryContainer,
    required this.secondary,
    required this.onSecondary,
    required this.background,
    required this.onBackground,
    required this.surface,
    required this.onSurface,
    required this.error,
    required this.onError,
    required this.errorContainer,
    required this.onErrorContainer,
    required this.success,
    required this.onSuccess,
    required this.successContainer,
    required this.onSuccessContainer,
    required this.warning,
    required this.onWarning,
    required this.warningContainer,
    required this.onWarningContainer,
  });

  final Color primary;
  final Color onPrimary;
  final Color primaryContainer;
  final Color onPrimaryContainer;
  final Color secondary;
  final Color onSecondary;
  final Color background;
  final Color onBackground;
  final Color surface;
  final Color onSurface;
  final Color error;
  final Color onError;
  final Color errorContainer;
  final Color onErrorContainer;
  final Color success;
  final Color onSuccess;
  final Color successContainer;
  final Color onSuccessContainer;
  final Color warning;
  final Color onWarning;
  final Color warningContainer;
  final Color onWarningContainer;

  @override
  AppColorRoles copyWith({
    Color? primary,
    Color? onPrimary,
    Color? primaryContainer,
    Color? onPrimaryContainer,
    Color? secondary,
    Color? onSecondary,
    Color? background,
    Color? onBackground,
    Color? surface,
    Color? onSurface,
    Color? error,
    Color? onError,
    Color? errorContainer,
    Color? onErrorContainer,
    Color? success,
    Color? onSuccess,
    Color? successContainer,
    Color? onSuccessContainer,
    Color? warning,
    Color? onWarning,
    Color? warningContainer,
    Color? onWarningContainer,
  }) {
    return AppColorRoles(
      primary: primary ?? this.primary,
      onPrimary: onPrimary ?? this.onPrimary,
      primaryContainer: primaryContainer ?? this.primaryContainer,
      onPrimaryContainer: onPrimaryContainer ?? this.onPrimaryContainer,
      secondary: secondary ?? this.secondary,
      onSecondary: onSecondary ?? this.onSecondary,
      background: background ?? this.background,
      onBackground: onBackground ?? this.onBackground,
      surface: surface ?? this.surface,
      onSurface: onSurface ?? this.onSurface,
      error: error ?? this.error,
      onError: onError ?? this.onError,
      errorContainer: errorContainer ?? this.errorContainer,
      onErrorContainer: onErrorContainer ?? this.onErrorContainer,
      success: success ?? this.success,
      onSuccess: onSuccess ?? this.onSuccess,
      successContainer: successContainer ?? this.successContainer,
      onSuccessContainer: onSuccessContainer ?? this.onSuccessContainer,
      warning: warning ?? this.warning,
      onWarning: onWarning ?? this.onWarning,
      warningContainer: warningContainer ?? this.warningContainer,
      onWarningContainer: onWarningContainer ?? this.onWarningContainer,
    );
  }

  @override
  AppColorRoles lerp(ThemeExtension<AppColorRoles>? other, double progress) {
    if (other is! AppColorRoles) return this;
    return AppColorRoles(
      primary: Color.lerp(primary, other.primary, progress) ?? primary,
      onPrimary: Color.lerp(onPrimary, other.onPrimary, progress) ?? onPrimary,
      primaryContainer:
          Color.lerp(primaryContainer, other.primaryContainer, progress) ?? primaryContainer,
      onPrimaryContainer:
          Color.lerp(onPrimaryContainer, other.onPrimaryContainer, progress) ??
              onPrimaryContainer,
      secondary: Color.lerp(secondary, other.secondary, progress) ?? secondary,
      onSecondary: Color.lerp(onSecondary, other.onSecondary, progress) ?? onSecondary,
      background: Color.lerp(background, other.background, progress) ?? background,
      onBackground: Color.lerp(onBackground, other.onBackground, progress) ?? onBackground,
      surface: Color.lerp(surface, other.surface, progress) ?? surface,
      onSurface: Color.lerp(onSurface, other.onSurface, progress) ?? onSurface,
      error: Color.lerp(error, other.error, progress) ?? error,
      onError: Color.lerp(onError, other.onError, progress) ?? onError,
      errorContainer:
          Color.lerp(errorContainer, other.errorContainer, progress) ?? errorContainer,
      onErrorContainer:
          Color.lerp(onErrorContainer, other.onErrorContainer, progress) ?? onErrorContainer,
      success: Color.lerp(success, other.success, progress) ?? success,
      onSuccess: Color.lerp(onSuccess, other.onSuccess, progress) ?? onSuccess,
      successContainer:
          Color.lerp(successContainer, other.successContainer, progress) ?? successContainer,
      onSuccessContainer:
          Color.lerp(onSuccessContainer, other.onSuccessContainer, progress) ??
              onSuccessContainer,
      warning: Color.lerp(warning, other.warning, progress) ?? warning,
      onWarning: Color.lerp(onWarning, other.onWarning, progress) ?? onWarning,
      warningContainer:
          Color.lerp(warningContainer, other.warningContainer, progress) ?? warningContainer,
      onWarningContainer:
          Color.lerp(onWarningContainer, other.onWarningContainer, progress) ??
              onWarningContainer,
    );
  }
}
