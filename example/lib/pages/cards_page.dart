import 'package:design_system/design_system.dart';
import 'package:flutter/material.dart';

class CardsPage extends StatelessWidget {
  const CardsPage({super.key});

  @override
  Widget build(BuildContext context) {
    final colors = context.colors;
    final textTheme = Theme.of(context).textTheme;

    return Scaffold(
      appBar: AppBar(title: const Text('Cards')),
      body: ListView(
        padding: const EdgeInsets.all(AppSpacing.md),
        children: [
          Text('Info card', style: textTheme.titleMedium),
          const SizedBox(height: AppSpacing.sm),
          AppCard(
            variant: AppCardVariant.filled,
            child: Text(
              'Toda tu información estará segura con nosotros.',
              style: textTheme.bodyMedium?.copyWith(
                color: colors.onPrimaryContainer,
              ),
            ),
          ),
          const SizedBox(height: AppSpacing.sm),
          AppCard(
            variant: AppCardVariant.filled,
            child: Text(
              'Toda tu información estará segura con nosotros y nunca la compartiremos con terceros.',
              style: textTheme.bodyMedium?.copyWith(
                color: colors.onPrimaryContainer,
              ),
            ),
          ),
          const SizedBox(height: AppSpacing.lg),
          Text('Elevated / outlined', style: textTheme.titleMedium),
          const SizedBox(height: AppSpacing.sm),
          AppCard(child: Text('Elevated card', style: textTheme.bodyMedium)),
          const SizedBox(height: AppSpacing.sm),
          AppCard(
            variant: AppCardVariant.outlined,
            child: Text('Outlined card', style: textTheme.bodyMedium),
          ),
        ],
      ),
    );
  }
}
