import 'package:flutter/material.dart';
import 'package:myapp/medico/data/model/medico.dart';

// nesta classe estamos tentando simplificar a apresentação
// das opções de horario, paciente e médico, passando o valor
// selecionado por callback para a funcao principal

// ignore: must_be_immutable
class SelectViewList extends StatefulWidget {
  late String textoDeApresentacao;
  late dynamic item;
  late List<dynamic> itens;
  late Function funcaoDeRetorno;

  SelectViewList({
    super.key,
    this.item,
    required this.itens,
    required this.textoDeApresentacao,
    required this.funcaoDeRetorno,
  });

  @override
  State<SelectViewList> createState() => _SelectViewListState();
}

class _SelectViewListState extends State<SelectViewList> {
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 200,
      child: widget.itens.isEmpty
          ? const Center(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Text(
                    'Nenhum dado cadastrado',
                  ),
                ],
              ),
            )
          : ListView.builder(
              shrinkWrap: true,
              itemCount: widget.itens.length,
              itemBuilder: (BuildContext context, int index) {
                final dynamic selectedItem = widget.itens[index];

                final bool isSelected = widget.itens.contains(selectedItem);

                return Padding(
                  padding: const EdgeInsets.all(3.0),
                  child: Container(
                    decoration: BoxDecoration(
                      border: Border.all(
                        color: Colors.grey,
                        width: 1.0,
                      ),
                    ),
                    child: ListTile(
                      title: Text(
                        widget.textoDeApresentacao,
                        style: TextStyle(
                          fontWeight:
                              isSelected ? FontWeight.bold : FontWeight.normal,
                          color: isSelected ? Colors.blue : null,
                        ),
                      ),
                      onTap: () {
                        setState(() {
                          if (isSelected) {
                            widget.item = selectedItem;
                            widget.funcaoDeRetorno(selectedItem);
                          }
                        });
                      },
                      tileColor:
                          isSelected ? Colors.blue.withOpacity(0.5) : null,
                    ),
                  ),
                );
              },
            ),
    );
  }
}
