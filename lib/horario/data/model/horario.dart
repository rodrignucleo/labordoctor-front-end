// ignore_for_file: must_be_immutable

import 'package:json_annotation/json_annotation.dart';
import '../../../medico/data/model/medico.dart';
import '../../domain/horario.dart';

part 'horario.g.dart';

@JsonSerializable()
class HorarioModel extends HorarioEntity {
  HorarioModel({
    super.horarioId,
    required super.medicoId,
    required super.medico,
    required super.data,
    required super.status,
  });

  factory HorarioModel.fromJson(Map<String, dynamic> json) =>
      _$HorarioModelFromJson(json);

  Map<String, dynamic> toJson() => _$HorarioModelToJson(this);
}
