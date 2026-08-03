import 'package:design_system/design_system.dart';
import 'package:flutter/material.dart';

class TypographyPage extends StatelessWidget {
  const TypographyPage({super.key});

  @override
  Widget build(BuildContext context) {
    final textTheme = Theme.of(context).textTheme;

    final styles = <_TypeStyleData>[
      _TypeStyleData('displayLarge', textTheme.displayLarge),
      _TypeStyleData('displayMedium', textTheme.displayMedium),
      _TypeStyleData('displaySmall', textTheme.displaySmall),
      _TypeStyleData('headlineLarge', textTheme.headlineLarge),
      _TypeStyleData('headlineMedium', textTheme.headlineMedium),
      _TypeStyleData('headlineSmall', textTheme.headlineSmall),
      _TypeStyleData('titleLarge', textTheme.titleLarge),
      _TypeStyleData('titleMedium', textTheme.titleMedium),
      _TypeStyleData('titleSmall', textTheme.titleSmall),
      _TypeStyleData('bodyLarge', textTheme.bodyLarge),
      _TypeStyleData('bodyMedium', textTheme.bodyMedium),
      _TypeStyleData('bodySmall', textTheme.bodySmall),
      _TypeStyleData('labelLarge', textTheme.labelLarge),
      _TypeStyleData('labelMedium', textTheme.labelMedium),
      _TypeStyleData('labelSmall', textTheme.labelSmall),
    ];

    return Scaffold(
      appBar: AppBar(title: const Text('Tipografía')),
      body: ListView.separated(
        padding: const EdgeInsets.all(AppSpacing.md),
        itemCount: styles.length,
        separatorBuilder: (context, index) => const SizedBox(height: AppSpacing.md),
        itemBuilder: (context, index) {
          final style = styles[index];
          return Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                '${style.tokenName} · ${style.style?.fontSize?.toStringAsFixed(0)}px',
                style: textTheme.labelSmall,
              ),
              const SizedBox(height: AppSpacing.xs),
              Text('El veloz murciélago hindú', style: style.style),
            ],
          );
        },
      ),
    );
  }
}

class _TypeStyleData {
  const _TypeStyleData(this.tokenName, this.style);

  final String tokenName;
  final TextStyle? style;
}
