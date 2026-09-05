import 'package:design_system/design_system.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../providers/brand_provider.dart';
import '../providers/theme_mode_provider.dart';
import 'banners_page.dart';
import 'buttons_page.dart';
import 'cards_page.dart';
import 'chips_page.dart';
import 'colors_page.dart';
import 'loaders_page.dart';
import 'spacing_page.dart';
import 'text_fields_page.dart';
import 'typography_page.dart';

class ShowcaseHomePage extends ConsumerWidget {
  const ShowcaseHomePage({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final themeMode = ref.watch(themeModeProvider);
    final brand = ref.watch(brandProvider);
    final isDark =
        themeMode == ThemeMode.dark || (themeMode == ThemeMode.system && MediaQuery.platformBrightnessOf(context) == Brightness.dark);

    return Scaffold(
      appBar: AppBar(
        title: const Text('Design System Showcase'),
        actions: [
          IconButton(
            tooltip: 'Toggle theme',
            icon: Icon(isDark ? Icons.dark_mode : Icons.light_mode),
            onPressed: () => _onToggleTheme(ref, isDark),
          ),
        ],
      ),
      body: Column(
        children: [
          Padding(
            padding: const EdgeInsets.all(AppSpacing.md),
            child: SegmentedButton<AppBrand>(
              segments: const [
                ButtonSegment(
                  value: AppBrand.indigo,
                  label: Text('Indigo', softWrap: false, overflow: TextOverflow.ellipsis),
                ),
                ButtonSegment(
                  value: AppBrand.orange,
                  label: Text('Orange', softWrap: false, overflow: TextOverflow.ellipsis),
                ),
              ],
              selected: {brand},
              onSelectionChanged: (selection) => _onSelectBrand(ref, selection),
            ),
          ),
          Expanded(
            child: ListView(
              children: [
                _CategoryTile(
                  title: 'Colores',
                  subtitle: 'Roles semánticos generados desde el color semilla',
                  icon: Icons.palette_outlined,
                  onTap: () => _onOpenCategory(context, const ColorsPage()),
                ),
                _CategoryTile(
                  title: 'Tipografía',
                  subtitle: 'Escala Material (display/headline/title/body/label) con Inter',
                  icon: Icons.text_fields_outlined,
                  onTap: () => _onOpenCategory(context, const TypographyPage()),
                ),
                _CategoryTile(
                  title: 'Espaciados y radios',
                  subtitle: 'Escala de 4dp y radios de borde',
                  icon: Icons.straighten_outlined,
                  onTap: () => _onOpenCategory(context, const SpacingPage()),
                ),
                _CategoryTile(
                  title: 'Botones',
                  subtitle: 'Secundario y micro, variantes light/orange/disabled/white',
                  icon: Icons.smart_button_outlined,
                  onTap: () => _onOpenCategory(context, const ButtonsPage()),
                ),
                _CategoryTile(
                  title: 'Chips',
                  subtitle: 'Chips de una sola etiqueta, mismas variantes que los botones',
                  icon: Icons.label_outline,
                  onTap: () => _onOpenCategory(context, const ChipsPage()),
                ),
                _CategoryTile(
                  title: 'Text fields',
                  subtitle: 'Texto, dropdown, password y teléfono con código de país',
                  icon: Icons.input_outlined,
                  onTap: () => _onOpenCategory(context, const TextFieldsPage()),
                ),
                _CategoryTile(
                  title: 'Cards',
                  subtitle: 'Info card y variantes elevated/outlined',
                  icon: Icons.crop_din_outlined,
                  onTap: () => _onOpenCategory(context, const CardsPage()),
                ),
                _CategoryTile(
                  title: 'Loaders',
                  subtitle: 'Circular (small/medium/large), con mensaje opcional',
                  icon: Icons.autorenew_outlined,
                  onTap: () => _onOpenCategory(context, const LoadersPage()),
                ),
                _CategoryTile(
                  title: 'Banners y empty states',
                  subtitle: 'Info/success/warning/error + sin resultados/sin conexión',
                  icon: Icons.campaign_outlined,
                  onTap: () => _onOpenCategory(context, const BannersPage()),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  void _onToggleTheme(WidgetRef ref, bool isDark) {
    ref.read(themeModeProvider.notifier).state = isDark ? ThemeMode.light : ThemeMode.dark;
  }

  void _onSelectBrand(WidgetRef ref, Set<AppBrand> selection) {
    if (selection.isEmpty) return;
    ref.read(brandProvider.notifier).state = selection.first;
  }

  void _onOpenCategory(BuildContext context, Widget page) {
    Navigator.of(context).push(MaterialPageRoute(builder: (context) => page));
  }
}

class _CategoryTile extends StatelessWidget {
  const _CategoryTile({required this.title, required this.subtitle, required this.icon, required this.onTap});

  final String title;
  final String subtitle;
  final IconData icon;
  final VoidCallback onTap;

  @override
  Widget build(BuildContext context) {
    return ListTile(
      leading: Icon(icon),
      title: Text(title),
      subtitle: Text(subtitle),
      trailing: const Icon(Icons.chevron_right),
      onTap: onTap,
    );
  }
}
