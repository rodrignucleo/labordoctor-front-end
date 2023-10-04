import 'package:flutter/material.dart';

class TelefonePacienteField extends StatelessWidget {
  final TextEditingController controller;

  const TelefonePacienteField({
    super.key,
    required this.controller,
  });

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      textInputAction: TextInputAction.next,
      controller: controller,
      decoration: const InputDecoration(labelText: 'Telefone'),
      validator: (value) {
        if (value == null || value.isEmpty) {
          return 'Por favor, o campo TELEFONE é obrigatório';
        }
        return null;
      },
    );
  }
}