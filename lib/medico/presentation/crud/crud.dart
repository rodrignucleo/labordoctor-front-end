import 'package:flutter/material.dart';

import '../../data/datasource/api/insert.dart';
import '../../data/datasource/api/update.dart';
import '../../data/model/medico.dart';
import 'widgets/botao_gravar.dart';
import 'widgets/cpf.dart';
import 'widgets/crm.dart';
import 'widgets/email.dart';
import 'widgets/especialidade.dart';
import 'widgets/nome.dart';
import 'widgets/telefone.dart';

class MedicoForm extends StatefulWidget {
  final MedicoModel? medicoModel;

  const MedicoForm({
    Key? key,
    this.medicoModel,
  }) : super(key: key);

  @override
  MedicoFormState createState() => MedicoFormState();
}

class MedicoFormState extends State<MedicoForm> {
  final _formKey = GlobalKey<FormState>();

  final TextEditingController _nomeController = TextEditingController();
  final TextEditingController _crmController = TextEditingController();
  final TextEditingController _cpfController = TextEditingController();
  final TextEditingController _especilidadeController = TextEditingController();
  final TextEditingController _telefoneController = TextEditingController();
  final TextEditingController _emailController = TextEditingController();

  @override
  void initState() {
    if (widget.medicoModel != null) {
      _nomeController.text = widget.medicoModel!.nome;
      _crmController.text = widget.medicoModel!.crm;
      _cpfController.text = widget.medicoModel!.cpf;
      _especilidadeController.text = widget.medicoModel!.especilidade;
      _telefoneController.text = widget.medicoModel!.telefone;
      _emailController.text = widget.medicoModel!.email;
    }

    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Criar Medico')),
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
                  NomeMedicoField(controller: _nomeController),
                  CrmMedicoField(controller: _crmController),
                  CpfMedicoField(controller: _cpfController),
                  EspecialidadeMedicoField(controller: _especilidadeController),
                  TelefoneMedicoField(controller: _telefoneController),
                  EmailMedicoField(controller: _emailController),
                  const Divider(
                    color: Color.fromARGB(255, 0, 0, 0),
                    thickness: 1.0,
                  ),
                  BotaoGravar(
                    onPressedNovo: () {
                      _nomeController.clear();
                      _crmController.clear();
                      _cpfController.clear();
                      _especilidadeController.clear();
                      _telefoneController.clear();
                      _emailController.clear();
                    },
                    onPressed: () async {
                      FocusScope.of(context).unfocus();

                      if (_formKey.currentState!.validate()) {
                        final MedicoModel medico = MedicoModel(
                          nome: _nomeController.text,
                          crm: _crmController.text,
                          cpf: _cpfController.text,
                          especilidade: _especilidadeController.text,
                          telefone: _telefoneController.text,
                          email: _emailController.text,
                        );

                        if (widget.medicoModel == null ||
                            widget.medicoModel!.id_medico == null) {
                          await MedicoInsertDataSource()
                              .createMedico(medico: medico);
                        } else {
                          // mas se ele ja existir, tem que fazer o update dos dados
                          medico.id_medico = widget.medicoModel!.id_medico;
                          await MedicoUpdateDataSource()
                              .updateMedico(medico: medico);
                        }
                      }

                      // ignore: use_build_context_synchronously
                      ScaffoldMessenger.of(context).showSnackBar(const SnackBar(
                        content: Text('Medico adicionado'),
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
