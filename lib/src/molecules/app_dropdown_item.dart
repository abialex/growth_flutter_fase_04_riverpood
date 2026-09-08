import 'package:app_ui_kit/app_ui_kit.dart' show AppDropdownField;
import 'package:app_ui_kit/src/molecules/app_dropdown_field.dart' show AppDropdownField;
import 'package:app_ui_kit/src/molecules/molecules.dart' show AppDropdownField;

/// One selectable option for [AppDropdownField].
class AppDropdownItem<T> {
  /// Creates a dropdown item with a [value] and [label]. The [label] is
  /// displayed in the dropdown menu, and the [value] is returned when the item
  /// is selected.
  const AppDropdownItem({required this.value, required this.label});

  /// The value associated with this item. This is returned when the item is
  /// selected.
  final T value;

  /// The label displayed in the dropdown menu for this item.
  final String label;
}
