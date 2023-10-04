import 'package:flutter/material.dart';

class DrawerPage {
  static Widget getWidget(BuildContext context) {
    return Drawer(
      child: ListView(
        children: [
          ListTile(
            title: const Text('Inicio'),
            onTap: () {
              Navigator.of(context).pushNamed('/');
            },
          ),
          ListTile(
            title: const Text('Medicos'),
            onTap: () {
              Navigator.of(context).pushNamed('/medicos');
            },
          ),
          ListTile(
            title: const Text('Horarios'),
            onTap: () {
              Navigator.of(context).pushNamed('/horarios');
            },
          ),
          ListTile(
            title: const Text('Pacientes'),
            onTap: () {
              Navigator.of(context).pushNamed('/pacientes');
            },
          ),
          ListTile(
            title: const Text('Consultas'),
            onTap: () {
              Navigator.of(context).pushNamed('/consultas');
            },
          ),
        ],
      ),
    );
  }
}
