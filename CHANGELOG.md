# Changelog

All notable changes to this project are documented in this file.

The format is based on [Keep a Changelog](https://keepachangelog.com/en/1.1.0/)
and this project adheres to [Semantic Versioning](https://semver.org/).

## [Unreleased]

## [0.3.0] - 2026-09-09

### Added

- Added the Inter font family as local package assets and updated the typography
  configuration to resolve it from the package itself.
- Added dedicated tokens to centralize `AppButton`'s visual dimensions.

### Changed

- **Breaking change**: renamed the package and its public import from
  `design_system` to `app_ui_kit`, together with the references in the example
  app and documentation.
- Updated the minimum supported Flutter version to `>=3.35.0`.
- Updated typography tokens for light and dark modes, high elevation, and the
  `AppPhoneField` implementation.

### Fixed

- `AppTextField` and the shared field decoration now display visible borders.
- `AppColorTokens.colorScheme` now shares semantic roles with `context.colors`
  for the selected brand and brightness.

## [0.2.2] - 2026-09-05

- `AppButton`: the label (and leading/trailing icons) ignored the foreground
  color calculated for each variant (`onError`, `onErrorContainer`,
  `onPrimary`, etc.) because `Text` used
  `Theme.of(context).textTheme.labelLarge/labelMedium` directly. That color is
  fixed to `onSurface` by `AppTypographyTokens.textTheme`. In dark mode, this
  could make the text nearly illegible on `light`/`solid` emphasis backgrounds
  such as destructive buttons. The correct color, including the disabled state,
  is now applied explicitly through `copyWith`/`color`.
- `AppBanner`: the inline action underline (`actionLabel`) appeared black
  instead of using the text color because `TextStyle.decorationColor` does not
  inherit `color`. It now uses the same `style.foreground` as the rest of the
  text.
- Example (`ShowcaseHomePage`): the "Toggle theme" icon did not reflect the
  actual theme when `themeMode` was `ThemeMode.system` because it only compared
  against `ThemeMode.dark`. It now derives the effective brightness with
  `MediaQuery.platformBrightnessOf`. The brand `SegmentedButton` also split
  "Orange" in narrow layouts; `showSelectedIcon` was disabled and
  `softWrap: false`/`TextOverflow.ellipsis` were applied to the labels.

## [0.2.1] - 2026-09-05

- `AppTypographyTokens.textTheme` no longer hardcodes the base color
  (`Color(0xFF1B1B1F)`/`Color(0xFFE4E1E6)`); it receives `baseColor`, and
  `AppTheme` passes `AppColorRoles.onSurface`, resolved by brand and brightness
  through the token pipeline.
- `AppPhoneField` no longer uses `AppIconSize.md` as the flag emoji's
  `fontSize`, which mixed the icon and typography scales; it now uses
  `Theme.of(context).textTheme.titleLarge`.
- Completed two doc comments (`///`) that were truncated halfway through the
  sentence in `AppLoader.message` and `AppDropdownField.enabled`.
- Renamed the `AppChip` example page from `TagsPage`/`tags_page.dart` to
  `ChipsPage`/`chips_page.dart` to match the official `chips` category instead
  of `Tags`.
- Documented the root package migration to `very_good_analysis` in the README.

## [0.2.0] - 2026-09-04

- **Breaking change (installation via `git:`)**: moved the package from
  `packages/design_system` to the repository root, following the same structure
  as `growth_flutter_fase_03_riverpood` (root package plus `example/` consumer
  app), without Melos. Consumers depending on this repository via `git:` must
  remove `path: packages/design_system` from their `pubspec.yaml` because the
  dependency now points directly to the repository root. The public API
  (`design_system.dart` and its exports) did not change.
- Moved `AppDropdownItem` to its own file (`app_dropdown_item.dart`); it
  previously shared a file with `AppDropdownField`.
- Reordered the README to follow the package convention (Requirements →
  Installation → Initialization → Usage → Architecture at the end).
- Replaced `!` (force unwrap) usages in `AppPasswordField`, `AppCard`,
  `AppBanner`, and `AppEmptyState` with locally promoted variables.
- Migrated the package linting from `flutter_lints` to `very_good_analysis`
  (`example/` still uses `flutter_lints`). Documented the entire public API with
  `///` to satisfy `public_member_api_docs`; disabled that single rule, with a
  documented reason, in `color_primitives.dart` and `color_roles.dart` because
  their constants and roles are self-explanatory by name.
- Converted `AppButtonSize`/`AppLoaderSize` to *enhanced enums* exposing
  `visualHeight`/`diameter` instead of resolving them through a private getter
  in `AppButton`/`AppLoader`; this also removed a hardcoded `36.0` from
  `AppButton`.
- Cleaned up duplicate/circular imports that only existed to resolve dartdoc
  links (`[AppTextField]`, `[AppChip]`, etc.) in `app_phone_field.dart`,
  `app_banner_variant.dart`, `app_brand.dart`, and the two token files mentioned
  above.

## [0.1.0]

First usable version of the design system.

- Tokens: colors (`indigo`/`orange` brands, light/dark), typography (Inter),
  spacing, radii, elevation, icon sizes, and opacity. `AppTheme.light()` /
  `AppTheme.dark()` build the complete `ThemeData`.
- Atoms: `AppButton` (medium/small, solid/light/outline, destructive, loading),
  `AppLoader`.
- Molecules: `AppCard` (elevated/outlined/filled, header/footer), `AppChip`
  (assist/filter/input), `AppTextField`, `AppPasswordField`,
  `AppDropdownField`, `AppPhoneField`.
- Organisms: `AppBanner` (info/success/warning/error), `AppEmptyState`.

## [0.0.1]

* Initial package skeleton (no components).

[Unreleased]: https://github.com/abialex/growth_flutter_fase_04_riverpood/compare/v0.3.0...HEAD
[0.3.0]: https://github.com/abialex/growth_flutter_fase_04_riverpood/releases/tag/v0.3.0
[0.2.2]: https://github.com/abialex/growth_flutter_fase_04_riverpood/releases/tag/v0.2.2
[0.2.1]: https://github.com/abialex/growth_flutter_fase_04_riverpood/releases/tag/v0.2.1
[0.2.0]: https://github.com/abialex/growth_flutter_fase_04_riverpood/releases/tag/v0.2.0
[0.1.0]: https://github.com/abialex/growth_flutter_fase_04_riverpood/releases/tag/v0.1.0
[0.0.1]: https://github.com/abialex/growth_flutter_fase_04_riverpood/releases/tag/v0.0.1
