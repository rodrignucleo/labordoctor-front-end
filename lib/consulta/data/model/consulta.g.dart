// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'consulta.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

ConsultaModel _$ConsultaModelFromJson(Map<String, dynamic> json) =>
    ConsultaModel(
      id_consulta: json['id_consulta'] as int,
      id_medico: json['id_medico'] as int,
      medico: MedicoModel.fromJson(json['medico'] as Map<String, dynamic>),
      id_paciente: json['id_paciente'] as int,
      paciente:
          PacienteModel.fromJson(json['paciente'] as Map<String, dynamic>),
      id_horario: json['id_horario'] as int,
      horario: HorarioModel.fromJson(json['horario'] as Map<String, dynamic>),
      status: json['status'] as bool,
    );

Map<String, dynamic> _$ConsultaModelToJson(ConsultaModel instance) =>
    <String, dynamic>{
      'id_consulta': instance.id_consulta,
      'id_medico': instance.id_medico,
      'medico': instance.medico,
      'id_paciente': instance.id_paciente,
      'paciente': instance.paciente,
      'id_horario': instance.id_horario,
      'horario': instance.horario,
      'status': instance.status,
    };
