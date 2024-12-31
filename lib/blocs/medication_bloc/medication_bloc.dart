

import 'package:flutter_bloc/flutter_bloc.dart';
import 'medication_state.dart';
import 'medication_event.dart';
import 'package:wise_dose/main.dart';

class MedicationBloc extends Bloc<MedicationEvent, MedicationState> {
  MedicationBloc() : super(MedicationOnGoingState()) {
    on<AddMedication>((event, emit) {
      MedDB.insertRecord(
        {
          'medication_name' : event.name,
          'start_date': event.startDate,
          'end_date': event.endDate,
          'frequency': event.frequency,
          'details' : event.details,
          'hours' : event.time[0],
          'minutes' : event.time[1]
        }
      );
              print("----------------");
                print('Medication Name: ${event.name}');
                print('Start Date: ${event.startDate}');
                print('End Date: ${event.endDate}');
                print('Frequency: ${event.frequency}');
                print('Details: ${event.details}');
                print('Hours: ${event.time[0]}');
                print('Minutes: ${event.time[1]}');
              print("----------------");

      emit(MedicationOnGoingState());
    },);

    on<CompletedMedication>((event, emit) {
      emit(MedicationCompletedState());
    },);

    on<OnGoingMedication>((event, emit) {
      emit(MedicationOnGoingState());
    },);
  }
}