import 'package:design_system/design_system.dart';
import 'package:flutter/material.dart';

class ColorsPage extends StatelessWidget {
  const ColorsPage({super.key});

  @override
  Widget build(BuildContext context) {
    final colors = context.colors;

    final swatches = <_ColorSwatchData>[
      _ColorSwatchData(
        'primary',
        colors.primary,
        'onPrimary',
        colors.onPrimary,
      ),
      _ColorSwatchData(
        'primaryContainer',
        colors.primaryContainer,
        'onPrimaryContainer',
        colors.onPrimaryContainer,
      ),
      _ColorSwatchData(
        'secondary',
        colors.secondary,
        'onSecondary',
        colors.onSecondary,
      ),
      _ColorSwatchData(
        'surface',
        colors.surface,
        'onSurface',
        colors.onSurface,
      ),
      _ColorSwatchData(
        'background',
        colors.background,
        'onBackground',
        colors.onBackground,
      ),
      _ColorSwatchData('error', colors.error, 'onError', colors.onError),
      _ColorSwatchData(
        'success',
        colors.success,
        'onSuccess',
        colors.onSuccess,
      ),
      _ColorSwatchData(
        'successContainer',
        colors.successContainer,
        'onSuccessContainer',
        colors.onSuccessContainer,
      ),
      _ColorSwatchData(
        'warning',
        colors.warning,
        'onWarning',
        colors.onWarning,
      ),
      _ColorSwatchData(
        'warningContainer',
        colors.warningContainer,
        'onWarningContainer',
        colors.onWarningContainer,
      ),
    ];

    return Scaffold(
      appBar: AppBar(title: const Text('Colores')),
      body: ListView.separated(
        padding: const EdgeInsets.all(AppSpacing.md),
        itemCount: swatches.length,
        separatorBuilder: (context, index) =>
            const SizedBox(height: AppSpacing.sm),
        itemBuilder: (context, index) =>
            _ColorSwatchTile(data: swatches[index]),
      ),
    );
  }
}

class _ColorSwatchData {
  const _ColorSwatchData(
    this.roleName,
    this.color,
    this.onRoleName,
    this.onColor,
  );

  final String roleName;
  final Color color;
  final String onRoleName;
  final Color onColor;
}

class _ColorSwatchTile extends StatelessWidget {
  const _ColorSwatchTile({required this.data});

  final _ColorSwatchData data;

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 72,
      padding: const EdgeInsets.symmetric(horizontal: AppSpacing.md),
      decoration: BoxDecoration(
        color: data.color,
        borderRadius: BorderRadius.circular(AppRadius.md),
      ),
      alignment: Alignment.centerLeft,
      child: Text(
        '${data.roleName} / ${data.onRoleName}',
        style: TextStyle(color: data.onColor, fontWeight: FontWeight.w600),
      ),
    );
  }
}
