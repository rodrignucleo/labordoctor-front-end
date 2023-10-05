import 'package:flutter/material.dart';

class EspecialidadeMedicoField extends StatelessWidget {
  final TextEditingController controller;

  const EspecialidadeMedicoField({
    super.key,
    required this.controller,
  });

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      textInputAction: TextInputAction.next,
      controller: controller,
      decoration: const InputDecoration(labelText: 'Especialidade'),
      validator: (value) {
        if (value == null || value.isEmpty) {
          return 'Por favor, o campo ESPECIALIDADE é obrigatório';
        }
        return null;
      },
    );
  }
}
