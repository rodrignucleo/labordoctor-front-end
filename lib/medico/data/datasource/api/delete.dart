import 'package:http/http.dart' as http;

import '../../../../shared/variaveis/api.dart';

class MedicoDeleteDataSource {
  // final String baseUrl = 'http://192.140.53.145:5164/api/medico';
  // final String baseUrl = 'http://localhost:5164/api/medico';
  final String baseUrl = '$apiUrl/medico';
  // final String baseUrl = 'http://10.0.2.2:5164/api/medico';

  Future<void> deleteMedico({required int id}) async {
    final url = '$baseUrl/$id';
    final response = await http.delete(Uri.parse(url));

    if (response.statusCode != 200) {
      throw Exception('Falha ao excluir medico.');
    }
  }
}
