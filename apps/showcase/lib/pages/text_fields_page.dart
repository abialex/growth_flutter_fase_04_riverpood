import 'package:design_system/design_system.dart';
import 'package:flutter/material.dart';

class TextFieldsPage extends StatelessWidget {
  const TextFieldsPage({super.key});

  @override
  Widget build(BuildContext context) {
    final textTheme = Theme.of(context).textTheme;

    return Scaffold(
      appBar: AppBar(title: const Text('Text fields')),
      body: ListView(
        padding: const EdgeInsets.all(AppSpacing.md),
        children: [
          Text('Text fill', style: textTheme.titleMedium),
          const SizedBox(height: AppSpacing.sm),
          const AppTextField(hint: 'Text fill'),
          const SizedBox(height: AppSpacing.sm),
          AppTextField(hint: 'Text fill', controller: TextEditingController(text: 'Text fill')),
          const SizedBox(height: AppSpacing.sm),
          AppTextField(
            hint: 'Solo lectura',
            readOnly: true,
            controller: TextEditingController(text: 'No editable'),
          ),
          const SizedBox(height: AppSpacing.sm),
          const AppTextField(hint: 'Con contador', maxLength: 40),
          const SizedBox(height: AppSpacing.lg),
          Text('Drop down fill', style: textTheme.titleMedium),
          const SizedBox(height: AppSpacing.sm),
          AppDropdownField<String>(
            hint: 'Selecciona',
            items: const [
              AppDropdownItem(value: 'dni', label: 'DNI'),
              AppDropdownItem(value: 'ce', label: 'Carnet de extranjería'),
              AppDropdownItem(value: 'passport', label: 'Pasaporte'),
            ],
            onChanged: (value) {},
          ),
          const SizedBox(height: AppSpacing.sm),
          AppDropdownField<String>(
            hint: 'Selecciona',
            initialValue: 'dni',
            items: const [
              AppDropdownItem(value: 'dni', label: 'DNI'),
              AppDropdownItem(value: 'ce', label: 'Carnet de extranjería'),
              AppDropdownItem(value: 'passport', label: 'Pasaporte'),
            ],
            onChanged: (value) {},
          ),
          const SizedBox(height: AppSpacing.lg),
          Text('Password fill', style: textTheme.titleMedium),
          const SizedBox(height: AppSpacing.sm),
          AppPasswordField(hint: 'Contraseña', controller: TextEditingController(text: 'xxxxxxxxxx')),
          const SizedBox(height: AppSpacing.sm),
          AppPasswordField(
            hint: 'Contraseña',
            controller: TextEditingController(text: 'xxxxxxxxxx'),
            errorText: 'Error',
          ),
          const SizedBox(height: AppSpacing.lg),
          Text('Phone country area code dropdown fill', style: textTheme.titleMedium),
          const SizedBox(height: AppSpacing.sm),
          AppPhoneField(
            countryFlag: '🇵🇪',
            countryCode: '+51',
            onCountryTap: () {},
            hint: 'Número de teléfono',
          ),
        ],
      ),
    );
  }
}
