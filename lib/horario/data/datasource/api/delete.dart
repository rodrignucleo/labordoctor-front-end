import 'package:http/http.dart' as http;

import '../../../../shared/variaveis/api.dart';

class HorarioDeleteDataSource {
  final String baseUrl = '$apiUrl/schedule';

  Future<void> deleteHorario({required int id}) async {
    final url = '$baseUrl/$id';
    final response = await http.delete(Uri.parse(url));

    if (response.statusCode != 200) {
      throw Exception('Falha ao excluir horario.');
    }
  }
}
