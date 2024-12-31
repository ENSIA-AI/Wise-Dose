
sealed class MedicationEvent {}

final class AddMedication extends MedicationEvent {
  final String name;
  final String startDate;
  final String endDate;
  final String frequency;
  final String details;
  final List<int> time;

  AddMedication({
    required this.name,
    required this.startDate,
    required this.endDate,
    required this.frequency,
    required this.details,
    required this.time,
  });
}


final class CompletedMedication extends MedicationEvent {}


final class OnGoingMedication extends MedicationEvent {}