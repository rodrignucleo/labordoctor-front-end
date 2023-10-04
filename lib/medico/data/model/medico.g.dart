// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'medico.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

MedicoModel _$MedicoModelFromJson(Map<String, dynamic> json) => MedicoModel(
      id_medico: json['id_medico'] as int?,
      nome: json['nome'] as String,
      crm: json['crm'] as String,
      cpf: json['cpf'] as String,
      especilidade: json['especilidade'] as String,
      telefone: json['telefone'] as String,
      email: json['email'] as String,
    );

Map<String, dynamic> _$MedicoModelToJson(MedicoModel instance) =>
    <String, dynamic>{
      'id_medico': instance.id_medico,
      'nome': instance.nome,
      'crm': instance.crm,
      'cpf': instance.cpf,
      'especilidade': instance.especilidade,
      'telefone': instance.telefone,
      'email': instance.email,
    };
