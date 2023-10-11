import 'package:flutter/material.dart';

import '../../shared/widgets/background_body_decoration.dart';
import '../../shared/widgets/drawpages.dart';
import '../../shared/widgets/error_carregamento_dados.dart';
import '../data/datasource/api/get.dart';
import '../data/model/consulta.dart';
import 'crud/crud.dart';
import 'crud/widgets/listview.dart';

class ConsultaList extends StatefulWidget {
  const ConsultaList({super.key});

  @override
  // ignore: library_private_types_in_public_api
  _ConsultaPageState createState() => _ConsultaPageState();
}

class _ConsultaPageState extends State<ConsultaList> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Consultas'),
        centerTitle: true,
      ),
      body: Container(
        height: MediaQuery.of(context).size.height,
        width: double.infinity,
        decoration: BoxDecorationBackground(),
        padding: const EdgeInsets.only(top: 2),
        child: FutureBuilder<List<ConsultaModel>>(
          future: ConsultaListDataSource().getConsultas(),
          initialData: const [],
          builder: (BuildContext context, AsyncSnapshot snapshot) {
            if (snapshot.connectionState == ConnectionState.waiting) {
              return const Center(
                child: CircularProgressIndicator(),
              );
            }

            if (snapshot.connectionState == ConnectionState.done) {
              final List<ConsultaModel> consultas = snapshot.data ?? [];

              if (consultas.isEmpty) {
                return const ErrorLoadData(
                    mensagem: 'Ainda não foi registrado nenhum consulta.');
              }

              // retorna a lista de consultas cadastradas
              return ConsultaListView(consultas: consultas);
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
            MaterialPageRoute(builder: (context) => const ConsultaForm()),
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
