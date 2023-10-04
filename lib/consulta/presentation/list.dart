import 'package:flutter/material.dart';

import '../../shared/widgets/drawpages.dart';
import '../../shared/widgets/mylisttile.dart';
import '../data/datasource/api/delete.dart';
import '../data/datasource/api/get.dart';
import '../data/model/consulta.dart';
import 'crud/crud.dart';

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
        decoration: BoxDecoration(
          image: DecorationImage(
              colorFilter: ColorFilter.mode(
                  Colors.black.withOpacity(0.5), BlendMode.darken),
              image: const NetworkImage(
                  'https://i.pinimg.com/736x/a1/62/f4/a162f45c40af149da77113b69e8db4c3.jpg'),
              fit: BoxFit.cover),
        ),
        padding: const EdgeInsets.only(top: 2),
        child: FutureBuilder<List<ConsultaModel>>(
          future: ConsultaListDataSource().getConsultas(),
          initialData: const [],
          builder: (BuildContext context, AsyncSnapshot snapshot) {
            switch (snapshot.connectionState) {
              case ConnectionState.waiting:
                return const Center(
                  child: CircularProgressIndicator(),
                );
              case ConnectionState.done:
                final List<ConsultaModel> consultas = snapshot.data ?? [];

                if (consultas.isEmpty) {
                  return const Center(
                    child: Text('Ainda não foi registrado nenhum consulta.',
                        style: TextStyle(
                            color: Colors.white,
                            fontSize: 14.0,
                            fontWeight: FontWeight.bold)),
                  );
                }

                return SingleChildScrollView(
                  child: ListView.builder(
                    itemCount: consultas.length,
                    itemBuilder: (BuildContext context, int index) {
                      final ConsultaModel consulta = consultas[index];

                      return Dismissible(
                        onDismissed: (direction) {
                          ConsultaDeleteDataSource()
                              .deleteConsulta(id: consulta.consultaId as int);
                          ScaffoldMessenger.of(context).showSnackBar(
                            const SnackBar(
                              showCloseIcon: true,
                              closeIconColor: Colors.white,
                              backgroundColor: Colors.indigo,
                              content: Text(
                                'Remoção bem sucedida',
                                style: TextStyle(color: Colors.white),
                              ),
                            ),
                          );
                        },
                        confirmDismiss: (direction) async {
                          return showDialog(
                              context: context,
                              builder: (context) {
                                return AlertDialog(
                                  title: const Text('Confirma remover?'),
                                  content:
                                      Text('Remover ${consulta.consultaId}?'),
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
                              });
                        },
                        direction: DismissDirection.endToStart,
                        background: Container(
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
                        ),
                        key: Key('$index'),
                        child: MyListTile(
                          isOdd: index.isOdd,
                          title: consulta.horario.data.toString(),
                          line01Text: consulta.medico.nome,
                          line02Text: consulta.paciente.nome,
                          imagePath: 'assets/images/livro.jpg',
                          visivelSeLista: false,
                          onEditPressed: () async {
                            await Navigator.push(
                              context,
                              MaterialPageRoute(
                                builder: (context) => ConsultaForm(
                                  consultaModel: consulta,
                                ),
                              ),
                            );
                            setState(() {});
                          },
                        ),
                      );
                    },
                  ),
                );
              default:
                return Container(
                  color: Colors.red,
                );
            }
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
