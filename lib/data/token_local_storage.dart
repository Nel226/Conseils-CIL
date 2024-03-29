import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

// Stocke le token
Future<void> saveToken(String token) async {
  final prefs = await SharedPreferences.getInstance();
  await prefs.setString('token', token);
}

// Récupère le token
Future<String?> getToken() async {
  final prefs = await SharedPreferences.getInstance();
  return prefs.getString('token');
}
