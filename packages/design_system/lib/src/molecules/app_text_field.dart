import 'package:flutter/material.dart';

import '../tokens/color_tokens.dart';
import '../tokens/opacity_tokens.dart';
import 'internal/app_field_decoration.dart';

/// Filled, borderless-by-default text field. `errorText` != null switches
/// it into the error visual state (tinted background, red helper text).
/// Pass [maxLength] to show a character counter, [readOnly] for a
/// display-only field that still looks interactive.
class AppTextField extends StatelessWidget {
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

  final TextEditingController? controller;
  final String? label;
  final String? hint;
  final String? helperText;
  final String? errorText;
  final bool enabled;
  final bool readOnly;
  final bool obscureText;
  final TextInputType? keyboardType;
  final int? maxLength;
  final ValueChanged<String>? onChanged;
  final VoidCallback? onTap;
  final IconData? prefixIcon;
  final Widget? suffixIcon;

  @override
  Widget build(BuildContext context) {
    final colors = context.colors;
    final textColor =
        enabled ? colors.onSurface : colors.onSurface.withValues(alpha: AppOpacity.disabledForeground);

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
        prefixIcon: prefixIcon != null ? Icon(prefixIcon, color: colors.primary) : null,
        suffixIcon: suffixIcon,
      ),
    );
  }
}
