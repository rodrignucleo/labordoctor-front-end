import 'package:flutter/material.dart';

import '../../shared/widgets/drawpages.dart';
import '../data/datasource/api/get.dart';
import '../data/model/medico.dart';
import '../../../../shared/widgets//background_body_decoration.dart';
import '../../../../shared/widgets/error_carregamento_dados.dart';
import 'crud/widgets/listview.dart';
import 'crud/crud.dart';

class MedicoList extends StatefulWidget {
  const MedicoList({super.key});

  @override
  // ignore: library_private_types_in_public_api
  _MedicoPageState createState() => _MedicoPageState();
}

class _MedicoPageState extends State<MedicoList> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Medicos'),
        centerTitle: true,
      ),
      body: Container(
        height: MediaQuery.of(context).size.height,
        width: double.infinity,
        decoration: BoxDecorationBackground(),
        padding: const EdgeInsets.only(top: 2),
        child: FutureBuilder<List<MedicoModel>>(
          future: MedicoListDataSource().getMedicos(),
          initialData: const [],
          builder: (BuildContext context, AsyncSnapshot snapshot) {
            if (snapshot.connectionState == ConnectionState.waiting) {
              return const Center(
                child: CircularProgressIndicator(),
              );
            }

            if (snapshot.connectionState == ConnectionState.done) {
              final List<MedicoModel> medicos = snapshot.data ?? [];

              if (medicos.isEmpty) {
                return const ErrorLoadData(
                    mensagem: 'Ainda não foi registrado nenhum medico.');
              }

              // retorna a lista de médicos cadastrados
              return MedicalListView(medicos: medicos);
            }
            // caso nao tenha ocorrido nenhuma opção acima
            // informa o usuário que ocorreu um erro de conexão
            return const ErrorLoadData(mensagem: 'Ocorreu um erro na conexão');
          },
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () async {
          await Navigator.push(
            context,
            MaterialPageRoute(builder: (context) => const MedicoForm()),
          );
          setState(() {});
        },
        backgroundColor: Colors.blue,
        child: const Icon(Icons.add),
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.endFloat,
      drawer: DrawerPage.getWidget(context),
    );
  }
}
