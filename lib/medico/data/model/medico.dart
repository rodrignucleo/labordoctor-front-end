// ignore_for_file: must_be_immutable, non_constant_identifier_names

import 'package:json_annotation/json_annotation.dart';

part 'medico.g.dart';

@JsonSerializable()
class MedicoModel {
  late int id_medico;
  final String nome;
  final String crm;
  final String cpf;
  final String especilidade;
  final String telefone;
  final String email;

  MedicoModel({
    required this.id_medico,
    required this.nome,
    required this.crm,
    required this.cpf,
    required this.especilidade,
    required this.telefone,
    required this.email,
  });

  factory MedicoModel.fromJson(Map<String, dynamic> json) =>
      _$MedicoModelFromJson(json);

  Map<String, dynamic> toJson() => _$MedicoModelToJson(this);
}
