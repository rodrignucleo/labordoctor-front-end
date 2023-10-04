import 'dart:convert';
import 'package:http/http.dart' as http;
import '../../../../shared/variaveis/api.dart';
import '../../model/horario.dart';

class HorarioInsertDataSource {
  final String baseUrl = '$apiUrl/schedule';

  Future<HorarioModel> createHorario({required HorarioModel horario}) async {
    final response = await http.post(Uri.parse(baseUrl),
        headers: {'Content-Type': 'application/json'},
        body: jsonEncode(horario.toJson()));

    if (response.statusCode == 201) {
      return HorarioModel.fromJson(jsonDecode(response.body));
    } else {
      throw Exception('Falha ao criar horario.');
    }
  }
}
