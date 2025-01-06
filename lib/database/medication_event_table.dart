/* import 'db_base.dart';


class MedicationEventTable extends DBBaseTable {
  var db_table = 'MedicationEvent';
  static String sql_code = '''
          CREATE TABLE  Medication (
              id INTEGER PRIMARY KEY AUTOINCREMENT, 
              medication_ID INTEGER NOT NULL REFERENCES Medication(medication_ID),
              start_date TEXT NOT NULL,
              end_date TEXT NOT NULL,
              frequency TEXT NOT NULL,
              hours INTEGER NOT NULL,
              minutes INTEGER NOT NULL
            )
        ''';

  Future<List<Map>> getDayMedications(String currentDate) async {
    List<Map> obj = await getOnGoingRecords();
    List<Map> result = [];
    for (var record in obj) {
      if ((DateTime.parse(record['start_date']).difference(DateTime.parse(currentDate)).inDays % int.parse(record['frequency'])) == 0) {
        result.add(record);
      }
    }
    return result;
  }
} */