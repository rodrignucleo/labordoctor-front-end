// ignore_for_file: must_be_immutable

import 'package:json_annotation/json_annotation.dart';
import '../../../horario/data/model/horario.dart';
import '../../../medico/data/model/medico.dart';
import '../../../paciente/data/model/paciente.dart';

part 'consulta.g.dart';

@JsonSerializable()
class ConsultaModel {
  late int id_consulta;
  final int id_medico;
  final MedicoModel medico;
  final int id_paciente;
  final PacienteModel paciente;
  final int id_horario;
  final HorarioModel horario;
  final bool status;

  ConsultaModel({
    required this.id_consulta,
    required this.id_medico,
    required this.medico,
    required this.id_paciente,
    required this.paciente,
    required this.id_horario,
    required this.horario,
    required this.status,
  });

  factory ConsultaModel.fromJson(Map<String, dynamic> json) =>
      _$ConsultaModelFromJson(json);

  Map<String, dynamic> toJson() => _$ConsultaModelToJson(this);
}
