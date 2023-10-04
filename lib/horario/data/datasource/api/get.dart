import 'dart:convert';
import 'package:http/http.dart' as http;

import '../../../../shared/variaveis/api.dart';
import '../../model/horario.dart';

class HorarioListDataSource {
  final String baseUrl = '$apiUrl/schedule';

  Future<List<HorarioModel>> getHorarios() async {
    final response =
        await http.get(Uri.parse(baseUrl)).timeout(const Duration(seconds: 2));

    if (response.statusCode == 200) {
      final List<dynamic> jsonResponse = jsonDecode(response.body);

      return jsonResponse.map((json) => HorarioModel.fromJson(json)).toList();
    } else {
      return [];
    }
  }

  Future<HorarioModel> getHorarioById(int id) async {
    final url = '$baseUrl/$id';
    final response =
        await http.get(Uri.parse(url)).timeout(const Duration(seconds: 2));

    if (response.statusCode == 200) {
      return HorarioModel.fromJson(jsonDecode(response.body));
    } else {
      throw Exception('Falha ao carregar horario.');
    }
  }
}
