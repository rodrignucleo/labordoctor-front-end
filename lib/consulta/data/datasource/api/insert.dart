import 'dart:convert';
import 'package:http/http.dart' as http;
import '../../../../shared/variaveis/api.dart';
import '../../model/consulta.dart';

class ConsultaInsertDataSource {
  final String baseUrl = '$apiUrl/schedule';

  Future<ConsultaModel> createConsulta(
      {required ConsultaModel consulta}) async {
    final response = await http.post(Uri.parse(baseUrl),
        headers: {'Content-Type': 'application/json'},
        body: jsonEncode(consulta.toJson()));

    if (response.statusCode == 201) {
      return ConsultaModel.fromJson(jsonDecode(response.body));
    } else {
      throw Exception('Falha ao criar consulta.');
    }
  }
}
