import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:wise_dose/blocs/calendar/calendar_event.dart';
import 'package:wise_dose/blocs/calendar/calendar_state.dart';
import 'package:intl/intl.dart';


class MedicationCalendarBloc extends Bloc<MedicationCalendarEvent, MedicationCalendarState> {
  MedicationCalendarBloc() : super(MedicationDay(DateFormat('yyyy-MM-dd').format(DateTime.now()))) {
    on<SelectDay>((event, emit) {
      emit(MedicationDay(event.selectedDate));
    });

    on<ToggleCheckbox>((event, emit) {
      
    });
  }
}
