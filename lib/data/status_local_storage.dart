import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

// Stocke le token
Future<void> saveStatus(List<String> status) async {
  final prefs = await SharedPreferences.getInstance();
  await prefs.setStringList('status', status);
}

// Récupère le token
Future<List<String>?> getStatus() async {
  final prefs = await SharedPreferences.getInstance();
  return prefs.getStringList('status');
}
