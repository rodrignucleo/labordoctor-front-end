import 'package:flutter/material.dart';

class CrmMedicoField extends StatelessWidget {
  final TextEditingController controller;

  const CrmMedicoField({
    super.key,
    required this.controller,
  });

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      textInputAction: TextInputAction.next,
      controller: controller,
      decoration: const InputDecoration(labelText: 'Crm'),
      validator: (value) {
        if (value == null || value.isEmpty) {
          return 'Por favor, o campo CRM é obrigatório';
        }
        return null;
      },
    );
  }
}
