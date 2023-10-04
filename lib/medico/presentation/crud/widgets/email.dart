import 'package:flutter/material.dart';

class EmailMedicoField extends StatelessWidget {
  final TextEditingController controller;

  const EmailMedicoField({
    super.key,
    required this.controller,
  });

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      textInputAction: TextInputAction.next,
      controller: controller,
      decoration: const InputDecoration(labelText: 'Email'),
      validator: (value) {
        if (value == null || value.isEmpty) {
          return 'Por favor, o campo EMAIL é obrigatório';
        }
        return null;
      },
    );
  }
}
