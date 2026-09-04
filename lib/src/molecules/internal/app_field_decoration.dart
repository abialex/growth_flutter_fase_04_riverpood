import 'package:design_system/design_system.dart'
    show AppDropdownField, AppPasswordField, AppPhoneField, AppTextField;
import 'package:design_system/src/molecules/molecules.dart'
    show AppDropdownField, AppPasswordField, AppPhoneField, AppTextField;
import 'package:design_system/src/tokens/border_width_tokens.dart';
import 'package:design_system/src/tokens/color_roles.dart';
import 'package:design_system/src/tokens/opacity_tokens.dart';
import 'package:design_system/src/tokens/radius_tokens.dart';
import 'package:design_system/src/tokens/spacing_tokens.dart';
import 'package:flutter/material.dart';

/// Shared, filled-style [InputDecoration] used by every text-field-family
/// molecule ([AppTextField], [AppPasswordField], [AppDropdownField],
/// [AppPhoneField]) so they stay visually consistent.
InputDecoration buildAppFieldDecoration({
  required AppColorRoles colors,
  String? hintText,
  String? labelText,
  String? helperText,
  String? errorText,
  Widget? prefixIcon,
  Widget? suffixIcon,
  bool isDisabled = false,
}) {
  final hasError = errorText != null && errorText.isNotEmpty;
  final borderRadius = BorderRadius.circular(AppRadius.lg);
  final noBorder = OutlineInputBorder(
    borderRadius: borderRadius,
    borderSide: BorderSide.none,
  );

  final backgroundColor = isDisabled
      ? colors.onSurface.withValues(alpha: AppOpacity.disabledBackground)
      : hasError
      ? colors.errorContainer
      : colors.surface;
  final contentColor = isDisabled
      ? colors.onSurface.withValues(alpha: AppOpacity.disabledForeground)
      : hasError
      ? colors.onErrorContainer
      : colors.onSurface;

  return InputDecoration(
    filled: true,
    fillColor: backgroundColor,
    hintText: hintText,
    labelText: labelText,
    helperText: hasError ? null : helperText,
    errorText: hasError ? errorText : null,
    prefixIcon: prefixIcon,
    suffixIcon: suffixIcon,
    hintStyle: TextStyle(
      color: hasError ? colors.onErrorContainer : colors.primary,
    ),
    labelStyle: TextStyle(color: contentColor),
    contentPadding: const EdgeInsets.symmetric(
      horizontal: AppSpacing.md,
      vertical: AppSpacing.sm,
    ),
    border: noBorder,
    enabledBorder: noBorder,
    disabledBorder: noBorder,
    errorBorder: noBorder,
    focusedBorder: OutlineInputBorder(
      borderRadius: borderRadius,
      borderSide: BorderSide(
        color: colors.primary,
        width: AppBorderWidth.medium,
      ),
    ),
    focusedErrorBorder: OutlineInputBorder(
      borderRadius: borderRadius,
      borderSide: BorderSide(
        color: colors.onErrorContainer,
        width: AppBorderWidth.medium,
      ),
    ),
    errorStyle: TextStyle(color: colors.onErrorContainer),
  );
}
