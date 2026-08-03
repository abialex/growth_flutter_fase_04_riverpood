import 'package:flutter/material.dart';

import 'color_primitives.dart';
import 'color_roles.dart';
import 'enums/app_brand.dart';

/// Resolves [AppColorRoles] to concrete values per [Brightness] and
/// [AppBrand]. Both brands expose the same role shape, so components stay
/// brand-agnostic.
class AppColorTokens {
  const AppColorTokens._();

  static AppColorRoles light({AppBrand brand = AppBrand.indigo}) {
    return switch (brand) {
      AppBrand.indigo => _indigoRoles(Brightness.light),
      AppBrand.orange => _orangeRoles(Brightness.light),
    };
  }

  static AppColorRoles dark({AppBrand brand = AppBrand.indigo}) {
    return switch (brand) {
      AppBrand.indigo => _indigoRoles(Brightness.dark),
      AppBrand.orange => _orangeRoles(Brightness.dark),
    };
  }

  static AppColorRoles _indigoRoles(Brightness brightness) {
    final scheme = ColorScheme.fromSeed(
      seedColor: AppColorPrimitives.indigoSeed,
      brightness: brightness,
    );
    final isLight = brightness == Brightness.light;
    return AppColorRoles(
      primary: scheme.primary,
      onPrimary: scheme.onPrimary,
      primaryContainer: scheme.primaryContainer,
      onPrimaryContainer: scheme.onPrimaryContainer,
      secondary: scheme.secondary,
      onSecondary: scheme.onSecondary,
      background: scheme.surface,
      onBackground: scheme.onSurface,
      surface: scheme.surface,
      onSurface: scheme.onSurface,
      error: scheme.error,
      onError: scheme.onError,
      errorContainer: scheme.errorContainer,
      onErrorContainer: scheme.onErrorContainer,
      success: isLight ? AppColorPrimitives.successLight : AppColorPrimitives.successDark,
      onSuccess: isLight ? AppColorPrimitives.onSuccessLight : AppColorPrimitives.onSuccessDark,
      successContainer: isLight
          ? AppColorPrimitives.successContainerLight
          : AppColorPrimitives.successContainerDark,
      onSuccessContainer: isLight
          ? AppColorPrimitives.onSuccessContainerLight
          : AppColorPrimitives.onSuccessContainerDark,
      warning: isLight ? AppColorPrimitives.warningLight : AppColorPrimitives.warningDark,
      onWarning: isLight ? AppColorPrimitives.onWarningLight : AppColorPrimitives.onWarningDark,
      warningContainer: isLight
          ? AppColorPrimitives.warningContainerLight
          : AppColorPrimitives.warningContainerDark,
      onWarningContainer: isLight
          ? AppColorPrimitives.onWarningContainerLight
          : AppColorPrimitives.onWarningContainerDark,
    );
  }

  static AppColorRoles _orangeRoles(Brightness brightness) {
    final isLight = brightness == Brightness.light;
    return AppColorRoles(
      primary: isLight ? AppColorPrimitives.orangeSolidLight : AppColorPrimitives.orangeSolidDark,
      onPrimary:
          isLight ? AppColorPrimitives.onOrangeSolidLight : AppColorPrimitives.onOrangeSolidDark,
      primaryContainer:
          isLight ? AppColorPrimitives.orangeContainerLight : AppColorPrimitives.orangeContainerDark,
      onPrimaryContainer: isLight
          ? AppColorPrimitives.onOrangeContainerLight
          : AppColorPrimitives.onOrangeContainerDark,
      secondary:
          isLight ? AppColorPrimitives.orangeContainerLight : AppColorPrimitives.orangeContainerDark,
      onSecondary: isLight
          ? AppColorPrimitives.onOrangeContainerLight
          : AppColorPrimitives.onOrangeContainerDark,
      background:
          isLight ? AppColorPrimitives.orangeBackgroundLight : AppColorPrimitives.orangeBackgroundDark,
      onBackground: isLight
          ? AppColorPrimitives.onOrangeBackgroundLight
          : AppColorPrimitives.onOrangeBackgroundDark,
      surface:
          isLight ? AppColorPrimitives.orangeBackgroundLight : AppColorPrimitives.orangeBackgroundDark,
      onSurface: isLight
          ? AppColorPrimitives.onOrangeBackgroundLight
          : AppColorPrimitives.onOrangeBackgroundDark,
      error: isLight
          ? AppColorPrimitives.onOrangeErrorContainerLight
          : AppColorPrimitives.onOrangeErrorContainerDark,
      onError: isLight ? Colors.white : AppColorPrimitives.orangeErrorContainerDark,
      errorContainer: isLight
          ? AppColorPrimitives.orangeErrorContainerLight
          : AppColorPrimitives.orangeErrorContainerDark,
      onErrorContainer: isLight
          ? AppColorPrimitives.onOrangeErrorContainerLight
          : AppColorPrimitives.onOrangeErrorContainerDark,
      success: isLight ? AppColorPrimitives.successLight : AppColorPrimitives.successDark,
      onSuccess: isLight ? AppColorPrimitives.onSuccessLight : AppColorPrimitives.onSuccessDark,
      successContainer: isLight
          ? AppColorPrimitives.successContainerLight
          : AppColorPrimitives.successContainerDark,
      onSuccessContainer: isLight
          ? AppColorPrimitives.onSuccessContainerLight
          : AppColorPrimitives.onSuccessContainerDark,
      warning: isLight ? AppColorPrimitives.warningLight : AppColorPrimitives.warningDark,
      onWarning: isLight ? AppColorPrimitives.onWarningLight : AppColorPrimitives.onWarningDark,
      warningContainer: isLight
          ? AppColorPrimitives.warningContainerLight
          : AppColorPrimitives.warningContainerDark,
      onWarningContainer: isLight
          ? AppColorPrimitives.onWarningContainerLight
          : AppColorPrimitives.onWarningContainerDark,
    );
  }

  /// Builds the [ColorScheme] to plug directly into [ThemeData.colorScheme],
  /// so plain Material widgets and [AppColorRoles] stay visually consistent.
  static ColorScheme colorScheme(Brightness brightness, {AppBrand brand = AppBrand.indigo}) {
    final seed = brand == AppBrand.indigo ? AppColorPrimitives.indigoSeed : AppColorPrimitives.orangeSeed;
    return ColorScheme.fromSeed(seedColor: seed, brightness: brightness);
  }
}

/// Convenience accessor: `context.colors.primary`.
extension AppColorRolesContext on BuildContext {
  AppColorRoles get colors {
    final roles = Theme.of(this).extension<AppColorRoles>();
    if (roles != null) return roles;
    return AppColorTokens.light();
  }
}
