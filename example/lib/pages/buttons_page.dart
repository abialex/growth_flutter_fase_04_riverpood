import 'package:design_system/design_system.dart';
import 'package:flutter/material.dart';

class ButtonsPage extends StatelessWidget {
  const ButtonsPage({super.key});

  @override
  Widget build(BuildContext context) {
    final textTheme = Theme.of(context).textTheme;

    return Scaffold(
      appBar: AppBar(title: const Text('Botones')),
      body: ListView(
        padding: const EdgeInsets.all(AppSpacing.md),
        children: [
          Text('Botón secundario', style: textTheme.titleMedium),
          const SizedBox(height: AppSpacing.sm),
          const Align(
            alignment: Alignment.centerLeft,
            child: _ButtonColumn(size: AppButtonSize.medium),
          ),
          const SizedBox(height: AppSpacing.lg),
          Text('Botón micro', style: textTheme.titleMedium),
          const SizedBox(height: AppSpacing.sm),
          const Align(
            alignment: Alignment.centerLeft,
            child: _ButtonColumn(
              size: AppButtonSize.small,
              includeOutline: true,
            ),
          ),
          const SizedBox(height: AppSpacing.lg),
          // Not in the design mockups — added as a variant needed for
          // delete/cancel/irreversible actions.
          Text('Destructive', style: textTheme.titleMedium),
          const SizedBox(height: AppSpacing.sm),
          const Align(
            alignment: Alignment.centerLeft,
            child: _DestructiveButtonRow(),
          ),
        ],
      ),
    );
  }
}

class _ButtonColumn extends StatelessWidget {
  const _ButtonColumn({required this.size, this.includeOutline = false});

  final AppButtonSize size;
  final bool includeOutline;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        AppButton(
          label: 'Light',
          size: size,
          emphasis: AppEmphasis.light,
          onPressed: () {},
        ),
        const SizedBox(height: AppSpacing.sm),
        AppButton(label: 'Orange', size: size, onPressed: () {}),
        const SizedBox(height: AppSpacing.sm),
        AppButton(
          label: 'Disabled',
          size: size,
          emphasis: AppEmphasis.light,
          onPressed: null,
        ),
        if (includeOutline) ...[
          const SizedBox(height: AppSpacing.sm),
          AppButton(
            label: 'White',
            size: size,
            emphasis: AppEmphasis.outline,
            onPressed: () {},
          ),
        ],
      ],
    );
  }
}

class _DestructiveButtonRow extends StatelessWidget {
  const _DestructiveButtonRow();

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        AppButton(
          label: 'Eliminar cuenta',
          isDestructive: true,
          onPressed: () {},
        ),
        const SizedBox(height: AppSpacing.sm),
        AppButton(
          label: 'Eliminar',
          emphasis: AppEmphasis.light,
          isDestructive: true,
          onPressed: () {},
        ),
        const SizedBox(height: AppSpacing.sm),
        AppButton(
          label: 'Cancelar suscripción',
          emphasis: AppEmphasis.outline,
          isDestructive: true,
          onPressed: () {},
        ),
      ],
    );
  }
}
