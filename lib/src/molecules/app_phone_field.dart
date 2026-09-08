import 'package:app_ui_kit/src/molecules/internal/app_field_decoration.dart';
import 'package:app_ui_kit/src/tokens/color_roles.dart';
import 'package:app_ui_kit/src/tokens/color_tokens.dart';
import 'package:app_ui_kit/src/tokens/icon_size_tokens.dart';
import 'package:app_ui_kit/src/tokens/opacity_tokens.dart';
import 'package:app_ui_kit/src/tokens/radius_tokens.dart';
import 'package:app_ui_kit/src/tokens/spacing_tokens.dart';
import 'package:flutter/material.dart';

/// Phone number field with a leading country-code selector (flag + dial
/// code + chevron), merged into the same filled field decoration used by the
/// other text fields. Fills the available width.
class AppPhoneField extends StatelessWidget {
  /// Creates a phone field. [countryFlag], [countryCode] and
  /// [onCountryTap] are required — everything else is optional.
  const AppPhoneField({
    required this.countryFlag,
    required this.countryCode,
    required this.onCountryTap,
    super.key,
    this.controller,
    this.hint,
    this.onChanged,
    this.enabled = true,
  });

  /// Emoji flag (e.g. `'🇵🇪'`) — avoids depending on a flag-asset package.
  final String countryFlag;

  /// Dial code, already formatted for display (e.g. `'+51'`), not an ISO
  /// country code.
  final String countryCode;

  /// Called when the flag/code selector is tapped, to let the caller open
  /// a country picker.
  final VoidCallback onCountryTap;

  /// Controls and reads the phone number text. If `null`, the field
  /// manages its own internal state.
  final TextEditingController? controller;

  /// Placeholder text shown when the field is empty.
  final String? hint;

  /// Called with the current phone number every time it changes.
  final ValueChanged<String>? onChanged;

  /// Whether the field accepts input. `false` renders it disabled.
  final bool enabled;

  @override
  Widget build(BuildContext context) {
    final colors = context.colors;
    final textColor = enabled
        ? colors.onSurface
        : colors.onSurface.withValues(alpha: AppOpacity.disabledForeground);

    return TextField(
      controller: controller,
      enabled: enabled,
      keyboardType: TextInputType.phone,
      onChanged: onChanged,
      style: TextStyle(color: textColor),
      decoration: buildAppFieldDecoration(
        colors: colors,
        hintText: hint,
        isDisabled: !enabled,
        prefixIcon: _buildCountrySelector(context, colors, textColor),
      ),
    );
  }

  Widget _buildCountrySelector(
    BuildContext context,
    AppColorRoles colors,
    Color textColor,
  ) {
    return InkWell(
      borderRadius: const BorderRadius.horizontal(
        left: Radius.circular(AppRadius.lg),
      ),
      onTap: enabled ? onCountryTap : null,
      child: Padding(
        padding: const EdgeInsets.symmetric(
          horizontal: AppSpacing.md,
          vertical: AppSpacing.sm,
        ),
        child: Row(
          mainAxisSize: MainAxisSize.min,
          children: [
            Text(
              countryFlag,
              style: Theme.of(context).textTheme.titleLarge,
            ),
            const SizedBox(width: AppSpacing.xs),
            Text(
              countryCode,
              style: TextStyle(
                color: textColor,
                fontWeight: FontWeight.w600,
              ),
            ),
            Icon(
              Icons.keyboard_arrow_down,
              color: colors.primary,
              size: AppIconSize.md,
            ),
          ],
        ),
      ),
    );
  }
}
