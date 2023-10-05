import 'package:flutter/material.dart';

class CpfMedicoField extends StatelessWidget {
  final TextEditingController controller;

  const CpfMedicoField({
    super.key,
    required this.controller,
  });

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      textInputAction: TextInputAction.next,
      controller: controller,
      decoration: const InputDecoration(labelText: 'Cpf'),
      validator: (value) {
        if (value == null || value.isEmpty) {
          return 'Por favor, o campo CPF é obrigatório';
        }
        return null;
      },
    );
  }
}
