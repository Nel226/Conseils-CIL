import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

// Stocke le token
Future<void> saveCategories(List<String> categories) async {
  final prefs = await SharedPreferences.getInstance();
  await prefs.setStringList('categories', categories);
}

// Récupère le token
Future<List<String>?> getCategories() async {
  final prefs = await SharedPreferences.getInstance();
  return prefs.getStringList('categories');
}
