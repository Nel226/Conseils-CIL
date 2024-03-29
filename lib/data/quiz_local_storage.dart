import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

// Stocke le token
Future<void> saveQuiz(List<String> quiz) async {
  final prefs = await SharedPreferences.getInstance();
  await prefs.setStringList('quiz', quiz);
}

// Récupère le token
Future<List<String>?> getQuiz() async {
  final prefs = await SharedPreferences.getInstance();
  return prefs.getStringList('quiz');
}
