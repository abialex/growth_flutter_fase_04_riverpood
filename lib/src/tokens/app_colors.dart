import 'package:app_ui_kit/src/tokens/color_roles.dart';
import 'package:app_ui_kit/src/tokens/color_tokens.dart';
import 'package:app_ui_kit/src/tokens/enums/app_brand.dart';
import 'package:flutter/material.dart';

/// Semantic color shortcuts that do not require a [BuildContext].
///
/// The direct getters use the light indigo palette. Use [resolve] to select a
/// different [Brightness] or [AppBrand].
class AppColors {
  const AppColors._();

  static final AppColorRoles _defaultRoles = AppColorTokens.light();

  /// Resolves semantic colors for [brightness] and [brand].
  static AppColorRoles resolve({
    Brightness brightness = Brightness.light,
    AppBrand brand = AppBrand.indigo,
  }) {
    return brightness == Brightness.light
        ? AppColorTokens.light(brand: brand)
        : AppColorTokens.dark(brand: brand);
  }

  /// Default light indigo primary role.
  static Color get primary => _defaultRoles.primary;

  /// Default light indigo on-primary role.
  static Color get onPrimary => _defaultRoles.onPrimary;

  /// Default light indigo primary container role.
  static Color get primaryContainer => _defaultRoles.primaryContainer;

  /// Default light indigo on-primary-container role.
  static Color get onPrimaryContainer => _defaultRoles.onPrimaryContainer;

  /// Default light indigo secondary role.
  static Color get secondary => _defaultRoles.secondary;

  /// Default light indigo on-secondary role.
  static Color get onSecondary => _defaultRoles.onSecondary;

  /// Default light indigo background role.
  static Color get background => _defaultRoles.background;

  /// Default light indigo on-background role.
  static Color get onBackground => _defaultRoles.onBackground;

  /// Default light indigo surface role.
  static Color get surface => _defaultRoles.surface;

  /// Default light indigo on-surface role.
  static Color get onSurface => _defaultRoles.onSurface;

  /// Default light indigo error role.
  static Color get error => _defaultRoles.error;

  /// Default light indigo on-error role.
  static Color get onError => _defaultRoles.onError;

  /// Default light indigo error-container role.
  static Color get errorContainer => _defaultRoles.errorContainer;

  /// Default light indigo on-error-container role.
  static Color get onErrorContainer => _defaultRoles.onErrorContainer;

  /// Default light indigo success role.
  static Color get success => _defaultRoles.success;

  /// Default light indigo on-success role.
  static Color get onSuccess => _defaultRoles.onSuccess;

  /// Default light indigo success-container role.
  static Color get successContainer => _defaultRoles.successContainer;

  /// Default light indigo on-success-container role.
  static Color get onSuccessContainer => _defaultRoles.onSuccessContainer;

  /// Default light indigo warning role.
  static Color get warning => _defaultRoles.warning;

  /// Default light indigo on-warning role.
  static Color get onWarning => _defaultRoles.onWarning;

  /// Default light indigo warning-container role.
  static Color get warningContainer => _defaultRoles.warningContainer;

  /// Default light indigo on-warning-container role.
  static Color get onWarningContainer => _defaultRoles.onWarningContainer;
}
