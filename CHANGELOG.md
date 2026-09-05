## 0.2.1 - 2026-09-05

- `AppTypographyTokens.textTheme` ya no hardcodea el color base (`Color(0xFF1B1B1F)`/`Color(0xFFE4E1E6)`); recibe `baseColor` y `AppTheme` le pasa `AppColorRoles.onSurface`, resuelto por marca/brillo desde el pipeline de tokens.
- `AppPhoneField` ya no usa `AppIconSize.md` como `fontSize` del emoji de bandera (mezclaba la escala de íconos con la tipográfica); ahora toma `Theme.of(context).textTheme.titleLarge`.
- Completados dos doc comments (`///`) que quedaban truncados a mitad de frase en `AppLoader.message` y `AppDropdownField.enabled`.
- Página de ejemplo de `AppChip` renombrada de `TagsPage`/`tags_page.dart` a `ChipsPage`/`chips_page.dart` para que coincida con la categoría oficial "chips" en vez de "Tags".
- README: mencionada la migración a `very_good_analysis` en el paquete raíz.

## 0.2.0 - 2026-09-04

- **Breaking (instalación por `git:`)**: el paquete se movió de `packages/design_system` a la raíz del repo — mismo formato que `growth_flutter_fase_03_riverpood` (paquete en la raíz + `example/` como app consumidora), ya sin Melos. Quien dependa de este repo vía `git:` debe sacar el `path: packages/design_system` de su `pubspec.yaml` (la dependencia ahora apunta directo a la raíz del repo). La API pública (`design_system.dart` y sus exports) no cambió.
- `AppDropdownItem` movido a su propio archivo (`app_dropdown_item.dart`) — antes compartía archivo con `AppDropdownField`.
- README reordenado para seguir la convención de paquete (Requisitos → Instalación → Inicialización → Uso → Arquitectura al final).
- Reemplazados los usos de `!` (force unwrap) en `AppPasswordField`, `AppCard`, `AppBanner` y `AppEmptyState` por variables locales promovidas.
- Lint del paquete migrado de `flutter_lints` a `very_good_analysis` (`example/` sigue con `flutter_lints`). Toda la API pública quedó documentada (`///`) para cumplir `public_member_api_docs`; se desactivó esa única regla, con motivo documentado, en `color_primitives.dart` y `color_roles.dart` (constantes/roles ya autoexplicativos por nombre).
- `AppButtonSize`/`AppLoaderSize` pasaron a ser *enhanced enums*: exponen `visualHeight`/`diameter` en vez de que `AppButton`/`AppLoader` lo resuelvan con un getter privado — de paso se sacó un `36.0` hardcodeado en `AppButton`.
- Limpiados varios imports duplicados/circulares que solo existían para que un link de dartdoc (`[AppTextField]`, `[AppChip]`, etc.) resolviera, en `app_phone_field.dart`, `app_banner_variant.dart`, `app_brand.dart` y los dos archivos de tokens ya mencionados.

## 0.1.0

Primera versión usable del design system.

- Tokens: colores (marcas `indigo`/`orange`, light/dark), tipografía (Inter), espaciado, radios, elevation, tamaños de ícono, opacidad. `AppTheme.light()`/`AppTheme.dark()` arma el `ThemeData` completo.
- Atoms: `AppButton` (medium/small, solid/light/outline, destructive, loading), `AppLoader`.
- Molecules: `AppCard` (elevated/outlined/filled, header/footer), `AppChip` (assist/filter/input), `AppTextField`, `AppPasswordField`, `AppDropdownField`, `AppPhoneField`.
- Organisms: `AppBanner` (info/success/warning/error), `AppEmptyState`.

## 0.0.1

* Esqueleto inicial del paquete (sin componentes).
