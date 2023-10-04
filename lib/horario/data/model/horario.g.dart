// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'horario.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

HorarioModel _$HorarioModelFromJson(Map<String, dynamic> json) => HorarioModel(
      horarioId: json['horarioId'] as int?,
      medicoId: json['medicoId'] as int,
      medico: MedicoModel.fromJson(json['medico'] as Map<String, dynamic>),
      data: DateTime.parse(json['data'] as String),
      status: json['status'] as bool,
    );

Map<String, dynamic> _$HorarioModelToJson(HorarioModel instance) =>
    <String, dynamic>{
      'horarioId': instance.horarioId,
      'medicoId': instance.medicoId,
      'medico': instance.medico,
      'data': instance.data.toIso8601String(),
      'status': instance.status,
    };
