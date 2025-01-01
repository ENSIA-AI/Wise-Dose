import 'package:equatable/equatable.dart';

class MedicationCalendarEvent extends Equatable {
  @override
  List<Object?> get props => [];
}

class SelectDay extends MedicationCalendarEvent {
  final DateTime selectedDay;

  SelectDay(this.selectedDay);

  @override
  List<Object?> get props => [selectedDay];
}

class ToggleCheckbox extends MedicationCalendarEvent {
  final bool isChecked;

  ToggleCheckbox(this.isChecked);

  @override
  List<Object?> get props => [isChecked];
}