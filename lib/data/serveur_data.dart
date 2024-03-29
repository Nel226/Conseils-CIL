import 'package:http/http.dart' as http;

void login() async {
  final response = await http.post(
    Uri.parse('https://192.168.11.101/api/auth/login'),
    body: {
      'username': 'evense',
      'password': 'emos',
    },
  );
}
