


import 'package:flutter_bloc/flutter_bloc.dart';

class RememberPwdCubit extends Cubit<bool> {
    RememberPwdCubit() : super(false);

    void changeRememberState() => emit(!state);
}