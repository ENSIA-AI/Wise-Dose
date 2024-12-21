import 'dart:async';
import 'package:sqflite/sqflite.dart';
import 'package:path/path.dart';
import 'medication_table.dart';

class DBHelper {
  static const _database_name = "MedicationDB.db";
  static const _database_version = 1;
  static var database;

  static List<String> sql_codes = [MedicationTable.sql_code];

  // Get the database instance (singleton)
  static Future<Database> getDatabase() async {
    if (database != null) {
      return database;
    }

    database = await openDatabase(
      join(await getDatabasesPath(), _database_name),
      onCreate: (db, version) async {
        sql_codes.forEach((item) {
          db.execute(item);
        });
      },
      version: _database_version,
      onUpgrade: (db, oldVersion, newVersion) {
        // Upgrade logic (if needed)
      },
    );
    return database!;
  }
}
