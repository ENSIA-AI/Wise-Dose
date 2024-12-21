abstract class MedicationEvent {}

class AddMedication extends MedicationEvent {
  final String name;
  final String startDate;
  final String endDate;
  final String frequency;

  AddMedication({
    required this.name,
    required this.startDate,
    required this.endDate,
    required this.frequency,
  });
}

class LoadMedications extends MedicationEvent {}

class UpdateMedicationStatus extends MedicationEvent {
  final int id;
  final String status;

  UpdateMedicationStatus({required this.id, required this.status});
}
