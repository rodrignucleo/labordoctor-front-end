import 'package:flutter/material.dart';
import 'package:myapp/paciente/presentation/crud/widgets/alert_confirma_remocao.dart';
import 'package:myapp/paciente/presentation/crud/widgets/snackbar_item_deletado.dart';

import '../../shared/widgets/drawpages.dart';
import '../../shared/widgets/mylisttile.dart';
import '../data/datasource/api/delete.dart';
import '../data/datasource/api/get.dart';
import '../data/model/paciente.dart';
import 'crud/crud.dart';
import 'crud/widgets/background_remover_item.dart';

class PacienteList extends StatefulWidget {
  const PacienteList({super.key});

  @override
  // ignore: library_private_types_in_public_api
  _PacientePageState createState() => _PacientePageState();
}

class _PacientePageState extends State<PacienteList> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Pacientes'),
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
        child: FutureBuilder<List<PacienteModel>>(
          future: PacienteListDataSource().getPacientes(),
          initialData: const [],
          builder: (BuildContext context, AsyncSnapshot snapshot) {
            if (snapshot.connectionState == ConnectionState.waiting) {
              return const Center(
                child: CircularProgressIndicator(),
              );
            }
            if (snapshot.connectionState == ConnectionState.done) {
              final List<PacienteModel> pacientes = snapshot.data ?? [];

              if (pacientes.isEmpty) {
                return const Center(
                  child: Text('Ainda não foi registrado nenhum paciente.',
                      style: TextStyle(
                          color: Colors.white,
                          fontSize: 14.0,
                          fontWeight: FontWeight.bold)),
                );
              }

              return ListView.builder(
                itemCount: pacientes.length,
                itemBuilder: (BuildContext context, int index) {
                  final PacienteModel paciente = pacientes[index];

                  return Dismissible(
                    onDismissed: (direction) {
                      PacienteDeleteDataSource()
                          .deletePaciente(id: paciente.id_paciente);
                      SnackbarMensagemItemDeletado.show(context: context);
                    },
                    confirmDismiss: (direction) async {
                      return showDialog(
                          context: context,
                          builder: (context) {
                            return ConfirmaDeletarItem(
                              nomeItem: paciente.nome,
                            );
                          });
                    },
                    direction: DismissDirection.endToStart,
                    background: const OptionRemoverItem(),
                    key: Key('$index'),
                    child: MyListTile(
                      isOdd: index.isOdd,
                      title: paciente.nome,
                      line01Text: paciente.cpf,
                      line02Text: paciente.email,
                      imagePath: 'assets/images/livro.jpg',
                      visivelSeLista: false,
                      onEditPressed: () async {
                        await Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => PacienteForm(
                              pacienteModel: paciente,
                            ),
                          ),
                        );
                        setState(() {});
                      },
                    ),
                  );
                },
              );
            }
            // caso nao tenha ocorrido nenhuma opção acima
            // informa o usuário que ocorreu um erro de conexão
            return const Center(
              child: Text(
                  'Lamentamos, mas ocorreu um erro no carregamento da pagina',
                  style: TextStyle(
                      color: Colors.white,
                      fontSize: 14.0,
                      fontWeight: FontWeight.bold)),
            );
            //fim do if

            /*

          //   switch (snapshot.connectionState) {
          //     case ConnectionState.waiting:
          //       return const Center(
          //         child: CircularProgressIndicator(),
          //       );
          //     case ConnectionState.done:
          //       final List<PacienteModel> pacientes = snapshot.data ?? [];

          //       if (pacientes.isEmpty) {
          //         return const Center(
          //           child: Text('Ainda não foi registrado nenhum paciente.',
          //               style: TextStyle(
          //                   color: Colors.white,
          //                   fontSize: 14.0,
          //                   fontWeight: FontWeight.bold)),
          //         );
          //       }

          //       return ListView.builder(
          //         itemCount: pacientes.length,
          //         itemBuilder: (BuildContext context, int index) {
          //           final PacienteModel paciente = pacientes[index];

          //           return Dismissible(
          //             onDismissed: (direction) {
          //               PacienteDeleteDataSource()
          //                   .deletePaciente(id: paciente.id_paciente);

          //               SnackbarMensagemItemDeletado.show(context: context);
          //             },
          //             confirmDismiss: (direction) async {
          //               return showDialog(
          //                   context: context,
          //                   builder: (context) {
          //                     return ConfirmaDeletarItem(
          //                       nomeItem: paciente.nome,
          //                     );
          //                   });
          //             },
          //             direction: DismissDirection.endToStart,
          //             background: const OptionRemoverItem(),
          //             key: Key('$index'),
          //             child: MyListTile(
          //               isOdd: index.isOdd,
          //               title: paciente.nome,
          //               line01Text: paciente.cpf,
          //               line02Text: paciente.email,
          //               imagePath: 'assets/images/livro.jpg',
          //               visivelSeLista: false,
          //               onEditPressed: () async {
          //                 await Navigator.push(
          //                   context,
          //                   MaterialPageRoute(
          //                     builder: (context) => PacienteForm(
          //                       pacienteModel: paciente,
          //                     ),
          //                   ),
          //                 );
          //                 setState(() {});
          //               },
          //             ),
          //           );
          //         },
          //       );
          //     default:
          //       return Container(
          //         color: Colors.red,
          //       );
          //   }
          // // fim do switch
          */
          },
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () async {
          await Navigator.push(
            context,
            MaterialPageRoute(builder: (context) => const PacienteForm()),
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
