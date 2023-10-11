import 'package:flutter/material.dart';

class OptionRemoverItem extends StatelessWidget {
  const OptionRemoverItem({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.red,
      child: const Row(
        mainAxisAlignment: MainAxisAlignment.end,
        children: [
          Text(
            'Remover',
            style: TextStyle(
              color: Colors.white,
              fontSize: 22,
              fontWeight: FontWeight.bold,
            ),
          ),
          Icon(
            Icons.delete,
            color: Colors.white,
            size: 32,
          ),
        ],
      ),
    );
  }
}
