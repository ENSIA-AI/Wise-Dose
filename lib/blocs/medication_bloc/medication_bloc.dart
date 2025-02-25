// ignore_for_file: avoid_print
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:wise_dose/database/userId.dart';
import 'medication_state.dart';
import 'medication_event.dart';
import 'package:wise_dose/main.dart';

class MedicationBloc extends Bloc<MedicationEvent, MedicationState> {
  MedicationBloc() : super(MedicationOnGoingState()) {
    on<AddMedication>(
      (event, emit) async {
        final id = await getUserId();
        final record = {
          'medication_name': event.name,
          'user_id': id,
          'start_date': event.startDate,
          'end_date': event.endDate,
          'frequency': event.frequency,
          'details': event.details,
          'hours': event.time[0],
          'minutes': event.time[1]
        };
        MedDB.insertRecord(record);
        MedDB.syncToSupabase([record], id!);
        emit(MedicationOnGoingState());
      },
    );

    on<CompletedMedication>(
      (event, emit) {
        emit(MedicationCompletedState());
      },
    );

    on<OnGoingMedication>(
      (event, emit) {
        emit(MedicationOnGoingState());
      },
    );
  }
}
