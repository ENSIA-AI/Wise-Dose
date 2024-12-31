import 'package:flutter_bloc/flutter_bloc.dart';

class NumberPickerCubit extends Cubit<List<int>> {
  NumberPickerCubit() : super([0, 0]);

  void setMinutes(int minutes) => emit([state[0], minutes]);

  void setHours(int hours) => emit([hours, state[1]]);

}