import 'package:design_system/design_system.dart';
import 'package:flutter/material.dart';

class SpacingPage extends StatelessWidget {
  const SpacingPage({super.key});

  @override
  Widget build(BuildContext context) {
    final colors = context.colors;
    final textTheme = Theme.of(context).textTheme;

    final spacingValues = <_TokenData>[
      _TokenData('xs', AppSpacing.xs),
      _TokenData('sm', AppSpacing.sm),
      _TokenData('md', AppSpacing.md),
      _TokenData('lg', AppSpacing.lg),
      _TokenData('xl', AppSpacing.xl),
      _TokenData('xxl', AppSpacing.xxl),
    ];

    final radiusValues = <_TokenData>[
      _TokenData('none', AppRadius.none),
      _TokenData('sm', AppRadius.sm),
      _TokenData('md', AppRadius.md),
      _TokenData('lg', AppRadius.lg),
      _TokenData('full', AppRadius.full),
    ];

    return Scaffold(
      appBar: AppBar(title: const Text('Espaciados y radios')),
      body: ListView(
        padding: const EdgeInsets.all(AppSpacing.md),
        children: [
          Text('Spacing (base 4dp)', style: textTheme.titleMedium),
          const SizedBox(height: AppSpacing.sm),
          for (final token in spacingValues) ...[
            _SpacingBar(token: token, color: colors.primary),
            const SizedBox(height: AppSpacing.sm),
          ],
          const SizedBox(height: AppSpacing.lg),
          Text('Border radius', style: textTheme.titleMedium),
          const SizedBox(height: AppSpacing.sm),
          Wrap(
            spacing: AppSpacing.md,
            runSpacing: AppSpacing.md,
            children: [
              for (final token in radiusValues)
                _RadiusSample(token: token, color: colors.primary),
            ],
          ),
        ],
      ),
    );
  }
}

class _TokenData {
  const _TokenData(this.tokenName, this.value);

  final String tokenName;
  final double value;
}

class _SpacingBar extends StatelessWidget {
  const _SpacingBar({required this.token, required this.color});

  final _TokenData token;
  final Color color;

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        SizedBox(
          width: 48,
          child: Text('${token.tokenName} (${token.value.toStringAsFixed(0)})'),
        ),
        const SizedBox(width: AppSpacing.sm),
        Container(height: 16, width: token.value, color: color),
      ],
    );
  }
}

class _RadiusSample extends StatelessWidget {
  const _RadiusSample({required this.token, required this.color});

  final _TokenData token;
  final Color color;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Container(
          height: 56,
          width: 56,
          decoration: BoxDecoration(
            color: color,
            borderRadius: BorderRadius.circular(token.value),
          ),
        ),
        const SizedBox(height: AppSpacing.xs),
        Text(token.tokenName),
      ],
    );
  }
}
