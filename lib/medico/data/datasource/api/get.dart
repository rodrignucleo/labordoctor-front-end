import 'dart:convert';
import 'package:http/http.dart' as http;

import '../../../../shared/variaveis/api.dart';
import '../../model/medico.dart';

class MedicoListDataSource {
  final String baseUrl = '$apiUrl/medico';

  Future<List<MedicoModel>> getMedicos() async {
    final response =
        await http.get(Uri.parse(baseUrl)).timeout(const Duration(seconds: 4));

    if (response.statusCode == 200) {
      final List<dynamic> jsonResponse = jsonDecode(response.body);

      print(jsonResponse);

      return jsonResponse.map((json) => MedicoModel.fromJson(json)).toList();
    } else {
      return [];
    }
  }

  Future<MedicoModel> getMedicoById(int id) async {
    final url = '$baseUrl/$id';
    final response =
        await http.get(Uri.parse(url)).timeout(const Duration(seconds: 2));

    if (response.statusCode == 200) {
      return MedicoModel.fromJson(jsonDecode(response.body));
    } else {
      throw Exception('Falha ao carregar medico.');
    }
  }
}
