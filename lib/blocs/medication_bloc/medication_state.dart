import 'package:collection/collection.dart';
import 'package:equatable/equatable.dart';
import 'package:wise_dose/main.dart';



sealed class MedicationState extends Equatable {
  late final Future<List<Map<dynamic, dynamic>>> myList;

    @override
  List<Object?> get props => [const DeepCollectionEquality().hash(myList)];

}



class MedicationOnGoingState extends MedicationState {
  @override
  final Future<List<Map<dynamic, dynamic>>> myList = MedDB.getMedications();

  MedicationOnGoingState();

}


class MedicationCompletedState extends MedicationState {
  @override
  final Future<List<Map<dynamic, dynamic>>> myList = MedDB.getCompletedMedications();

  MedicationCompletedState();



}