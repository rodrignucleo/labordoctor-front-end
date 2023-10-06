import 'package:flutter/material.dart';
import '../../../horario/data/datasource/api/get.dart';
import '../../../horario/data/model/horario.dart';
import '../../../medico/data/datasource/api/get.dart';
import '../../../medico/data/model/medico.dart';
import '../../../paciente/data/datasource/api/get.dart';
import '../../../paciente/data/model/paciente.dart';
import '../../data/datasource/api/insert.dart';
import '../../data/datasource/api/update.dart';
import '../../data/model/consulta.dart';
import 'widgets/botao_gravar.dart';

class ConsultaForm extends StatefulWidget {
  final ConsultaModel? consultaModel;

  const ConsultaForm({
    Key? key,
    this.consultaModel,
  }) : super(key: key);

  @override
  ConsultaFormState createState() => ConsultaFormState();
}

class ConsultaFormState extends State<ConsultaForm> {
  final _formKey = GlobalKey<FormState>();

  late MedicoModel _medico;
  late PacienteModel _paciente;
  late HorarioModel _horario;
  final TextEditingController _dataController = TextEditingController();

  List<MedicoModel> _medicosCadastrados = [];
  List<PacienteModel> _pacientesCadastrados = [];
  List<HorarioModel> _horariosCadastrados = [];

  @override
  void initState() {
    if (widget.consultaModel != null) {
      _resgataMedicoDisponivel();
      _resgataPacienteDisponivel();
      _resgataHorarioDisponivel();
    }

    _resgataMedicoDisponivel();
    _resgataPacienteDisponivel();
    _resgataHorarioDisponivel();

    super.initState();
  }

  Future<void> _resgataMedicoDisponivel() async {
    final List<MedicoModel> medicosCadastrados =
        await MedicoListDataSource().getMedicos();

    setState(() {
      _medicosCadastrados = medicosCadastrados;
    });
  }

  Future<void> _resgataPacienteDisponivel() async {
    final List<PacienteModel> pacienteCadastrados =
        await PacienteListDataSource().getPacientes();

    setState(() {
      _pacientesCadastrados = pacienteCadastrados;
    });
  }

  Future<void> _resgataHorarioDisponivel() async {
    final List<HorarioModel> horarioCadastrados =
        await HorarioListDataSource().getHorarios();

    setState(() {
      _horariosCadastrados = horarioCadastrados;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Criar Consulta')),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 8),
        child: Form(
          autovalidateMode: AutovalidateMode.onUserInteraction,
          key: _formKey,
          child: SingleChildScrollView(
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

                                final bool isSelected =
                                    _medicosCadastrados.contains(medico);

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
                                          color:
                                              isSelected ? Colors.blue : null,
                                        ),
                                      ),
                                      onTap: () {
                                        setState(() {
                                          if (isSelected) {
                                            _medico = medico;
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

                    // selecionar o paciente
                    SizedBox(
                      height: 200,
                      child: _pacientesCadastrados.isEmpty
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
                              itemCount: _pacientesCadastrados.length,
                              itemBuilder: (BuildContext context, int index) {
                                final PacienteModel paciente =
                                    _pacientesCadastrados[index];

                                final bool isSelected =
                                    _pacientesCadastrados.contains(paciente);

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
                                        paciente.nome,
                                        style: TextStyle(
                                          fontWeight: isSelected
                                              ? FontWeight.bold
                                              : FontWeight.normal,
                                          color:
                                              isSelected ? Colors.blue : null,
                                        ),
                                      ),
                                      onTap: () {
                                        setState(() {
                                          if (isSelected) {
                                            _paciente = paciente;
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

                    // selecionar o horario disponivel
                    SizedBox(
                      height: 200,
                      child: _horariosCadastrados.isEmpty
                          ? const Center(
                              child: Column(
                                mainAxisAlignment: MainAxisAlignment.center,
                                crossAxisAlignment: CrossAxisAlignment.center,
                                children: [
                                  Text(
                                    'Nenhum horário ainda adicionado',
                                  ),
                                ],
                              ),
                            )
                          : ListView.builder(
                              shrinkWrap: true,
                              itemCount: _horariosCadastrados.length,
                              itemBuilder: (BuildContext context, int index) {
                                final HorarioModel horario =
                                    _horariosCadastrados[index];

                                final bool isSelected =
                                    _horariosCadastrados.contains(horario);

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
                                        horario.data.toString(),
                                        style: TextStyle(
                                          fontWeight: isSelected
                                              ? FontWeight.bold
                                              : FontWeight.normal,
                                          color:
                                              isSelected ? Colors.blue : null,
                                        ),
                                      ),
                                      onTap: () {
                                        setState(() {
                                          if (isSelected) {
                                            _horario = horario;
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
                          final ConsultaModel consulta = ConsultaModel(
                            id_consulta: 0,
                            medico: _medico,
                            id_medico: _medico.id_medico,
                            paciente: _paciente,
                            id_paciente: _paciente.id_paciente,
                            horario: _horario,
                            id_horario: _horario.id_horario,
                            status: true,
                          );

                          if (widget.consultaModel == null ||
                              widget.consultaModel!.id_consulta == 0) {
                            await ConsultaInsertDataSource()
                                .createConsulta(consulta: consulta);
                          } else {
                            // mas se ele ja existir, tem que fazer o update dos dados
                            consulta.id_consulta =
                                widget.consultaModel!.id_consulta;
                            await ConsultaUpdateDataSource()
                                .updateConsulta(consulta: consulta);
                          }
                        }

                        // ignore: use_build_context_synchronously
                        ScaffoldMessenger.of(context)
                            .showSnackBar(const SnackBar(
                          content: Text('Consulta adicionado'),
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
      ),
    );
  }
}
