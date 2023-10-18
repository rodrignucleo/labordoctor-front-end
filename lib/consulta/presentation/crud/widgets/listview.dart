import 'package:flutter/material.dart';

import '../../../../shared/widgets/alert_confirma_remocao.dart';
import '../../../../shared/widgets/background_remover_item.dart';
import '../../../../shared/widgets/snackbar_item_deletado.dart';
import '../../../../shared/widgets/mylisttile.dart';
import '../../../data/datasource/api/delete.dart';
import '../../../data/model/consulta.dart';
import '../crud.dart';

class ConsultaListView extends StatefulWidget {
  final List<ConsultaModel> consultas;

  const ConsultaListView({
    super.key,
    required this.consultas,
  });

  @override
  State<ConsultaListView> createState() => _ConsultaListView();
}

class _ConsultaListView extends State<ConsultaListView> {
  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemCount: widget.consultas.length,
      itemBuilder: (BuildContext context, int index) {
        final ConsultaModel consulta = widget.consultas[index];

        return Dismissible(
          onDismissed: (direction) {
            ConsultaDeleteDataSource().deleteConsulta(id: consulta.id_consulta);
            SnackbarMensagemItemDeletado.show(context: context);
          },
          confirmDismiss: (direction) async {
            return showDialog(
                context: context,
                builder: (context) {
                  return ConfirmaDeletarItem(
                    nomeItem: consulta.horario.data as String,
                  );
                });
          },
          direction: DismissDirection.endToStart,
          background: const OptionRemoverItem(),
          key: Key('$index'),
          child: MyListTile(
            isOdd: index.isOdd,
            title: consulta.horario.data as String,
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
    );
  }
}
