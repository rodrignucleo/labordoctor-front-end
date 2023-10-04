import 'package:http/http.dart' as http;

import '../../../../shared/variaveis/api.dart';

class ConsultaDeleteDataSource {
  final String baseUrl = '$apiUrl/schedule';

  Future<void> deleteConsulta({required int id}) async {
    final url = '$baseUrl/$id';
    final response = await http.delete(Uri.parse(url));

    if (response.statusCode != 200) {
      throw Exception('Falha ao excluir consulta.');
    }
  }
}
