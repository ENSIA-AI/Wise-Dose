// ignore_for_file: file_names

import 'package:shared_preferences/shared_preferences.dart';

Future<void> saveUserId(String userId) async {
  final prefs = await SharedPreferences.getInstance();
  await prefs.setString('user_id', userId);
}

Future<String?> getUserId() async {
  final prefs = await SharedPreferences.getInstance();
  return prefs.getString('user_id');
}

Future<void> markNewConnection(bool connection) async {
  final prefs = await SharedPreferences.getInstance();
  await prefs.setBool('new-connection', connection);
}

Future<bool?> getNewConnection() async {
  final prefs = await SharedPreferences.getInstance();
  return prefs.getBool('new-connection');
}
