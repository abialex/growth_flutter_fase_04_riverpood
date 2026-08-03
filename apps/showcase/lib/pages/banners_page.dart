import 'package:design_system/design_system.dart';
import 'package:flutter/material.dart';

class BannersPage extends StatelessWidget {
  const BannersPage({super.key});

  @override
  Widget build(BuildContext context) {
    final textTheme = Theme.of(context).textTheme;

    return Scaffold(
      appBar: AppBar(title: const Text('Banners y empty states')),
      body: ListView(
        padding: const EdgeInsets.all(AppSpacing.md),
        children: [
          Text('Banners', style: textTheme.titleMedium),
          const SizedBox(height: AppSpacing.sm),
          const AppBanner(message: 'Tu sesión se cerrará en 5 minutos.'),
          const SizedBox(height: AppSpacing.sm),
          const AppBanner(
            variant: AppBannerVariant.success,
            message: 'Tus cambios se guardaron correctamente.',
          ),
          const SizedBox(height: AppSpacing.sm),
          AppBanner(
            variant: AppBannerVariant.warning,
            message: 'Tu plan vence en 3 días.',
            actionLabel: 'Renovar',
            onAction: () {},
          ),
          const SizedBox(height: AppSpacing.sm),
          AppBanner(
            variant: AppBannerVariant.error,
            message: 'No pudimos procesar tu pago.',
            actionLabel: 'Reintentar',
            onAction: () {},
            onDismiss: () {},
          ),
          const SizedBox(height: AppSpacing.lg),
          Text('Empty states', style: textTheme.titleMedium),
          const SizedBox(height: AppSpacing.sm),
          AppCard(
            child: AppEmptyState(
              icon: Icons.search_off_outlined,
              title: 'Sin resultados',
              description: 'No encontramos nada que coincida con tu búsqueda.',
              actionLabel: 'Limpiar filtros',
              onAction: () {},
            ),
          ),
          const SizedBox(height: AppSpacing.sm),
          AppCard(
            child: AppEmptyState(
              icon: Icons.wifi_off_outlined,
              title: 'Sin conexión',
              description: 'Revisa tu internet e intenta de nuevo.',
              actionLabel: 'Reintentar',
              onAction: () {},
            ),
          ),
          const SizedBox(height: AppSpacing.sm),
          const AppCard(
            child: AppEmptyState(
              title: 'Todavía no tienes elementos',
              description: 'Cuando agregues uno, aparecerá aquí.',
            ),
          ),
        ],
      ),
    );
  }
}
