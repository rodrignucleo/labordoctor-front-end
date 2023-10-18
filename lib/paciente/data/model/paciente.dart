// ignore_for_file: must_be_immutable

import 'package:json_annotation/json_annotation.dart';

part 'paciente.g.dart';

@JsonSerializable()
class PacienteModel {
  late int id_paciente;
  final String nome;
  final String cpf;
  final String telefone;
  final String email;
  final String senha;
  final String? senhaAntiga;

  PacienteModel({
    required this.id_paciente,
    required this.nome,
    required this.cpf,
    required this.telefone,
    required this.email,
    required this.senha,
    this.senhaAntiga,
  });

  factory PacienteModel.fromJson(Map<String, dynamic> json) =>
      _$PacienteModelFromJson(json);

  Map<String, dynamic> toJson() => _$PacienteModelToJson(this);
}
