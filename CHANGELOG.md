## [Unreleased]

- **Breaking (instalación por `git:`)**: el paquete se movió de `packages/design_system` a la raíz del repo — mismo formato que `growth_flutter_fase_03_riverpood` (paquete en la raíz + `example/` como app consumidora), ya sin Melos. Quien dependa de este repo vía `git:` debe sacar el `path: packages/design_system` de su `pubspec.yaml` (la dependencia ahora apunta directo a la raíz del repo). La API pública (`design_system.dart` y sus exports) no cambió.
- `AppDropdownItem` movido a su propio archivo (`app_dropdown_item.dart`) — antes compartía archivo con `AppDropdownField`.
- README reordenado para seguir la convención de paquete (Requisitos → Instalación → Inicialización → Uso → Arquitectura al final).
- Reemplazados los usos de `!` (force unwrap) en `AppPasswordField`, `AppCard`, `AppBanner` y `AppEmptyState` por variables locales promovidas.

## 0.1.0

Primera versión usable del design system.

- Tokens: colores (marcas `indigo`/`orange`, light/dark), tipografía (Inter), espaciado, radios, elevation, tamaños de ícono, opacidad. `AppTheme.light()`/`AppTheme.dark()` arma el `ThemeData` completo.
- Atoms: `AppButton` (medium/small, solid/light/outline, destructive, loading), `AppLoader`.
- Molecules: `AppCard` (elevated/outlined/filled, header/footer), `AppChip` (assist/filter/input), `AppTextField`, `AppPasswordField`, `AppDropdownField`, `AppPhoneField`.
- Organisms: `AppBanner` (info/success/warning/error), `AppEmptyState`.

## 0.0.1

* Esqueleto inicial del paquete (sin componentes).
