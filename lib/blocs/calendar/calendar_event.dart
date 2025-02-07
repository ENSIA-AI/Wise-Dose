class MedicationCalendarEvent  {}


class SelectDay extends MedicationCalendarEvent {
  final String selectedDate;

  SelectDay({required this.selectedDate});
}


//Toggle check box will need a second attribute selected medication to specify the changed
//medication in the list
class ToggleCheckbox extends MedicationCalendarEvent {
  final bool isChecked;

  ToggleCheckbox(this.isChecked);
}