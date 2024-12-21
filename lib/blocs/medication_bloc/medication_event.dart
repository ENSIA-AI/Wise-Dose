
sealed class MedicationEvent {}

final class AddMedication extends MedicationEvent {
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