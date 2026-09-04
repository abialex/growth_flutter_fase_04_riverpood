# showcase

App Riverpod que documenta visualmente el paquete `design_system` (raíz de este repo): cada token y componente, organizados por categoría, mostrando todas sus variantes y estados. Es un consumidor externo del paquete (`design_system: path: ../`) — el paquete nunca se ejecuta por sí mismo.

## Correr la app

```bash
flutter run -d chrome     # más rápido para iterar (hot reload)
flutter run -d windows    # si tienes esa plataforma habilitada
flutter run -d <emulator> # Android/iOS
```

Requiere haber corrido `flutter pub get` en esta carpeta (`example/`) al menos una vez.

## Qué muestra

- **Colores** — roles semánticos (`context.colors`) generados desde el color semilla, para ambas marcas.
- **Tipografía** — escala Material (display/headline/title/body/label) con Inter.
- **Espaciados y radios** — escala de 4dp y radios de borde.
- **Botones** — tamaños secundario/micro, variantes light/solid/outline y destructive.
- **Tags** — chips assist/filter/input.
- **Text fields** — texto, solo lectura, con contador, dropdown, password, teléfono con código de país.
- **Cards** — info card (filled) y variantes elevated/outlined.
- **Loaders** — circular (3 tamaños), con mensaje opcional.
- **Banners y empty states** — info/success/warning/error + casos de "sin resultados"/"sin conexión"/"lista vacía".

El selector **Indigo/Orange** en el home cambia la marca activa (`AppBrand`) en tiempo real; el ícono del AppBar alterna light/dark. Ambos afectan a toda la app porque cada componente lee sus colores del `ThemeData` (`AppTheme.light()`/`AppTheme.dark()`), no de valores propios.

## Estructura

```
lib/
├── app.dart                  # MaterialApp + AppTheme + providers de tema/marca
├── main.dart
├── providers/                 # brandProvider, themeModeProvider (Riverpod)
└── pages/                     # una página por categoría del design system
```
