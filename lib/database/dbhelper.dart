import 'dart:async';
import 'medication_table.dart';
import 'package:path/path.dart';
import 'package:sqflite/sqflite.dart';

class DBHelper {
  static const _database_name = "MedicationDB.db";
  static const _database_version = 3; // Increment version to trigger upgrades
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
        if (oldVersion < 2) {
          db.execute('ALTER TABLE medications ADD COLUMN user_id TEXT NOT NULL DEFAULT ""');
        }
      },
    );
    return database;
  }
}
