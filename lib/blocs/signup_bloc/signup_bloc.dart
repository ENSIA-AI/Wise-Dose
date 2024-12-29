


import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:wise_dose/blocs/signup_bloc/signup_event.dart';
import 'package:wise_dose/blocs/signup_bloc/signup_state.dart';

class SignupBloc extends Bloc<SignupEvent, SignupState> {
    SignupBloc() : super(SignupInitial()){
      on<SignupSubmitted>((event, emit) async {
        try {
          /*
            Supabase Auth Here
          */ 
          emit(SignupSuccess());
          
        } catch (e) {
          emit(SignupError(e.toString()));
        }
      });
    }
}