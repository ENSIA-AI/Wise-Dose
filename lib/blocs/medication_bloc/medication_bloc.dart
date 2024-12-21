import 'package:bloc/bloc.dart';
import 'package:wise_dose/blocs/medication_bloc/medication_event.dart';
import 'package:wise_dose/blocs/medication_bloc/medication_state.dart';
import 'package:wise_dose/database/medication_table.dart';

class MedicationBloc extends Bloc<MedicationEvent, MedicationState> {
  final MedicationTable medicationTable;

  MedicationBloc(this.medicationTable) : super(MedicationState.initial()) {
    on<AddMedication>(_onAddMedication);
    on<LoadMedications>(_onLoadMedications);
    on<UpdateMedicationStatus>(_onUpdateMedicationStatus);
  }

  Future<void> _onAddMedication(
      AddMedication event, Emitter<MedicationState> emit) async {
    try {
      print('Adding medication: ${event.name}');
      await medicationTable.insertMedication({
        'medication_name': event.name,
        'start_date': event.startDate,
        'end_date': event.endDate,
        'frequency': event.frequency,
      });
      print('Medication added successfully.');
      add(LoadMedications()); // Refresh the medication list after adding
    } catch (error) {
      
    }
  }

  Future<void> _onLoadMedications(
      LoadMedications event, Emitter<MedicationState> emit) async {
    try {
      List<Map> ongoingMedications =
          await medicationTable.getOngoingMedications();
      List<Map> completedMedications =
          await medicationTable.getCompletedMedications();
      emit(MedicationState.loaded(ongoingMedications, completedMedications));
    } catch (error) {
      print('Error loading medications: $error');
      
    }
  }

  Future<void> _onUpdateMedicationStatus(
      UpdateMedicationStatus event, Emitter<MedicationState> emit) async {
    try {
      await medicationTable.updateMedicationStatus(event.id, event.status);
      print('Medication status updated successfully.');
      add(LoadMedications()); // Refresh the medication list after updating
    } catch (error) {
      print('Error updating medication status: $error');
     
    }
  }
}
