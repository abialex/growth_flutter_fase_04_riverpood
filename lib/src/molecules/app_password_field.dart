import 'package:design_system/src/molecules/internal/app_field_decoration.dart';
import 'package:design_system/src/tokens/color_tokens.dart';
import 'package:design_system/src/tokens/opacity_tokens.dart';
import 'package:flutter/material.dart';

/// Password text field with a show/hide toggle. `errorText` != null
/// switches it into the error visual state.
class AppPasswordField extends StatefulWidget {
  /// Creates a password field. Every parameter is optional — pass
  /// [errorText] to switch it into the error visual state.
  const AppPasswordField({
    super.key,
    this.controller,
    this.label,
    this.hint,
    this.helperText,
    this.errorText,
    this.enabled = true,
    this.onChanged,
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

  /// Called with the current text every time it changes.
  final ValueChanged<String>? onChanged;

  @override
  State<AppPasswordField> createState() => _AppPasswordFieldState();
}

class _AppPasswordFieldState extends State<AppPasswordField> {
  bool _isObscured = true;

  @override
  Widget build(BuildContext context) {
    final colors = context.colors;
    final errorText = widget.errorText;
    final hasError = errorText != null && errorText.isNotEmpty;
    final iconColor = !widget.enabled
        ? colors.onSurface.withValues(alpha: AppOpacity.disabledForeground)
        : hasError
        ? colors.onErrorContainer
        : colors.primary;
    final textColor = !widget.enabled
        ? colors.onSurface.withValues(alpha: AppOpacity.disabledForeground)
        : hasError
        ? colors.onErrorContainer
        : colors.onSurface;

    return TextField(
      controller: widget.controller,
      enabled: widget.enabled,
      obscureText: _isObscured,
      onChanged: widget.onChanged,
      style: TextStyle(color: textColor),
      decoration: buildAppFieldDecoration(
        colors: colors,
        hintText: widget.hint,
        labelText: widget.label,
        helperText: widget.helperText,
        errorText: widget.errorText,
        isDisabled: !widget.enabled,
        suffixIcon: IconButton(
          icon: Icon(
            _isObscured
                ? Icons.visibility_off_outlined
                : Icons.visibility_outlined,
          ),
          color: iconColor,
          onPressed: widget.enabled ? _onToggleObscured : null,
        ),
      ),
    );
  }

  void _onToggleObscured() {
    setState(() => _isObscured = !_isObscured);
  }
}
