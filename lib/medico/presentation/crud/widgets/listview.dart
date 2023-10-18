import 'package:flutter/material.dart';

import '../../../../shared/widgets/alert_confirma_remocao.dart';
import '../../../../shared/widgets/background_remover_item.dart';
import '../../../../shared/widgets/snackbar_item_deletado.dart';
import '../../../../shared/widgets/mylisttile.dart';
import '../../../data/datasource/api/delete.dart';
import '../../../data/model/medico.dart';
import '../crud.dart';

class MedicalListView extends StatefulWidget {
  final List<MedicoModel> medicos;

  const MedicalListView({
    super.key,
    required this.medicos,
  });

  @override
  State<MedicalListView> createState() => _MedicalListViewState();
}

class _MedicalListViewState extends State<MedicalListView> {
  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemCount: widget.medicos.length,
      itemBuilder: (BuildContext context, int index) {
        final MedicoModel medico = widget.medicos[index];

        return Dismissible(
          onDismissed: (direction) {
            MedicoDeleteDataSource().deleteMedico(id: medico.id_medico);
            SnackbarMensagemItemDeletado.show(context: context);
          },
          confirmDismiss: (direction) async {
            return showDialog(
                context: context,
                builder: (context) {
                  return ConfirmaDeletarItem(
                    nomeItem: medico.nome,
                  );
                });
          },
          direction: DismissDirection.endToStart,
          background: const OptionRemoverItem(),
          key: Key('$index'),
          child: MyListTile(
            isOdd: index.isOdd,
            title: medico.nome,
            line01Text: medico.crm,
            line02Text: medico.especilidade,
            imagePath: 'assets/images/livro.jpg',
            visivelSeLista: false,
            onEditPressed: () async {
              await Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => MedicoForm(
                    medicoModel: medico,
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
}
