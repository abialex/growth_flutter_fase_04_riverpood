import 'package:design_system/design_system.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import 'pages/showcase_home_page.dart';
import 'providers/brand_provider.dart';
import 'providers/theme_mode_provider.dart';

class ShowcaseApp extends ConsumerWidget {
  const ShowcaseApp({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final themeMode = ref.watch(themeModeProvider);
    final brand = ref.watch(brandProvider);

    return MaterialApp(
      title: 'Design System Showcase',
      themeMode: themeMode,
      theme: AppTheme.light(brand: brand),
      darkTheme: AppTheme.dark(brand: brand),
      home: const ShowcaseHomePage(),
    );
  }
}
