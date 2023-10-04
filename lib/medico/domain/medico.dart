import 'package:equatable/equatable.dart';

// ignore: must_be_immutable
class MedicoEntity extends Equatable {
  late int? id_medico;
  final String nome;
  final String crm;
  final String cpf;
  final String especilidade;
  final String telefone;
  final String email;

  MedicoEntity({
    this.id_medico,
    required this.nome,
    required this.crm,
    required this.cpf,
    required this.especilidade,
    required this.telefone,
    required this.email,
  });

  @override
  List<Object?> get props => [id_medico];
}
