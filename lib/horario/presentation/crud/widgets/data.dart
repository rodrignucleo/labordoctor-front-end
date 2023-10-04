import 'package:flutter/material.dart';

class DataHorarioField extends StatelessWidget {
  final TextEditingController controller;

  const DataHorarioField({
    super.key,
    required this.controller,
  });

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      textInputAction: TextInputAction.next,
      controller: controller,
      keyboardType: TextInputType.datetime,
      decoration: const InputDecoration(labelText: 'Data da Consulta'),
      validator: (value) {
        if (value == null || value.isEmpty) {
          return 'Por favor, o campo DATA é obrigatório';
        }
        return null;
      },
    );
  }
}
