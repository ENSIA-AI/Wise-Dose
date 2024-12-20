part of 'medication_info_bloc.dart';

abstract class MedicationInfoState {}

class MedicationInfoInitial extends MedicationInfoState {}

class FormValidated extends MedicationInfoState {}

class FormInvalid extends MedicationInfoState {}
