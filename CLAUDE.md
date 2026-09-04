# CLAUDE.md

This file provides guidance to Claude Code (claude.ai/code) when working with code in this repository.

## What this repo is

A single Flutter/Dart package at the repo root — **not a Melos monorepo**. Same shape as `growth_flutter_fase_03_riverpood` (the sibling project this one deliberately mirrors): the package's own code lives in `lib/`, and `example/` is a separate, external Flutter app that consumes it via a local path dependency.

- **Root (`lib/`)** — a **reusable, standalone** Flutter design system (tokens → atoms → molecules → organisms). It must stay independent: no dependency on `example/` or anything specific to this repo, no business state, not runnable by itself. It is meant to be reused as-is by the app being built in "fase 5" (a sibling project), so treat any coupling to this repo as a bug.
- **`example/`** — a Riverpod app that depends on the root package via `path: ../` and visually documents every token/component, organized by category (one page per category under `example/lib/pages/`).

Read [`doc/PROJECT_RULES.md`](doc/PROJECT_RULES.md) before adding or changing any token or component — it's the source of truth for what each category (colors, typography, spacing, buttons, text fields, cards, chips, loaders, banners/empty states) must cover, and every new component must fit one of its categories. [`doc/DEV_RULES.md`](doc/DEV_RULES.md) is the process checklist derived from it (currently: button `focus` state and trailing-icon demo are the only unfinished item).

## Commands

```bash
flutter pub get            # resolve the root package
flutter analyze            # lint the root package
flutter test                # run tests (test/) in the root package
dart format .               # format the root package
```

Run the showcase app from `example/` (it has its own `pubspec.yaml`/lockfile, resolved separately):

```bash
cd example
flutter pub get
flutter run -d chrome
flutter analyze             # lint the example app too — it's a separate pub root
```

`example/pubspec.yaml` depends on the root package via `design_system: path: ../`, so any change to `lib/` is picked up immediately without republishing — no bootstrap step needed.

## Architecture: token-first, atomic design

`lib/src/` is layered strictly bottom-up; nothing may hardcode a color/size/radius/duration that a token already covers:

- `tokens/` — the only source of visual values.
  - Colors are three sub-layers: `color_primitives.dart` (raw palette, no meaning) → `color_roles.dart` (semantic roles like `primary`/`surface`/`error`, brightness-independent) → `color_tokens.dart` (roles resolved to concrete values per `Brightness`, light/dark). Widgets reference tokens only, never primitives directly.
  - `typography_tokens.dart`, `spacing_tokens.dart`, `radius_tokens.dart`, `elevation_tokens.dart`, `opacity_tokens.dart`, `border_width_tokens.dart`, `icon_size_tokens.dart` are the other single-source-of-truth scales.
  - `enums/` (e.g. `app_brand.dart`, `app_emphasis.dart`) live in their own files per [`doc/PROJECT_RULES.md`](doc/PROJECT_RULES.md)'s coding conventions — this pattern repeats per layer (`atoms/enums/`, `molecules/enums/`, `organisms/enums/`).
  - `app_theme.dart` composes tokens into the Flutter `ThemeData` consumed by both the design system and the showcase.
  - The system supports two brands (`app_brand.dart`) — color tokens must resolve per brand, not just per brightness.
- `atoms/` — indivisible widgets (`AppButton`, `AppLoader`).
- `molecules/` — atoms combined (`AppCard`, `AppChip`, `AppTextField`, `AppPasswordField`, `AppPhoneField`, `AppDropdownField`, `AppDropdownItem`); `molecules/internal/` holds shared, non-exported implementation details (e.g. `app_field_decoration.dart` backing the field family).
- `organisms/` — full sections (`AppBanner`, `AppEmptyState`).

Each layer has a barrel file (`atoms.dart`, `molecules.dart`, `organisms.dart`, `tokens.dart`) re-exported from `lib/design_system.dart`, the package's single public entry point. A new component must be added to its layer's barrel and given a demo page in `example/lib/pages/`, or it isn't considered done.

Components are "dumb": they take data and `on`-prefixed callbacks via constructor and hold no business state — app-level state belongs in `example/` (see its `providers/` for examples: `brand_provider.dart`, `theme_mode_provider.dart`), never in the package.

`google_fonts` is the only external dependency of the root package and is optional/deferred to `typography_tokens.dart`; do not add other dependencies without checking whether Flutter/Dart's SDK already solves the problem, per PROJECT_RULES.

## Project-specific conventions

See the `flutter-standards` skill for the full checklist; the highlights enforced in this codebase: English identifiers, no force-unwrap (`!`), enums split into their own files under an `enums/` directory per layer, one public class per file, UI callbacks prefixed `on`, and every color/spacing/radius/typography value sourced from `tokens/` rather than inlined.
