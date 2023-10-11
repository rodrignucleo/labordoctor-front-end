import 'package:flutter/material.dart';

class ErrorLoadData extends StatelessWidget {
  final String mensagem;

  const ErrorLoadData({
    super.key,
    required this.mensagem,
  });

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Text(mensagem,
          style: const TextStyle(
              color: Colors.white,
              fontSize: 14.0,
              fontWeight: FontWeight.bold)),
    );
  }
}
