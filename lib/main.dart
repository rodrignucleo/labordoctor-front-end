import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:myapp/consulta/presentation/list.dart';
import 'package:myapp/horario/presentation/list.dart';
import 'package:myapp/medico/presentation/list.dart';
import 'paciente/presentation/list.dart';
import 'home/presentation/home.dart';

// para rodar em modo watch, recompilando em tempo real o codigo gerado, use:
// dart run build_runner watch --delete-conflicting-outputs

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  // late SettingsStore _settingsStore;

  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return Observer(builder: (context) {
      return MaterialApp(
        initialRoute: '/pacientes',
        routes: {
          '/': (context) => const HomePage(),
          '/pacientes': (context) => const PacienteList(),
          '/medicos': (context) => const MedicoList(),
          '/horarios': (context) => const HorarioList(),
          '/consultas': (context) => const ConsultaList(),
        },
        debugShowCheckedModeBanner: false,
      );
    });
  }
}
