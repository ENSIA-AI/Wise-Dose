// ignore_for_file: constant_identifier_names, prefer_typing_uninitialized_variables, non_constant_identifier_names, avoid_function_literals_in_foreach_calls

import 'dart:async';
import 'medication_table.dart';
import 'package:path/path.dart';
import 'package:sqflite/sqflite.dart';


class DBHelper {
  static const _database_name = "MedicationDB.db";
  static const _database_version = 1;
  static var database;

  static List<String> sql_codes = [MedicationTable.sql_code];
  static Future<Database> getDatabase() async {

    if (database != null) {
      return database;
    }

    database = openDatabase(
      join(await getDatabasesPath(), _database_name),
      onCreate: (database, version) {
        sql_codes.forEach((item) {
          database.execute(item);
        });
      },
      version: _database_version,
      onUpgrade: (db, oldVersion, newVersion) {
        //do nothing...
      },
    );
    return database;
  }
}
