import 'package:flutter/material.dart';

import '../../../../shared/widgets/mylisttile.dart';
import '../../../data/datasource/api/delete.dart';
import '../../../data/model/paciente.dart';
import '../crud.dart';
import '../../../../shared/widgets/alert_confirma_remocao.dart';
import '../../../../shared/widgets/background_remover_item.dart';
import '../../../../shared/widgets/snackbar_item_deletado.dart';

class PacienteListView extends StatefulWidget {
  final List<PacienteModel> pacientes;

  const PacienteListView({
    super.key,
    required this.pacientes,
  });

  @override
  State<PacienteListView> createState() => _MedicalListViewState();
}

class _MedicalListViewState extends State<PacienteListView> {
  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemCount: widget.pacientes.length,
      itemBuilder: (BuildContext context, int index) {
        final PacienteModel paciente = widget.pacientes[index];

        return Dismissible(
          onDismissed: (direction) {
            PacienteDeleteDataSource().deletePaciente(id: paciente.id_paciente);
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
                  builder: (context) => const PacienteForm(),
                ),
              );
              setState(() {});
            },
          ),
        );
      },
    );
  }
}
