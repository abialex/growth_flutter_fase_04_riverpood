import 'package:design_system/src/molecules/app_password_field.dart';
import 'package:design_system/src/molecules/internal/app_field_decoration.dart';
import 'package:design_system/src/tokens/color_tokens.dart';
import 'package:design_system/src/tokens/opacity_tokens.dart';
import 'package:flutter/material.dart';

/// Filled, borderless-by-default text field. `errorText` != null switches
/// it into the error visual state (tinted background, red helper text).
/// Pass [maxLength] to show a character counter, [readOnly] for a
/// display-only field that still looks interactive.
class AppTextField extends StatelessWidget {
  /// Creates a text field. Every parameter is optional — pass [errorText]
  /// to switch it into the error visual state.
  const AppTextField({
    super.key,
    this.controller,
    this.label,
    this.hint,
    this.helperText,
    this.errorText,
    this.enabled = true,
    this.readOnly = false,
    this.obscureText = false,
    this.keyboardType,
    this.maxLength,
    this.onChanged,
    this.onTap,
    this.prefixIcon,
    this.suffixIcon,
  });

  /// Controls and reads the field's text. If `null`, the field manages its
  /// own internal state.
  final TextEditingController? controller;

  /// Label shown above the field.
  final String? label;

  /// Placeholder text shown when the field is empty.
  final String? hint;

  /// Helper text shown below the field when there's no [errorText].
  final String? helperText;

  /// Error message shown below the field. Non-null and non-empty switches
  /// the field into its error visual state, replacing [helperText].
  final String? errorText;

  /// Whether the field accepts input. `false` renders it disabled.
  final bool enabled;

  /// Makes the field non-editable while still looking interactive, for
  /// display-only values (e.g. opening a picker on tap instead of typing).
  final bool readOnly;

  /// Masks the text, for password-like input without the show/hide toggle
  /// [AppPasswordField] has.
  final bool obscureText;

  /// Keyboard type shown for this field (e.g. numeric, email).
  final TextInputType? keyboardType;

  /// Maximum character count. When set, shows a counter below the field.
  final int? maxLength;

  /// Called with the current text every time it changes.
  final ValueChanged<String>? onChanged;

  /// Called when the field is tapped.
  final VoidCallback? onTap;

  /// Optional icon shown before the text.
  final IconData? prefixIcon;

  /// Optional widget shown after the text (e.g. a clear or toggle button).
  final Widget? suffixIcon;

  @override
  Widget build(BuildContext context) {
    final colors = context.colors;
    final textColor = enabled
        ? colors.onSurface
        : colors.onSurface.withValues(alpha: AppOpacity.disabledForeground);

    return TextField(
      controller: controller,
      enabled: enabled,
      readOnly: readOnly,
      obscureText: obscureText,
      keyboardType: keyboardType,
      maxLength: maxLength,
      onChanged: onChanged,
      onTap: onTap,
      style: TextStyle(color: textColor),
      decoration: buildAppFieldDecoration(
        colors: colors,
        hintText: hint,
        labelText: label,
        helperText: helperText,
        errorText: errorText,
        isDisabled: !enabled,
        prefixIcon: prefixIcon != null
            ? Icon(prefixIcon, color: colors.primary)
            : null,
        suffixIcon: suffixIcon,
      ),
    );
  }
}
