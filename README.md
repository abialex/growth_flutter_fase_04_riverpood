# Growth Design System

Monorepo (Melos) para construir un sistema de diseño reutilizable en Flutter y documentarlo visualmente.

Este paquete (`packages/design_system`) es la base de esta fase (4) y será consumido por la app compleja de la **fase 5** para mantener consistencia visual entre ambas. Por eso se mantiene independiente, sin dependencias hacia `apps/showcase` ni hacia detalles propios de este repo.

## Estructura

- `packages/design_system` — paquete Flutter con tokens, atoms, molecules y organisms (colores en dos marcas, tipografía, espaciados/radios, botones, tags/chips, text fields, cards, loaders, banners/empty states). Publicable/reutilizable en otros proyectos — ver [`packages/design_system/README.md`](packages/design_system/README.md).
- `apps/showcase` — app Riverpod que consume `design_system` y documenta visualmente cada token y componente, organizados por categoría — ver [`apps/showcase/README.md`](apps/showcase/README.md).

## Documentación

Cada paquete tiene su propio README con más detalle:

- [`packages/design_system/README.md`](packages/design_system/README.md) — qué es el paquete, cómo instalarlo/importarlo (incluye cómo consumirlo desde otro repo vía dependencia git), estructura interna, cómo contribuir un componente nuevo.
- [`apps/showcase/README.md`](apps/showcase/README.md) — cómo correr la app y qué muestra cada categoría.

## Comandos

```bash
dart pub get               # resuelve el workspace raíz (incluye melos)
dart run melos bootstrap   # enlaza todos los paquetes del monorepo
dart run melos run analyze
dart run melos run test
flutter run -d chrome      # correr el showcase (desde apps/showcase)
```
