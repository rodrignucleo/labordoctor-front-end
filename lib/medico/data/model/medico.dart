// ignore_for_file: must_be_immutable

import 'package:json_annotation/json_annotation.dart';
import '../../domain/medico.dart';

part 'medico.g.dart';

@JsonSerializable()
class MedicoModel extends MedicoEntity {
  MedicoModel({
    super.id_medico,
    required super.nome,
    required super.crm,
    required super.cpf,
    required super.especilidade,
    required super.telefone,
    required super.email,
  });

  factory MedicoModel.fromJson(Map<String, dynamic> json) =>
      _$MedicoModelFromJson(json);

  Map<String, dynamic> toJson() => _$MedicoModelToJson(this);
}
