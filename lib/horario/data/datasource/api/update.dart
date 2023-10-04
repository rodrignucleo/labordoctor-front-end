import 'dart:convert';
import 'package:http/http.dart' as http;
import '../../../../shared/variaveis/api.dart';
import '../../model/horario.dart';

class HorarioUpdateDataSource {
  final String baseUrl = '$apiUrl/schedule';

  Future<HorarioModel> updateHorario({required HorarioModel horario}) async {
    final url = '$baseUrl/${horario.horarioId}';
    final response = await http.put(
      Uri.parse(url),
      headers: {'accept': '*/*', 'Content-Type': 'application/json'},
      body: jsonEncode(horario.toJson()),
    );

    if (response.statusCode == 200) {
      return HorarioModel.fromJson(jsonDecode(response.body));
    } else {
      throw Exception('Falha ao atualizar horario.');
    }
  }
}
