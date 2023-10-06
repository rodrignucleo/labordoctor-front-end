// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'horario.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

HorarioModel _$HorarioModelFromJson(Map<String, dynamic> json) => HorarioModel(
      id_horario: json['id_horario'] as int,
      id_medico: json['id_medico'] as int,
      medico: MedicoModel.fromJson(json['medico'] as Map<String, dynamic>),
      data: DateTime.parse(json['data'] as String),
      status: json['status'] as bool,
    );

Map<String, dynamic> _$HorarioModelToJson(HorarioModel instance) =>
    <String, dynamic>{
      'id_horario': instance.id_horario,
      'id_medico': instance.id_medico,
      'medico': instance.medico,
      'data': instance.data.toIso8601String(),
      'status': instance.status,
    };
