part of 'medication_info_bloc.dart';

abstract class MedicationInfoEvent {}

class ValidateFormEvent extends MedicationInfoEvent {
  final GlobalKey<FormState> formKey;

  ValidateFormEvent(this.formKey);
}
