// ignore_for_file: unrelated_type_equality_checks, avoid_print

import 'package:connectivity_plus/connectivity_plus.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:wise_dose/main.dart';

class SyncManager {
  void monitorConnectivity() async {
    Connectivity()
        .onConnectivityChanged
        .listen((List<ConnectivityResult> result) async {
      if (result != ConnectivityResult.none) {
        // Retrieve user ID from SharedPreferences
        final prefs = await SharedPreferences.getInstance();
        final userId = prefs.getString('user_id');

        if (userId != null && userId.isNotEmpty) {
          print("User id retreived");
          MedDB.syncFromSupabase(userId);
          // Sync local to Supabase
          final localRecords = await MedDB.getOnGoingRecords(userId);

          MedDB.syncToSupabase(localRecords, userId);
        }
      }
    });
  }
}
