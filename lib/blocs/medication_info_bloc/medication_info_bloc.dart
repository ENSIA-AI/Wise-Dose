import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

part 'medication_info_event.dart';
part 'medication_info_state.dart';

class MedicationInfoBloc
    extends Bloc<MedicationInfoEvent, MedicationInfoState> {
  MedicationInfoBloc() : super(MedicationInfoInitial());

  @override
  Stream<MedicationInfoState> mapEventToState(
      MedicationInfoEvent event) async* {
    if (event is ValidateFormEvent) {
      if (event.formKey.currentState?.validate() ?? false) {
        yield FormValidated();
      } else {
        yield FormInvalid();
      }
    }
  }
}
