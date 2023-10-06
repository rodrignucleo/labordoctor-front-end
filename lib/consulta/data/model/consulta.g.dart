// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'consulta.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

ConsultaModel _$ConsultaModelFromJson(Map<String, dynamic> json) =>
    ConsultaModel(
      consultaId: json['consultaId'] as int?,
      medicoId: json['medicoId'] as int,
      medico: MedicoModel.fromJson(json['medico'] as Map<String, dynamic>),
      pacienteId: json['pacienteId'] as int,
      paciente:
          PacienteModel.fromJson(json['paciente'] as Map<String, dynamic>),
      horarioId: json['horarioId'] as int,
      horario: HorarioModel.fromJson(json['horario'] as Map<String, dynamic>),
      status: json['status'] as bool,
    );

Map<String, dynamic> _$ConsultaModelToJson(ConsultaModel instance) =>
    <String, dynamic>{
      'consultaId': instance.consultaId,
      'medicoId': instance.medicoId,
      'medico': instance.medico,
      'pacienteId': instance.pacienteId,
      'paciente': instance.paciente,
      'horarioId': instance.horarioId,
      'horario': instance.horario,
      'status': instance.status,
    };
