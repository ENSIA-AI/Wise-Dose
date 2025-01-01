import 'package:flutter_bloc/flutter_bloc.dart';
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

class MedicationCalendarBloc
    extends Bloc<MedicationCalendarEvent, MedicationCalendarState> {
  MedicationCalendarBloc()
      : super(MedicationCalendarState(
          selectedDay: DateTime.now(),
          showCard: false,
          isChecked: false,
        )) {
    on<SelectDay>((event, emit) {
      emit(state.copyWith(
        selectedDay: event.selectedDay,
        showCard: (event.selectedDay.year == 2024 &&
            event.selectedDay.month == 12 &&
            event.selectedDay.day == 16),
      ));
    });

    on<ToggleCheckbox>((event, emit) {
      emit(state.copyWith(isChecked: event.isChecked));
    });
  }
}
