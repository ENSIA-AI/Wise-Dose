// ignore_for_file: non_constant_identifier_names, overridden_fields

import 'db_base.dart';

class MedicationTable extends DBBaseTable {
  var db_table = 'Medication';
  static String sql_code = '''
          CREATE TABLE  Medication (
              id INTEGER PRIMARY KEY AUTOINCREMENT, 
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
    List<Map> obj = await getOnGoingRecords();
    return obj;
  }

    Future<List<Map>> getCompletedMedications() async {
    List<Map> obj = await getCompletedRecords();
    return obj;
  }


  Future<List<Map>> getDayMedications(String currentDate) async {
    List<Map> obj = await getOnGoingRecords();
    List<Map> result = [];

    for (var record in obj) {
      if(DateTime.parse(record['end_date']).difference(DateTime.parse(currentDate)).inDays >= 0 
        && DateTime.parse(currentDate).difference(DateTime.parse(record['start_date'])).inDays >= 0){
        if ((DateTime.parse(currentDate).difference(DateTime.parse(record['start_date'])).inDays % int.parse(record['frequency'])) == 0) {
          result.add(record);
        }
      }      
    }
    return result;
  }
}