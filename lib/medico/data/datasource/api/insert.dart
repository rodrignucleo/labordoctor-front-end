import 'dart:convert';
import 'package:http/http.dart' as http;
import '../../../../shared/variaveis/api.dart';
import '../../model/medico.dart';

class MedicoInsertDataSource {
  final String baseUrl = '$apiUrl/medico';

  Future<MedicoModel> createMedico({required MedicoModel medico}) async {
    final response = await http.post(Uri.parse(baseUrl),
        headers: {'Content-Type': 'application/json'},
        body: jsonEncode(medico.toJson()));

    if (response.statusCode == 201) {
      return MedicoModel.fromJson(jsonDecode(response.body));
    } else {
      throw Exception('Falha ao criar medico.');
    }
  }
}
