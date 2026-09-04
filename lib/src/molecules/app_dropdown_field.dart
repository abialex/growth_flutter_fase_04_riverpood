import 'package:flutter/material.dart';

import '../tokens/color_tokens.dart';
import 'app_dropdown_item.dart';
import 'internal/app_field_decoration.dart';

/// Filled dropdown field, styled to match [AppTextField].
class AppDropdownField<T> extends StatelessWidget {
  const AppDropdownField({
    required this.items,
    required this.onChanged,
    super.key,
    this.initialValue,
    this.hint,
    this.label,
    this.enabled = true,
  });

  final List<AppDropdownItem<T>> items;
  final ValueChanged<T?> onChanged;
  final T? initialValue;
  final String? hint;
  final String? label;
  final bool enabled;

  @override
  Widget build(BuildContext context) {
    final colors = context.colors;

    return DropdownButtonFormField<T>(
      initialValue: initialValue,
      onChanged: enabled ? onChanged : null,
      icon: Icon(Icons.keyboard_arrow_down, color: colors.primary),
      decoration: buildAppFieldDecoration(
        colors: colors,
        hintText: hint,
        labelText: label,
        isDisabled: !enabled,
      ),
      items: [
        for (final item in items)
          DropdownMenuItem<T>(value: item.value, child: Text(item.label)),
      ],
    );
  }
}
