import 'package:flutter/material.dart';

class BotaoGravar extends StatelessWidget {
  final Function() onPressed;
  final VoidCallback onPressedNovo;

  const BotaoGravar({
    super.key,
    required this.onPressed,
    required this.onPressedNovo,
  });

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      onPressed: () {
        onPressed();
        onPressedNovo();
        Navigator.of(context).pop();
      },
      child: const Text('Salvar'),
    );
  }
}
