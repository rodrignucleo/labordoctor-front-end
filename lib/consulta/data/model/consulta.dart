// ignore_for_file: must_be_immutable

import 'package:json_annotation/json_annotation.dart';
import '../../../horario/data/model/horario.dart';
import '../../../medico/data/model/medico.dart';
import '../../../paciente/data/model/paciente.dart';
import '../../domain/consulta.dart';

part 'consulta.g.dart';

@JsonSerializable()
class ConsultaModel extends ConsultaEntity {
  ConsultaModel({
    super.consultaId,
    required super.medicoId,
    required super.medico,
    required super.pacienteId,
    required super.paciente,
    required super.horarioId,
    required super.horario,
    required super.status,
  });

  factory ConsultaModel.fromJson(Map<String, dynamic> json) =>
      _$ConsultaModelFromJson(json);

  Map<String, dynamic> toJson() => _$ConsultaModelToJson(this);
}
