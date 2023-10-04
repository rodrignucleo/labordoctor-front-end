import 'package:http/http.dart' as http;

import '../../../../shared/variaveis/api.dart';

class PacienteDeleteDataSource {
  final String baseUrl = '$apiUrl/paciente';

  Future<void> deletePaciente({required int id}) async {
    final url = '$baseUrl/$id';
    final response = await http.delete(Uri.parse(url));

    if (response.statusCode != 200) {
      throw Exception('Falha ao excluir paciente.');
    }
  }
}
