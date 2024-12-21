import 'package:collection/collection.dart';
import 'package:equatable/equatable.dart';
import 'package:wise_dose/main.dart';



class MedicationState {
  final List<Map> ongoingMedications;
  final List<Map> completedMedications;
  final bool isSuccess;

  MedicationState({
    required this.ongoingMedications,
    required this.completedMedications,
    required this.isSuccess,
  });

  factory MedicationState.initial() {
    return MedicationState(
      ongoingMedications: [],
      completedMedications: [],
      isSuccess: false,
    );
  }

  factory MedicationState.loaded(
      List<Map> ongoingMedications, List<Map> completedMedications) {
    return MedicationState(
      ongoingMedications: ongoingMedications,
      completedMedications: completedMedications,
      isSuccess: true,
    );
  }

  factory MedicationState.success() {
    return MedicationState(
      ongoingMedications: [],
      completedMedications: [],
      isSuccess: true,
    );
  }
}
