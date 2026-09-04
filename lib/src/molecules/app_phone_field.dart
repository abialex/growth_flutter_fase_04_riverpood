import 'package:flutter/material.dart';

import '../tokens/border_width_tokens.dart';
import '../tokens/color_tokens.dart';
import '../tokens/icon_size_tokens.dart';
import '../tokens/opacity_tokens.dart';
import '../tokens/radius_tokens.dart';
import '../tokens/spacing_tokens.dart';

/// Phone number field with a leading country-code selector (flag + dial
/// code + chevron), merged into a single filled pill-like container. Fills
/// the available width, like [AppTextField].
class AppPhoneField extends StatelessWidget {
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
  final String countryCode;
  final VoidCallback onCountryTap;
  final TextEditingController? controller;
  final String? hint;
  final ValueChanged<String>? onChanged;
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
            borderRadius: BorderRadius.horizontal(left: Radius.circular(AppRadius.lg)),
            onTap: enabled ? onCountryTap : null,
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: AppSpacing.md, vertical: AppSpacing.sm),
              child: Row(
                mainAxisSize: MainAxisSize.min,
                children: [
                  Text(countryFlag, style: const TextStyle(fontSize: AppIconSize.md)),
                  const SizedBox(width: AppSpacing.xs),
                  Text(countryCode, style: TextStyle(color: textColor, fontWeight: FontWeight.w600)),
                  Icon(Icons.keyboard_arrow_down, color: colors.primary, size: AppIconSize.md),
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
