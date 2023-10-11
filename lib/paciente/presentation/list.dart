import 'package:flutter/material.dart';
import 'crud/widgets/listview.dart';

import '../../shared/widgets/background_body_decoration.dart';
import '../../shared/widgets/drawpages.dart';
import '../../shared/widgets/error_carregamento_dados.dart';
import '../data/datasource/api/get.dart';
import '../data/model/paciente.dart';
import 'crud/crud.dart';

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
        decoration: BoxDecorationBackground(),
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
                return const ErrorLoadData(
                    mensagem: 'Ainda não foi registrado nenhum medico.');
              }

              return PacienteListView(pacientes: pacientes);
            }
            // caso nao tenha ocorrido nenhuma opção acima
            // informa o usuário que ocorreu um erro de conexão
            return const ErrorLoadData(mensagem: 'Ocorreu um erro na conexão');
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
