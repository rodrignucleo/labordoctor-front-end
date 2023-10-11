import 'package:flutter/material.dart';

class BotaoGravar extends StatelessWidget {
  final Function() onPressed;
  final VoidCallback limpaCamposDeDados;

  const BotaoGravar({
    super.key,
    required this.onPressed,
    required this.limpaCamposDeDados,
  });

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      onPressed: () {
        onPressed();
        limpaCamposDeDados();
        Navigator.of(context).pop();
      },
      child: const Text('Salvar'),
    );
  }
}
