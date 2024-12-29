


import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:wise_dose/blocs/login_bloc/login_event.dart';
import 'package:wise_dose/blocs/login_bloc/login_state.dart';

class LoginBloc extends Bloc<LoginEvent, LoginState> {
    LoginBloc() : super(LoginInitial()){
      on<LoginSubmitted>((event, emit) async {
          try{
            /* 
              Supabase Auth here
            */
            emit(LoginSuccess());
          } catch (e) {
            emit(LoginError(e.toString()));
          }
      });
    }
}