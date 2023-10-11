import 'package:flutter/material.dart';

class SnackbarMensagemItemDeletado {
  static void show({
    required BuildContext context,
  }) {
    
    const snackbar = SnackBar(
      showCloseIcon: true,
      closeIconColor: Colors.white,
      backgroundColor: Colors.indigo,
      duration: Duration(seconds: 2),
      content: Text(
        'Remoção bem sucedida',
        style: TextStyle(color: Colors.white),
      ),
    );

    ScaffoldMessenger.of(context).showSnackBar(snackbar);
  }
}
