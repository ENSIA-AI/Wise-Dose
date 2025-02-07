import 'package:sqflite/sqflite.dart';

import 'dbhelper.dart';

class DBBaseTable {
  var db_table = 'medications';

  Future<bool> insertRecord(Map<String, dynamic> data) async {
    try {
      final database = await DBHelper.getDatabase();

      database.insert(db_table, data,
          conflictAlgorithm: ConflictAlgorithm.replace);
      return true;
    } catch (e, stacktrace) {
      print('$e --> $stacktrace');
    }
    return false;
  }

  Future<List<Map>> getOnGoingRecords(String userId) async {
    try {
      final database = await DBHelper.getDatabase();
      var data =
          await database.rawQuery(
            "SELECT * FROM $db_table WHERE user_id = ? AND DATE(end_date) >= DATE('now') ORDER BY id DESC", [userId]
          );
      return data;
    } catch (e, stacktrace) {
      print('$e --> $stacktrace');
    }
    return [];
  }

    Future<List<Map>> getCompletedRecords(String userId) async {
    try {
      final database = await DBHelper.getDatabase();
      var data =
          await database.rawQuery(
            "SELECT * FROM $db_table WHERE user_id = ? DATE(end_date) < DATE('now') ORDER BY id DESC", [userId]
          );
      return data;
    } catch (e, stacktrace) {
      print('$e --> $stacktrace');
    }
    return [];
  }

}
