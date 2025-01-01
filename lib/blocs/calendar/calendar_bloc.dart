import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:wise_dose/blocs/calendar/calendar_event.dart';
import 'package:wise_dose/blocs/calendar/calendar_state.dart';





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
