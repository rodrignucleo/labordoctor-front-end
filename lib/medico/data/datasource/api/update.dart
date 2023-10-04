import 'dart:convert';
import 'package:http/http.dart' as http;
import '../../../../shared/variaveis/api.dart';
import '../../model/medico.dart';

class MedicoUpdateDataSource {
  final String baseUrl = '$apiUrl/medico';

  Future<MedicoModel> updateMedico({required MedicoModel medico}) async {
    final url = '$baseUrl/${medico.id_medico}';
    final response = await http.put(
      Uri.parse(url),
      headers: {'accept': '*/*', 'Content-Type': 'application/json'},
      body: jsonEncode(medico.toJson()),
    );

    if (response.statusCode == 200) {
      return MedicoModel.fromJson(jsonDecode(response.body));
    } else {
      throw Exception('Falha ao atualizar medico.');
    }
  }
}
