import 'package:flutter/material.dart';

import '../tokens/border_width_tokens.dart';
import '../tokens/color_roles.dart';
import '../tokens/color_tokens.dart';
import '../tokens/enums/app_emphasis.dart';
import '../tokens/opacity_tokens.dart';
import 'enums/app_chip_type.dart';

/// Pill-shaped chip. [type] `assist` (default) is a plain tag — pass
/// [onTap]. `filter` is selectable — pass [isSelected] and [onSelected].
/// `input` shows a trailing delete icon — pass [onDeleted].
///
/// Thin styling layer over Flutter's own [Chip]/[ActionChip]/[FilterChip]/
/// [InputChip] — not hand-rolled `Material`+`InkWell`. Same reasoning as
/// [AppButton]: keyboard focus/hover and chip semantics come for free
/// instead of us reimplementing them.
class AppChip extends StatelessWidget {
  const AppChip({
    required this.label,
    super.key,
    this.type = AppChipType.assist,
    this.emphasis = AppEmphasis.light,
    this.isDisabled = false,
    this.isSelected = false,
    this.onTap,
    this.onSelected,
    this.onDeleted,
  });

  final String label;
  final AppChipType type;
  final AppEmphasis emphasis;
  final bool isDisabled;
  final bool isSelected;
  final VoidCallback? onTap;
  final ValueChanged<bool>? onSelected;
  final VoidCallback? onDeleted;

  @override
  Widget build(BuildContext context) {
    final colors = context.colors;
    final textStyle = Theme.of(context).textTheme.labelMedium;
    final isFilterSelected = type == AppChipType.filter && isSelected;

    final background = _resolveBackgroundColor(colors, emphasis);
    final foreground =
        isDisabled ? _disabledForeground(colors) : _resolveForegroundColor(colors, emphasis);
    final selectedBackground = colors.primary;
    final selectedForeground = colors.onPrimary;
    final side = emphasis == AppEmphasis.outline
        ? BorderSide(color: isDisabled ? foreground : colors.primary, width: AppBorderWidth.medium)
        : BorderSide.none;
    const shape = StadiumBorder();
    final labelStyle = textStyle?.copyWith(color: isFilterSelected ? selectedForeground : foreground);

    return switch (type) {
      AppChipType.filter => FilterChip(
          label: Text(label),
          labelStyle: labelStyle,
          selected: isSelected,
          onSelected: isDisabled ? null : onSelected,
          backgroundColor: background,
          selectedColor: selectedBackground,
          disabledColor: _disabledBackground(colors),
          checkmarkColor: selectedForeground,
          side: side,
          shape: shape,
        ),
      AppChipType.input => InputChip(
          label: Text(label),
          labelStyle: labelStyle,
          isEnabled: !isDisabled,
          onPressed: onTap,
          onDeleted: onDeleted,
          deleteIconColor: foreground,
          backgroundColor: background,
          disabledColor: _disabledBackground(colors),
          side: side,
          shape: shape,
        ),
      AppChipType.assist when onTap != null => ActionChip(
          label: Text(label),
          labelStyle: labelStyle,
          onPressed: isDisabled ? null : onTap,
          backgroundColor: background,
          disabledColor: _disabledBackground(colors),
          side: side,
          shape: shape,
        ),
      AppChipType.assist => Chip(
          label: Text(label),
          labelStyle: labelStyle,
          backgroundColor: isDisabled ? _disabledBackground(colors) : background,
          side: side,
          shape: shape,
        ),
    };
  }

  Color _resolveBackgroundColor(AppColorRoles colors, AppEmphasis emphasis) {
    return switch (emphasis) {
      AppEmphasis.solid => colors.primary,
      AppEmphasis.light => colors.primaryContainer,
      AppEmphasis.outline => colors.surface,
    };
  }

  Color _resolveForegroundColor(AppColorRoles colors, AppEmphasis emphasis) {
    return switch (emphasis) {
      AppEmphasis.solid => colors.onPrimary,
      AppEmphasis.light => colors.onPrimaryContainer,
      AppEmphasis.outline => colors.primary,
    };
  }

  Color _disabledBackground(AppColorRoles colors) =>
      colors.onSurface.withValues(alpha: AppOpacity.disabledBackground);

  Color _disabledForeground(AppColorRoles colors) =>
      colors.onSurface.withValues(alpha: AppOpacity.disabledForeground);
}
