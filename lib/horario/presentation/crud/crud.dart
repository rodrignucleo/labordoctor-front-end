import 'package:flutter/material.dart';
import 'package:myapp/medico/data/datasource/api/get.dart';
import 'package:myapp/medico/data/model/medico.dart';

import '../../data/datasource/api/insert.dart';
import '../../data/datasource/api/update.dart';
import '../../data/model/horario.dart';
import 'widgets/botao_gravar.dart';
import 'widgets/data.dart';

class HorarioForm extends StatefulWidget {
  final HorarioModel? horarioModel;

  const HorarioForm({
    Key? key,
    this.horarioModel,
  }) : super(key: key);

  @override
  HorarioFormState createState() => HorarioFormState();
}

class HorarioFormState extends State<HorarioForm> {
  final _formKey = GlobalKey<FormState>();

  late MedicoModel _medico;
  final TextEditingController _dataController = TextEditingController();

  List<MedicoModel> _medicosCadastrados = [];
  List<MedicoModel> _medicoSelecionado = [];

  @override
  void initState() {
    if (widget.horarioModel != null) {
      _dataController.text = widget.horarioModel!.data.toString();

      // funcoes para resgatar o medico
      _resgataMedicoDisponivel();
    }

    _resgataMedicoDisponivel();
    super.initState();
  }

  Future<void> _resgataMedicoDisponivel() async {
    final List<MedicoModel> medicosCadastrados =
        await MedicoListDataSource().getMedicos();

    setState(() {
      _medicosCadastrados = medicosCadastrados;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Criar Horario')),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 8),
        child: Form(
          autovalidateMode: AutovalidateMode.onUserInteraction,
          key: _formKey,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              Column(
                children: [
                  // selecionar o medico
                  SizedBox(
                    height: 200,
                    child: _medicosCadastrados.isEmpty
                        ? const Center(
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.center,
                              crossAxisAlignment: CrossAxisAlignment.center,
                              children: [
                                Text(
                                  'Nenhum médico ainda adicionado',
                                ),
                              ],
                            ),
                          )
                        : ListView.builder(
                            shrinkWrap: true,
                            itemCount: _medicosCadastrados.length,
                            itemBuilder: (BuildContext context, int index) {
                              final MedicoModel medico =
                                  _medicosCadastrados[index];

                              // final bool isSelected = _medicosCadastrados.contains(medico);
                              final bool isSelected =
                                  _medicoSelecionado.contains(medico);

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
                                      medico.nome,
                                      style: TextStyle(
                                        fontWeight: isSelected
                                            ? FontWeight.bold
                                            : FontWeight.normal,
                                        color: isSelected ? Colors.blue : null,
                                      ),
                                    ),
                                    onTap: () {
                                      setState(() {
                                        if (isSelected) {
                                          _medicoSelecionado.remove(medico);
                                        } else {
                                          _medicoSelecionado.add(medico);
                                          _medico = medico;
                                          print('medico: $medico');
                                        }
                                      });
                                    },
                                    tileColor: isSelected
                                        ? Colors.blue.withOpacity(0.5)
                                        : null,
                                  ),
                                ),
                              );
                            },
                          ),
                  ),

                  DataHorarioField(controller: _dataController),

                  const Divider(
                    color: Color.fromARGB(255, 0, 0, 0),
                    thickness: 1.0,
                  ),
                  BotaoGravar(
                    onPressedNovo: () {
                      _dataController.clear();
                    },
                    onPressed: () async {
                      FocusScope.of(context).unfocus();

                      if (_formKey.currentState!.validate()) {
                        final HorarioModel horario = HorarioModel(
                          // data: DateTime.parse(_dataController.text),
                          // estamos com problema aqui
                          data: DateTime.now(),
                          medico: _medico,
                          medicoId: _medico.id_medico as int,
                          status: true,
                        );

                        if (widget.horarioModel == null ||
                            widget.horarioModel!.horarioId == null) {
                          await HorarioInsertDataSource()
                              .createHorario(horario: horario);
                        } else {
                          // mas se ele ja existir, tem que fazer o update dos dados
                          horario.horarioId = widget.horarioModel!.horarioId;
                          await HorarioUpdateDataSource()
                              .updateHorario(horario: horario);
                        }
                      }

                      // ignore: use_build_context_synchronously
                      ScaffoldMessenger.of(context).showSnackBar(const SnackBar(
                        content: Text('Horario adicionado'),
                        duration: Duration(seconds: 2),
                      ));
                    },
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
