import 'dart:convert';
import 'package:http/http.dart' as http;
import '../../../../shared/variaveis/api.dart';
import '../../model/paciente.dart';

class PacienteUpdateDataSource {
  final String baseUrl = '$apiUrl/paciente';

  Future<PacienteModel> updatePaciente(
      {required PacienteModel paciente}) async {
    final url = '$baseUrl/${paciente.pacienteId}';
    final response = await http.put(
      Uri.parse(url),
      headers: {'accept': '*/*', 'Content-Type': 'application/json'},
      body: jsonEncode(paciente.toJson()),
    );

    if (response.statusCode == 200) {
      return PacienteModel.fromJson(jsonDecode(response.body));
    } else {
      throw Exception('Falha ao atualizar paciente.');
    }
  }
}
