import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: ConseilsPage(), // Utilisez la classe Quiz ici
    );
  }
}

class ConseilsPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Ma Page Simple'),
      ),
      body: Center(
        child: Text(
          'Bonjour, monde!',
          style: TextStyle(fontSize: 24),
        ),
      ),
    );
  }
}
