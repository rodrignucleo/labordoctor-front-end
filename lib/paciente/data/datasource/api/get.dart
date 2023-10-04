import 'dart:convert';
import 'package:http/http.dart' as http;

import '../../../../shared/variaveis/api.dart';
import '../../model/paciente.dart';

class PacienteListDataSource {
  final String baseUrl = '$apiUrl/paciente';

  Future<List<PacienteModel>> getPacientes() async {
    final response = await http
        .get(Uri.parse(baseUrl))
        .timeout(const Duration(seconds: 2));

    if (response.statusCode == 200) {
      final List<dynamic> jsonResponse = jsonDecode(response.body);
      
      print(jsonResponse);
      
      return jsonResponse.map((json) => PacienteModel.fromJson(json)).toList();
    } else {
      return [];
    }
  }

  Future<PacienteModel> getPacienteById(int id) async {
    final url = '$baseUrl/$id';
    final response =
        await http.get(Uri.parse(url)).timeout(const Duration(seconds: 2));

    if (response.statusCode == 200) {
      return PacienteModel.fromJson(jsonDecode(response.body));
    } else {
      throw Exception('Falha ao carregar paciente.');
    }
  }
}
