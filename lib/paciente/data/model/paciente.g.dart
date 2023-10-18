// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'paciente.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

PacienteModel _$PacienteModelFromJson(Map<String, dynamic> json) =>
    PacienteModel(
      id_paciente: json['id_paciente'] as int,
      nome: json['nome'] as String,
      cpf: json['cpf'] as String,
      telefone: json['telefone'] as String,
      email: json['email'] as String,
      senha: json['senha'] as String,
      senhaAntiga: json['senhaAntiga'] as String?,
    );

Map<String, dynamic> _$PacienteModelToJson(PacienteModel instance) =>
    <String, dynamic>{
      'id_paciente': instance.id_paciente,
      'nome': instance.nome,
      'cpf': instance.cpf,
      'telefone': instance.telefone,
      'email': instance.email,
      'senha': instance.senha,
      'senhaAntiga': instance.senhaAntiga,
    };
