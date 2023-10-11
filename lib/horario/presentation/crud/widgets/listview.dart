import 'package:flutter/material.dart';

import '../../../../shared/widgets/alert_confirma_remocao.dart';
import '../../../../shared/widgets/background_remover_item.dart';
import '../../../../shared/widgets/snackbar_item_deletado.dart';
import '../../../../shared/widgets/mylisttile.dart';
import '../../../data/datasource/api/delete.dart';
import '../../../data/model/horario.dart';
import '../crud.dart';

class HorarioListView extends StatefulWidget {
  final List<HorarioModel> horarios;

  const HorarioListView({
    super.key,
    required this.horarios,
  });

  @override
  State<HorarioListView> createState() => _HorarioListView();
}

class _HorarioListView extends State<HorarioListView> {
  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemCount: widget.horarios.length,
      itemBuilder: (BuildContext context, int index) {
        final HorarioModel horario = widget.horarios[index];

        return Dismissible(
          onDismissed: (direction) {
            HorarioDeleteDataSource().deleteHorario(id: horario.id_horario);
            SnackbarMensagemItemDeletado.show(context: context);
          },
          confirmDismiss: (direction) async {
            return showDialog(
                context: context,
                builder: (context) {
                  return ConfirmaDeletarItem(
                    nomeItem: horario.data as String,
                  );
                });
          },
          direction: DismissDirection.endToStart,
          background: const OptionRemoverItem(),
          key: Key('$index'),
          child: MyListTile(
            isOdd: index.isOdd,
            title: horario.data as String,
            line01Text: horario.medico.nome,
            line02Text: horario.medico.especilidade,
            imagePath: 'assets/images/livro.jpg',
            visivelSeLista: false,
            onEditPressed: () async {
              await Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => HorarioForm(
                    horarioModel: horario,
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
