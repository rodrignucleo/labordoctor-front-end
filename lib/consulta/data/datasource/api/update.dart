import 'dart:convert';
import 'package:http/http.dart' as http;
import '../../../../shared/variaveis/api.dart';
import '../../model/consulta.dart';

class ConsultaUpdateDataSource {
  final String baseUrl = '$apiUrl/schedule';

  Future<ConsultaModel> updateConsulta(
      {required ConsultaModel consulta}) async {
    final url = '$baseUrl/${consulta.consultaId}';
    final response = await http.put(
      Uri.parse(url),
      headers: {'accept': '*/*', 'Content-Type': 'application/json'},
      body: jsonEncode(consulta.toJson()),
    );

    if (response.statusCode == 200) {
      return ConsultaModel.fromJson(jsonDecode(response.body));
    } else {
      throw Exception('Falha ao atualizar consulta.');
    }
  }
}
