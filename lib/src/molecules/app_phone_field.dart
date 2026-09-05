import 'package:design_system/src/molecules/app_text_field.dart'
    show AppTextField;
import 'package:design_system/src/tokens/border_width_tokens.dart';
import 'package:design_system/src/tokens/color_tokens.dart';
import 'package:design_system/src/tokens/icon_size_tokens.dart';
import 'package:design_system/src/tokens/opacity_tokens.dart';
import 'package:design_system/src/tokens/radius_tokens.dart';
import 'package:design_system/src/tokens/spacing_tokens.dart';
import 'package:flutter/material.dart';

/// Phone number field with a leading country-code selector (flag + dial
/// code + chevron), merged into a single filled pill-like container. Fills
/// the available width, like [AppTextField].
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

    return Material(
      color: colors.surface,
      borderRadius: BorderRadius.circular(AppRadius.lg),
      child: Row(
        children: [
          InkWell(
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
          ),
          Container(
            width: AppBorderWidth.thin,
            height: AppSpacing.lg,
            color: colors.onSurface.withValues(alpha: AppOpacity.border),
          ),
          Expanded(
            child: TextField(
              controller: controller,
              enabled: enabled,
              keyboardType: TextInputType.phone,
              onChanged: onChanged,
              style: TextStyle(color: textColor),
              decoration: InputDecoration(
                hintText: hint,
                hintStyle: TextStyle(color: colors.primary),
                border: InputBorder.none,
                contentPadding: const EdgeInsets.symmetric(
                  horizontal: AppSpacing.md,
                  vertical: AppSpacing.sm,
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
