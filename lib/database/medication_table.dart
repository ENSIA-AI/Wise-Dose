import 'package:sqflite/sqflite.dart';
import 'package:wise_dose/database/dbhelper.dart';

import 'db_base.dart';

class MedicationTable extends DBBaseTable {
  @override
  var db_table = 'Medication';
  static String sql_code = '''
          CREATE TABLE Medication (
              id INTEGER PRIMARY KEY AUTOINCREMENT, 
              medication_name TEXT NOT NULL, 
              start_date TEXT NOT NULL,
              end_date TEXT NOT NULL,
              frequency TEXT NOT NULL,
              status TEXT NOT NULL
            )
        ''';

  // Insert a medication and determine whether it's ongoing or completed based on the end date
  Future<void> insertMedication(Map<String, dynamic> medication) async {
    final db = await DBHelper.getDatabase();
    DateTime endDate = DateTime.parse(medication['end_date']);
    DateTime now = DateTime.now();

    // Determine the status of the medication (ongoing/completed)
    String status = endDate.isAfter(now) ? 'ongoing' : 'completed';
    medication['status'] = status;

    // Insert into the database
    await db.insert(
      db_table,
      medication,
      conflictAlgorithm: ConflictAlgorithm.replace,
    );
  }

  // Fetch all ongoing medications
  Future<List<Map>> getOngoingMedications() async {
    final db = await DBHelper.getDatabase();
    DateTime now = DateTime.now();
    String formattedNow = now.toIso8601String();

    return await db.query(
      db_table,
      where: 'end_date > ? AND status = ?',
      whereArgs: [formattedNow, 'ongoing'],
    );
  }

  // Fetch all completed medications
  Future<List<Map>> getCompletedMedications() async {
    final db = await DBHelper.getDatabase();
    DateTime now = DateTime.now();
    String formattedNow = now.toIso8601String();

    return await db.query(
      db_table,
      where: 'end_date <= ? AND status = ?',
      whereArgs: [formattedNow, 'completed'],
    );
  }

  // Update the status of a medication (e.g., if the end date is passed)
  Future<void> updateMedicationStatus(int id, String status) async {
    final db = await DBHelper.getDatabase();
    await db.update(
      db_table,
      {'status': status},
      where: 'id = ?',
      whereArgs: [id],
    );
  }

  // Fetch all medications
  Future<List<Map>> getMedications() async {
    return await getRecords();
  }
}
