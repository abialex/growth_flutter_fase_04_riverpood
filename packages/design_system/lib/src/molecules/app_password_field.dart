import 'package:flutter/material.dart';

import '../tokens/color_tokens.dart';
import '../tokens/opacity_tokens.dart';
import 'internal/app_field_decoration.dart';

/// Password text field with a show/hide toggle. `errorText` != null
/// switches it into the error visual state.
class AppPasswordField extends StatefulWidget {
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

  final TextEditingController? controller;
  final String? label;
  final String? hint;
  final String? helperText;
  final String? errorText;
  final bool enabled;
  final ValueChanged<String>? onChanged;

  @override
  State<AppPasswordField> createState() => _AppPasswordFieldState();
}

class _AppPasswordFieldState extends State<AppPasswordField> {
  bool _isObscured = true;

  @override
  Widget build(BuildContext context) {
    final colors = context.colors;
    final hasError = widget.errorText != null && widget.errorText!.isNotEmpty;
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
          icon: Icon(_isObscured ? Icons.visibility_off_outlined : Icons.visibility_outlined),
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
