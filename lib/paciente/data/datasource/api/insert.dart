import 'dart:convert';
import 'package:http/http.dart' as http;
import '../../../../shared/variaveis/api.dart';
import '../../model/paciente.dart';

class PacienteInsertDataSource {
  final String baseUrl = '$apiUrl/paciente';

  Future<PacienteModel> createPaciente(
      {required PacienteModel paciente}) async {
    final response = await http.post(Uri.parse(baseUrl),
        headers: {'Content-Type': 'application/json'},
        body: jsonEncode(paciente.toJson()));

    if (response.statusCode == 201) {
      return PacienteModel.fromJson(jsonDecode(response.body));
    } else {
      throw Exception('Falha ao criar paciente.');
    }
  }
}