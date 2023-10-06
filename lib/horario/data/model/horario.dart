// ignore_for_file: must_be_immutable

import 'package:json_annotation/json_annotation.dart';
import '../../../medico/data/model/medico.dart';

part 'horario.g.dart';

@JsonSerializable()
class HorarioModel {
  late int id_horario;
  final int id_medico;
  final MedicoModel medico;
  final DateTime data;
  final bool status;

  HorarioModel({
    required this.id_horario,
    required this.id_medico,
    required this.medico,
    required this.data,
    required this.status,
  });

  factory HorarioModel.fromJson(Map<String, dynamic> json) =>
      _$HorarioModelFromJson(json);

  Map<String, dynamic> toJson() => _$HorarioModelToJson(this);
}
