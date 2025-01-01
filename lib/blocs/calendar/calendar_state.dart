import 'package:equatable/equatable.dart';

class MedicationCalendarState extends Equatable {
  final DateTime selectedDay;
  final bool showCard;
  final bool isChecked;

  const MedicationCalendarState({
    required this.selectedDay,
    required this.showCard,
    required this.isChecked,
  });

  MedicationCalendarState copyWith({
    DateTime? selectedDay,
    bool? showCard,
    bool? isChecked,
  }) {
    return MedicationCalendarState(
      selectedDay: selectedDay ?? this.selectedDay,
      showCard: showCard ?? this.showCard,
      isChecked: isChecked ?? this.isChecked,
    );
  }

  @override
  List<Object?> get props => [selectedDay, showCard, isChecked];
}