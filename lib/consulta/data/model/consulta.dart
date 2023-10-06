// ignore_for_file: must_be_immutable

import 'package:json_annotation/json_annotation.dart';
import '../../../horario/data/model/horario.dart';
import '../../../medico/data/model/medico.dart';
import '../../../paciente/data/model/paciente.dart';

part 'consulta.g.dart';

@JsonSerializable()
class ConsultaModel {
  late int? consultaId;
  final int medicoId;
  final MedicoModel medico;
  final int pacienteId;
  final PacienteModel paciente;
  final int horarioId;
  final HorarioModel horario;
  final bool status;

  ConsultaModel({
    required this.consultaId,
    required this.medicoId,
    required this.medico,
    required this.pacienteId,
    required this.paciente,
    required this.horarioId,
    required this.horario,
    required this.status,
  });

  factory ConsultaModel.fromJson(Map<String, dynamic> json) =>
      _$ConsultaModelFromJson(json);

  Map<String, dynamic> toJson() => _$ConsultaModelToJson(this);
}
