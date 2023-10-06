// ignore_for_file: must_be_immutable

import 'package:json_annotation/json_annotation.dart';
import '../../../medico/data/model/medico.dart';

part 'horario.g.dart';

@JsonSerializable()
class HorarioModel {
  late int horarioId;
  final int medicoId;
  final MedicoModel medico;
  final DateTime data;
  final bool status;

  HorarioModel({
    required this.horarioId,
    required this.medicoId,
    required this.medico,
    required this.data,
    required this.status,
  });

  factory HorarioModel.fromJson(Map<String, dynamic> json) =>
      _$HorarioModelFromJson(json);

  Map<String, dynamic> toJson() => _$HorarioModelToJson(this);
}
