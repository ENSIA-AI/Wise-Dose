// ignore_for_file: non_constant_identifier_names, avoid_print

import 'package:sqflite/sqflite.dart';

import 'dbhelper.dart';

class DBBaseTable {
  var db_table = 'TABLE_NAME_MUST_OVERRIDE';

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

  Future<List<Map>> getOnGoingRecords() async {
    try {
      final database = await DBHelper.getDatabase();
      var data =
          await database.rawQuery(
            "SELECT * FROM $db_table WHERE DATE(end_date) >= DATE('now') ORDER BY id DESC"
          );
      return data;
    } catch (e, stacktrace) {
      print('$e --> $stacktrace');
    }
    return [];
  }

    Future<List<Map>> getCompletedRecords() async {
    try {
      final database = await DBHelper.getDatabase();
      var data =
          await database.rawQuery(
            "SELECT * FROM $db_table WHERE DATE(end_date) < DATE('now') ORDER BY id DESC"
          );
      return data;
    } catch (e, stacktrace) {
      print('$e --> $stacktrace');
    }
    return [];
  }

}
