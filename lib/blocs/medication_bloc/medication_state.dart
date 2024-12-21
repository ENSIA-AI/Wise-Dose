import 'package:collection/collection.dart';
import 'package:equatable/equatable.dart';
import 'package:wise_dose/main.dart';






class MedicationState extends Equatable {
  final Future<List<Map<dynamic, dynamic>>> myList = MedDB.getMedications();

  MedicationState();


  @override
  List<Object?> get props => [const DeepCollectionEquality().hash(myList)];
}