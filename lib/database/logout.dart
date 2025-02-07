// ignore_for_file: avoid_print

import 'package:shared_preferences/shared_preferences.dart';
import 'package:http/http.dart' as http;

Future<void> logoutUser() async {
  final url = Uri.parse("https://wise-dose-backend-f83x.vercel.app/logout");

  try {
    final response = await http.post(url);

    if (response.statusCode == 200) {
      print("Logout successful: ${response.body}");
    } else {
      print("Failed to logout: ${response.statusCode} - ${response.body}");
    }

    final prefs = await SharedPreferences.getInstance();
    await prefs.remove("user_id");
  } catch (e) {
    print("Error: $e");
  }
}
