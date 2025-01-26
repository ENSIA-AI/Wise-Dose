// ignore_for_file: must_be_immutable

import 'package:collection/collection.dart';
import 'package:equatable/equatable.dart';
import 'package:wise_dose/main.dart';


class MedicationCalendarState extends Equatable {
 late final Future<List<Map<dynamic, dynamic>>> dayListMedication;
  late String selectedDate;


  @override
  List<Object?> get props => [const DeepCollectionEquality().hash(dayListMedication)];

}


class MedicationDay extends MedicationCalendarState {

  MedicationDay(String selected) {
    selectedDate = selected;
    dayListMedication = MedDB.getDayMedications(selectedDate);
  }
}


class MedicationTaken extends MedicationCalendarState{}

class MedicationNotTaken extends MedicationCalendarState{}