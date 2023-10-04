import 'package:equatable/equatable.dart';

// ignore: must_be_immutable
class PacienteEntity extends Equatable {
  late int? pacienteId;
  final String nome;
  final String cpf;
  final String telefone;
  final String email;
  final String senha;
  final String? senhaAntiga;

  PacienteEntity({
    this.pacienteId,
    required this.nome,
    required this.cpf,
    required this.telefone,
    required this.email,
    required this.senha,
    this.senhaAntiga,
  });

  @override
  List<Object?> get props => [pacienteId];
}
