import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:conseils_cil/data/token_local_storage.dart';
import 'package:conseils_cil/data/status_local_storage.dart';

import 'package:conseils_cil/data/serveur_data.dart';

Future<void> getAllDocuments() async {
  await login();

  var url = Uri.parse('http://192.168.11.113:3000/api/documents');

  String? token = await getToken();

  // En-têtes de la requête
  var headers = <String, String>{
    'Content-Type': 'application/json; charset=UTF-8',
    'Authorization': 'Bearer $token'
  };
  // Envoi de la requête POST
  var response = await http.get(url, headers: headers);
  final List<String> status = jsonDecode(response.body);
  await saveStatus(status);
}
