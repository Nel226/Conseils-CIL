import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

// Stocke le token
Future<void> saveConseils(List<String> conseils) async {
  final prefs = await SharedPreferences.getInstance();
  await prefs.setStringList('conseils', conseils);
}

// Récupère le token
Future<List<String>?> getConseils() async {
  final prefs = await SharedPreferences.getInstance();
  return prefs.getStringList('conseils');
}
