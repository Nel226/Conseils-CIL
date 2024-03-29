import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:conseils_cil/data/token_local_storage.dart';
import 'package:conseils_cil/data/serveur_data.dart';
import 'package:conseils_cil/data/categories_local_storage.dart';

Future<void> getAllCategories() async {
  await login();

  var url = Uri.parse('http://192.168.11.113:3000/api/categories');

  String? token = await getToken();

  // En-têtes de la requête
  var headers = <String, String>{
    'Content-Type': 'application/json; charset=UTF-8',
    'Authorization': 'Bearer $token'
  };
  // Envoi de la requête POST
  var response = await http.get(url, headers: headers);
  final List<String> categories = jsonDecode(response.body);
  await saveCategories(categories);
}
