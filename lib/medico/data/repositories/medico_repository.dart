import 'dart:convert';

import 'package:myapp/medico/data/http/http_client.dart';
import 'package:myapp/shared/variaveis/api.dart';
import '../model/medico_model.dart';

abstract class IMedicoRepository {
  Future<List<MedicoModel>> getMedico();
  Future<List<MedicoModel>> putMedico(MedicoModel medico);
}

class MedicoRepository implements IMedicoRepository {
  final IHttpClient client;

  MedicoRepository({required this.client});

  @override
  Future<List<MedicoModel>> getMedico() async {
    final response = await client.get(
      url: '$apiUrl/medico',
    );

    if (response.statusCode == 200) {
      final List<MedicoModel> medicos = [];

      final body = jsonDecode(response.body);

      body['tb_medico'].map((item) {
        final MedicoModel medico = MedicoModel.fromMap(item);
        medicos.add(medico);
      }).toList();

      return medicos;

    } else {
      throw Exception('Erro ao carregar medico');
    }
  }

  @override
  Future<List<MedicoModel>> putMedico(MedicoModel medico) async {
    final response = await client.put(
      url: '$apiUrl/medico/${medico.id_medico}',
      body: medico.toMap(),
    );

    if (response.statusCode == 200) {
      final List<MedicoModel> medicos = [];

      final body = jsonDecode(response.body);

      body['tb_medico'].map((item) {
        final MedicoModel medico = MedicoModel.fromMap(item);
        medicos.add(medico);
      }).toList();

      return medicos;

    } else {
      throw Exception('Erro ao carregar medico');
    }
  }

}
