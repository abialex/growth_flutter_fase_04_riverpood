import 'package:design_system/design_system.dart' show AppTextField;
import 'package:design_system/src/molecules/app_dropdown_item.dart';
import 'package:design_system/src/molecules/app_text_field.dart'
    show AppTextField;
import 'package:design_system/src/molecules/internal/app_field_decoration.dart';
import 'package:design_system/src/molecules/molecules.dart' show AppTextField;
import 'package:design_system/src/tokens/color_tokens.dart';
import 'package:flutter/material.dart';

/// Filled dropdown field, styled to match [AppTextField].
class AppDropdownField<T> extends StatelessWidget {
  /// Creates a dropdown field. [items] is required, and [onChanged] is called
  /// when the user selects a new value. [initialValue] is optional, and if
  /// provided, the dropdown will show that value as selected when first built.
  const AppDropdownField({
    required this.items,
    required this.onChanged,
    super.key,
    this.initialValue,
    this.hint,
    this.label,
    this.enabled = true,
  });

  /// List of items to show in the dropdown. Each item has a value and a label.
  final List<AppDropdownItem<T>> items;

  /// Called when the user selects a new value. The value is the `value` of the
  /// selected [AppDropdownItem].
  final ValueChanged<T?> onChanged;

  /// The value to show as selected when the dropdown is first built. If `null`,
  /// no value is selected initially.
  final T? initialValue;

  /// Hint text to show when no value is selected. If `null`, no hint is shown.
  final String? hint;

  /// Label text to show above the dropdown. If `null`, no label is shown.
  final String? label;

  /// Whether the dropdown is enabled. If `false`, the dropdown is disabled and
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
