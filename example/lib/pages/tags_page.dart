import 'package:design_system/design_system.dart';
import 'package:flutter/material.dart';

class TagsPage extends StatefulWidget {
  const TagsPage({super.key});

  @override
  State<TagsPage> createState() => _TagsPageState();
}

class _TagsPageState extends State<TagsPage> {
  bool _isFilterSelected = false;
  final List<String> _inputTags = ['Flutter', 'Dart', 'Riverpod'];

  @override
  Widget build(BuildContext context) {
    final textTheme = Theme.of(context).textTheme;

    return Scaffold(
      appBar: AppBar(title: const Text('Tags')),
      body: ListView(
        padding: const EdgeInsets.all(AppSpacing.md),
        children: [
          Text('Assist', style: textTheme.titleMedium),
          const SizedBox(height: AppSpacing.sm),
          Align(
            alignment: Alignment.centerLeft,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: const [
                AppChip(label: 'Label Tag', emphasis: AppEmphasis.light),
                SizedBox(height: AppSpacing.sm),
                AppChip(label: 'Label Tag'),
                SizedBox(height: AppSpacing.sm),
                AppChip(
                  label: 'Label Tag',
                  emphasis: AppEmphasis.light,
                  isDisabled: true,
                ),
                SizedBox(height: AppSpacing.sm),
                AppChip(label: 'Label Tag', emphasis: AppEmphasis.outline),
              ],
            ),
          ),
          const SizedBox(height: AppSpacing.lg),
          Text('Filter (seleccionable)', style: textTheme.titleMedium),
          const SizedBox(height: AppSpacing.sm),
          Align(
            alignment: Alignment.centerLeft,
            child: AppChip(
              label: _isFilterSelected ? 'Seleccionado' : 'Sin seleccionar',
              type: AppChipType.filter,
              isSelected: _isFilterSelected,
              onSelected: _onToggleFilter,
            ),
          ),
          const SizedBox(height: AppSpacing.lg),
          Text('Input (removible)', style: textTheme.titleMedium),
          const SizedBox(height: AppSpacing.sm),
          Wrap(
            spacing: AppSpacing.sm,
            runSpacing: AppSpacing.sm,
            children: [
              for (final tag in _inputTags)
                AppChip(
                  label: tag,
                  type: AppChipType.input,
                  onDeleted: () => _onDeleteTag(tag),
                ),
            ],
          ),
        ],
      ),
    );
  }

  void _onToggleFilter(bool isSelected) {
    setState(() => _isFilterSelected = isSelected);
  }

  void _onDeleteTag(String tag) {
    setState(() => _inputTags.remove(tag));
  }
}
