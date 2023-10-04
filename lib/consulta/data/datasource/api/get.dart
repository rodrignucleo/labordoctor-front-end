import 'dart:convert';
import 'package:http/http.dart' as http;

import '../../../../shared/variaveis/api.dart';
import '../../model/consulta.dart';

class ConsultaListDataSource {
  final String baseUrl = '$apiUrl/schedule';

  Future<List<ConsultaModel>> getConsultas() async {
    final response =
        await http.get(Uri.parse(baseUrl)).timeout(const Duration(seconds: 2));

    if (response.statusCode == 200) {
      final List<dynamic> jsonResponse = jsonDecode(response.body);

      return jsonResponse.map((json) => ConsultaModel.fromJson(json)).toList();
    } else {
      return [];
    }
  }

  Future<ConsultaModel> getConsultaById(int id) async {
    final url = '$baseUrl/$id';
    final response =
        await http.get(Uri.parse(url)).timeout(const Duration(seconds: 2));

    if (response.statusCode == 200) {
      return ConsultaModel.fromJson(jsonDecode(response.body));
    } else {
      throw Exception('Falha ao carregar consulta.');
    }
  }
}
