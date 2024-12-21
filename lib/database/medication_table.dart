import 'db_base.dart';

class MedicationTable extends DBBaseTable {
  var db_table = 'Medication';
  static String sql_code = '''
          CREATE TABLE  Medication (
              id INTEGER PRIMARY KEY AUTOINCREMENT, 
              medication_name TEXT NOT NULL, 
              start_date TEXT NOT NULL,
              end_date TEXT NOT NULL,
              frequency TEXT NOT NULL
            )
        ''';

  Future<List<Map>> getMedications() async {
    List<Map> obj = await getRecords();
    return obj;
  }
}
