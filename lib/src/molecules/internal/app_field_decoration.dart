import 'package:app_ui_kit/src/tokens/border_width_tokens.dart';
import 'package:app_ui_kit/src/tokens/color_roles.dart';
import 'package:app_ui_kit/src/tokens/opacity_tokens.dart';
import 'package:app_ui_kit/src/tokens/radius_tokens.dart';
import 'package:app_ui_kit/src/tokens/spacing_tokens.dart';
import 'package:flutter/material.dart';

/// Shared, filled-style [InputDecoration] used by every text-field-family
/// molecule so they stay visually consistent.
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
  final defaultBorder = OutlineInputBorder(
    borderRadius: borderRadius,
    borderSide: BorderSide(
      color: colors.onSurface.withValues(alpha: AppOpacity.border),
      width: AppBorderWidth.thin,
    ),
  );
  final errorBorder = OutlineInputBorder(
    borderRadius: borderRadius,
    borderSide: BorderSide(
      color: colors.error,
      width: AppBorderWidth.thin,
    ),
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
    border: defaultBorder,
    enabledBorder: defaultBorder,
    disabledBorder: defaultBorder,
    errorBorder: errorBorder,
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
