// ignore_for_file: non_constant_identifier_names, overridden_fields, annotate_overrides, avoid_print

import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:wise_dose/database/userId.dart';
import 'db_base.dart';

class MedicationTable extends DBBaseTable {
  var db_table = 'medications';

  static String sql_code = '''
    CREATE TABLE medications (
      id INTEGER PRIMARY KEY AUTOINCREMENT,
      user_id TEXT NOT NULL,
      medication_name TEXT NOT NULL,
      start_date TEXT NOT NULL,
      end_date TEXT NOT NULL,
      frequency TEXT NOT NULL,
      details TEXT,
      hours INTEGER NOT NULL,
      minutes INTEGER NOT NULL
    )
  ''';

  Future<List<Map>> getMedications() async {
    final userId = await getUserId();
    List<Map> obj = await getOnGoingRecords(userId!);
    return obj;
  }

  Future<List<Map>> getCompletedMedications() async {
    final userId = await getUserId();
    List<Map> obj = await getCompletedRecords(userId!);
    return obj;
  }

  Future<List<Map>> getDayMedications(String currentDate) async {
    final userId = await getUserId();
    List<Map> obj = await getOnGoingRecords(userId!);
    List<Map> result = [];

    for (var record in obj) {
      if (DateTime.parse(record['end_date'])
                  .difference(DateTime.parse(currentDate))
                  .inDays >=
              0 &&
          DateTime.parse(currentDate)
                  .difference(DateTime.parse(record['start_date']))
                  .inDays >=
              0) {
        if ((DateTime.parse(currentDate)
                    .difference(DateTime.parse(record['start_date']))
                    .inDays %
                int.parse(record['frequency'])) ==
            0) {
          result.add(record);
        }
      }
    }
    return result;
  }

  final String flaskBaseUrl =
      'https://wise-dose-backend-f83x.vercel.app'; // Replace with your Flask server URL

  /// Sync local data to Flask API (push local data to the server)
  Future<void> syncToSupabase(
      List<Map<dynamic, dynamic>> localRecords, String userId) async {
    final url = Uri.parse('$flaskBaseUrl/sync_to_supabase');
    final payload = {
      'user_id': userId,
      'records': localRecords,
    };

    try {
      final response = await http.post(
        url,
        headers: {'Content-Type': 'application/json'},
        body: jsonEncode(payload),
      );

      if (response.statusCode == 200) {
        print('Successfully synced to Flask');
      } else {
        print('Failed to sync to Flask: ${response.body}');
      }
    } catch (e) {
      print('Error syncing to Supabase: $e');
    }
  }

  /// Sync data from Flask API to local database (pull server data into the local database)
  Future<void> syncFromSupabase(String userId) async {
    final url = Uri.parse('$flaskBaseUrl/sync_from_supabase?user_id=$userId');

    try {
      final response = await http.get(url);

      if (response.statusCode == 200) {
        final data = jsonDecode(response.body);
        final remoteRecords = List<Map<String, dynamic>>.from(data['records']);

        // Insert or update local database
        for (final record in remoteRecords) {
          record.remove("created_at");
          record.remove("updated_at");
          await insertRecord(record);
        }

        print('Successfully synced from Flask');
      } else {
        print('Failed to sync from Flask: ${response.body}');
      }
    } catch (e) {
      print('Error syncing from Flask: $e');
    }
  }
}
