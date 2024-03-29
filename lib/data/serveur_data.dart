import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:conseils_cil/data/token_local_storage.dart';

String token = '';

Future<void> login() async {
  var url = Uri.parse('http://192.168.11.113:3000/api/auth/login');

  // Données à envoyer au format JSON
  var jsonData = jsonEncode({
    'username': "evens",
    'password': "emos",
  });

  // En-têtes de la requête
  var headers = <String, String>{
    'Content-Type': 'application/json; charset=UTF-8',
  };

  // Envoi de la requête POST
  var response = await http.post(url, headers: headers, body: jsonData);
  Map<String, dynamic> data = jsonDecode(response.body);
  token = data["token"];
  await saveToken(token);
}
