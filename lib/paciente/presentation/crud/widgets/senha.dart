import 'package:flutter/material.dart';

class SenhaPacienteField extends StatelessWidget {
  final TextEditingController controller;

  const SenhaPacienteField({
    super.key,
    required this.controller,
  });

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      textInputAction: TextInputAction.next,
      controller: controller,
      obscureText: true,
      decoration: const InputDecoration(labelText: 'Senha'),
      validator: (value) {
        if (value == null || value.isEmpty) {
          return 'Por favor, o campo SENHA é obrigatório';
        }
        return null;
      },
    );
  }
}