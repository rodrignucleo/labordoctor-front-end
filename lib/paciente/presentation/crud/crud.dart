import 'package:flutter/material.dart';

import '../../data/datasource/api/insert.dart';
import '../../data/datasource/api/update.dart';
import '../../data/model/paciente.dart';
import 'widgets/botao_gravar.dart';
import 'widgets/cpf.dart';
import 'widgets/email.dart';
import 'widgets/nome.dart';
import 'widgets/senha.dart';
import 'widgets/telefone.dart';

class PacienteForm extends StatefulWidget {
  final PacienteModel? pacienteModel;

  const PacienteForm({
    Key? key,
    this.pacienteModel,
  }) : super(key: key);

  @override
  PacienteFormState createState() => PacienteFormState();
}

class PacienteFormState extends State<PacienteForm> {
  final _formKey = GlobalKey<FormState>();

  final TextEditingController _nomeController = TextEditingController();
  final TextEditingController _cpfController = TextEditingController();
  final TextEditingController _telefoneController = TextEditingController();
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _senhaController = TextEditingController();

  @override
  void initState() {
    if (widget.pacienteModel != null) {
      _nomeController.text = widget.pacienteModel!.nome;
      _cpfController.text = widget.pacienteModel!.cpf;
      _telefoneController.text = widget.pacienteModel!.telefone;
      _emailController.text = widget.pacienteModel!.email;
      _senhaController.text = widget.pacienteModel!.senha;
    }

    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Criar Paciente')),
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
                  NomePacienteField(controller: _nomeController),
                  CpfPacienteField(controller: _cpfController),
                  TelefonePacienteField(controller: _telefoneController),
                  EmailPacienteField(controller: _emailController),
                  SenhaPacienteField(controller: _senhaController),
                  
                  const Divider(
                    color: Color.fromARGB(255, 0, 0, 0),
                    thickness: 1.0,
                  ),
                  BotaoGravar(
                    onPressedNovo: () {
                      _nomeController.clear();
                      _cpfController.clear();
                      _telefoneController.clear();
                      _emailController.clear();
                      _senhaController.clear();
                    },
                    onPressed: () async {
                      FocusScope.of(context).unfocus();

                      if (_formKey.currentState!.validate()) {
                        final PacienteModel paciente = PacienteModel(
                          nome: _nomeController.text,
                          cpf: _cpfController.text,
                          telefone: _telefoneController.text,
                          email: _emailController.text,
                          senha: _senhaController.text,
                        );

                        if (widget.pacienteModel == null ||
                            widget.pacienteModel!.pacienteId == null) {
                          await PacienteInsertDataSource()
                              .createPaciente(paciente: paciente);
                        } else {
                          // mas se ele ja existir, tem que fazer o update dos dados
                          paciente.pacienteId =
                              widget.pacienteModel!.pacienteId;
                          await PacienteUpdateDataSource()
                              .updatePaciente(paciente: paciente);
                        }
                      }

                      // ignore: use_build_context_synchronously
                      ScaffoldMessenger.of(context).showSnackBar(const SnackBar(
                        content: Text('Paciente adicionado'),
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
