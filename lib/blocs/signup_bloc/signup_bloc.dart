import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:supabase_flutter/supabase_flutter.dart';
import 'package:wise_dose/blocs/signup_bloc/signup_event.dart';
import 'package:wise_dose/blocs/signup_bloc/signup_state.dart';

class SignupBloc extends Bloc<SignupEvent, SignupState> {
  SignupBloc() : super(SignupInitial()) {
    on<SignupSubmitted>((event, emit) async {
      emit(SignupLoading());
      try {
        await Supabase.instance.client.auth.signUp(
          email: event.email,
          password: event.password,
          data: {'username': event.userName}
        );

        emit(SignupSuccess());
        
      } catch (e) {
        emit(SignupError(e.toString()));
      }
    });

    on<SignupReInitialized>(
      (event, emit) {
        emit(SignupInitial());
      },
    );
  }
}
