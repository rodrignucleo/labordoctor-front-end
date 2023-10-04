// ignore_for_file: must_be_immutable

import 'package:json_annotation/json_annotation.dart';
import '../../domain/paciente.dart';

part 'paciente.g.dart';

@JsonSerializable()
class PacienteModel extends PacienteEntity {
  PacienteModel({
    super.pacienteId,
    required super.nome,
    required super.cpf,
    required super.telefone,
    required super.email,
    required super.senha,
    super.senhaAntiga,
  });

  factory PacienteModel.fromJson(Map<String, dynamic> json) =>
      _$PacienteModelFromJson(json);

  Map<String, dynamic> toJson() => _$PacienteModelToJson(this);
}
