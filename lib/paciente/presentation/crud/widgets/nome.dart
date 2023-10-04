import 'package:flutter/material.dart';

class NomePacienteField extends StatelessWidget {
  final TextEditingController controller;

  const NomePacienteField({
    super.key,
    required this.controller,
  });

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      textInputAction: TextInputAction.next,
      controller: controller,
      decoration: const InputDecoration(labelText: 'Nome'),
      validator: (value) {
        if (value == null || value.isEmpty) {
          return 'Por favor, o campo NOME é obrigatório';
        }
        return null;
      },
    );
  }
}