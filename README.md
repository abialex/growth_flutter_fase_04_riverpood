# design_system

Sistema de diseño reutilizable para Flutter: tokens visuales (color, tipografía, espaciado, radios) y componentes construidos sobre ellos, organizados con Atomic Design. Soporta dos marcas intercambiables (`AppBrand.indigo` / `AppBrand.orange`) y light/dark en ambas.

Este paquete **no se ejecuta por sí mismo**. Para ver todos los componentes y sus variantes/estados, corre la app showcase.

## Requisitos

- Dart `^3.9.2`
- Flutter `>=1.17.0`

## Instalación

**Desde otro repo/proyecto** (por ejemplo, la app de fase 5), como dependencia git:

```yaml
dependencies:
  design_system:
    git:
      url: https://github.com/abialex/growth_flutter_fase_04_riverpood.git
      ref: main   # mejor un tag (ej. v0.1.0) una vez que existan releases,
                  # para no arrastrar cambios de fase 4 sin querer
```

**Para trabajar en el paquete mismo** (este repo), como dependencia local desde `example/`:

```yaml
dependencies:
  design_system:
    path: ../
```

## Inicialización

Todo se importa desde un único barrel. Un solo `AppTheme` arma el `ThemeData` completo (colores, tipografía) para `MaterialApp`:

```dart
import 'package:design_system/design_system.dart';

MaterialApp(
  theme: AppTheme.light(brand: AppBrand.indigo),
  darkTheme: AppTheme.dark(brand: AppBrand.indigo),
  home: MyHome(),
);
```

## Uso

### Tokens y enums

```dart
// Colores — siempre vía context, nunca Color(0x...) hardcodeado
context.colors.primary
context.colors.onPrimaryContainer
context.colors.errorContainer

// Enums disponibles
AppBrand.indigo | AppBrand.orange
AppEmphasis.solid | AppEmphasis.light | AppEmphasis.outline

// Tipografía — sale del ThemeData que arma AppTheme, no TextStyle inline
Theme.of(context).textTheme.titleMedium
Theme.of(context).textTheme.bodyLarge

// Espaciado y radios
AppSpacing.md    // 16
AppRadius.full   // 999 (pill)

// Elevation, ancho de borde, tamaño de ícono, opacidad
AppElevation.low
AppBorderWidth.medium
AppIconSize.md
AppOpacity.disabledForeground
```

### Botones

```dart
AppButton(
  label: 'Continuar',
  onPressed: () {},
);

AppButton(
  label: 'Cancelar suscripción',
  emphasis: AppEmphasis.outline,
  isDestructive: true,
  onPressed: () {},
);

AppButton(
  label: 'Guardando...',
  isLoading: true,
  size: AppButtonSize.small,
  onPressed: () {},
);
```

### Chips / Tags

```dart
// assist — tag informativo simple
AppChip(label: 'Label Tag', emphasis: AppEmphasis.light);

// filter — seleccionable
AppChip(
  label: 'Filtrar',
  type: AppChipType.filter,
  isSelected: isSelected,
  onSelected: (value) => setState(() => isSelected = value),
);

// input — removible
AppChip(
  label: 'Flutter',
  type: AppChipType.input,
  onDeleted: () => tags.remove('Flutter'),
);
```

### Text fields

```dart
AppTextField(
  label: 'Nombre',
  hint: 'Text fill',
  errorText: hasError ? 'Campo requerido' : null,
);

AppPasswordField(
  label: 'Contraseña',
  controller: passwordController,
);

AppDropdownField<String>(
  hint: 'Selecciona',
  items: const [
    AppDropdownItem(value: 'dni', label: 'DNI'),
    AppDropdownItem(value: 'ce', label: 'Carnet de extranjería'),
  ],
  onChanged: (value) {},
);

AppPhoneField(
  countryFlag: '🇵🇪',
  countryCode: '+51',
  onCountryTap: () {},
);
```

### Cards

```dart
AppCard(
  variant: AppCardVariant.filled,
  child: const Text('Toda tu información estará segura con nosotros.'),
);

AppCard(
  variant: AppCardVariant.outlined,
  onTap: () {},
  header: const Text('Encabezado'),
  child: const Text('Contenido'),
);
```

### Loaders

```dart
AppLoader(size: AppLoaderSize.small);
AppLoader(size: AppLoaderSize.large, message: 'Cargando información...');
```

### Banners y empty states

```dart
AppBanner(
  variant: AppBannerVariant.warning,
  message: 'Tu plan vence en 3 días.',
  actionLabel: 'Renovar',
  onAction: () {},
);

AppEmptyState(
  icon: Icons.search_off_outlined,
  title: 'Sin resultados',
  description: 'No encontramos nada que coincida con tu búsqueda.',
  actionLabel: 'Limpiar filtros',
  onAction: () {},
);
```

## Ver el sistema en vivo (showcase)

```bash
cd example
flutter run -d chrome
```

La app showcase (`example/`) está organizada por categoría y muestra cada componente con todas sus variantes y estados.

## Arquitectura

> Detalle interno del paquete — no hace falta para usarlo, solo para contribuirle.

```
lib/
├── design_system.dart      # barrel público del paquete
└── src/
    ├── tokens/              # color (2 marcas), tipografía, espaciado, radios, elevation, iconos, opacidad
    ├── atoms/                # AppButton, AppLoader
    ├── molecules/            # AppCard, AppChip, AppTextField, AppPasswordField, AppDropdownField, AppPhoneField
    └── organisms/            # AppBanner, AppEmptyState
```

Cada capa expone un barrel (`tokens.dart`, `atoms.dart`, `molecules.dart`, `organisms.dart`) re-exportado desde `design_system.dart`.

### Contribuir un componente nuevo

1. Ubícalo en la capa correcta (`atoms`/`molecules`/`organisms`) según Atomic Design.
2. Usa únicamente tokens existentes — si falta uno, agrégalo primero en `src/tokens/`.
3. Expórtalo en el barrel de su capa.
4. Agrega su página en `example/` mostrando todas las variantes/estados.
5. Corre `flutter analyze` en la raíz y en `example/`.
