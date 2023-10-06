import 'package:flutter/material.dart';

class ConfirmaDeletarItem extends StatelessWidget {
  final String nomeItem;

  const ConfirmaDeletarItem({
    super.key,
    required this.nomeItem,
  });

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      title: const Text('Confirma remover?'),
      content: Text('Remover ${nomeItem.toUpperCase()}?'),
      actions: [
        TextButton(
          onPressed: () {
            Navigator.of(context).pop(false);
          },
          child: const Text('Cancelar'),
        ),
        TextButton(
          onPressed: () {
            Navigator.of(context).pop(true);
          },
          child: const Text('OK'),
        ),
      ],
    );
  }
}
