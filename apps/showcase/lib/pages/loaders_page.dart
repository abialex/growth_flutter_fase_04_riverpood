import 'package:design_system/design_system.dart';
import 'package:flutter/material.dart';

class LoadersPage extends StatelessWidget {
  const LoadersPage({super.key});

  @override
  Widget build(BuildContext context) {
    final textTheme = Theme.of(context).textTheme;

    return Scaffold(
      appBar: AppBar(title: const Text('Loaders')),
      body: ListView(
        padding: const EdgeInsets.all(AppSpacing.md),
        children: [
          Text('Circular', style: textTheme.titleMedium),
          const SizedBox(height: AppSpacing.sm),
          const Row(
            children: [
              AppLoader(size: AppLoaderSize.small),
              SizedBox(width: AppSpacing.lg),
              AppLoader(size: AppLoaderSize.medium),
              SizedBox(width: AppSpacing.lg),
              AppLoader(size: AppLoaderSize.large),
            ],
          ),
          const SizedBox(height: AppSpacing.lg),
          Text('Pantalla completa con mensaje', style: textTheme.titleMedium),
          const SizedBox(height: AppSpacing.sm),
          const AppLoader(size: AppLoaderSize.large, message: 'Cargando información...'),
        ],
      ),
    );
  }
}
