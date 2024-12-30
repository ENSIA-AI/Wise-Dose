


import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:wise_dose/blocs/login_bloc/login_event.dart';
import 'package:wise_dose/blocs/login_bloc/login_state.dart';

class LoginBloc extends Bloc<LoginEvent, LoginState> {
    LoginBloc() : super(LoginInitial()){
      on<LoginSubmitted>((event, emit) async {
        try {
          /*
            Supabase Auth Here
          */ 
          if(event.email == 'rayane@gmail.com'){
            emit(LoginError("Rayane isn't allowed to enter"));
          } else {
            emit(LoginSuccess());
          }
        } catch (e) {
          emit(LoginError(e.toString()));
        }
      });



      on<LoginReInitialized>((event, emit) {
        emit(LoginInitial());
      });
    }
}