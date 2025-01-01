import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:supabase_flutter/supabase_flutter.dart';
import 'package:wise_dose/blocs/login_bloc/login_event.dart';
import 'package:wise_dose/blocs/login_bloc/login_state.dart';

class LoginBloc extends Bloc<LoginEvent, LoginState> {
  LoginBloc() : super(LoginInitial()) {
    on<LoginSubmitted>((event, emit) async {
      emit(LoginLoading());
      try {
        await Supabase.instance.client.auth
            .signInWithPassword(email: event.email, password: event.password);

        emit(LoginSuccess());
      } catch (e) {
        emit(LoginError(e.toString()));
      }
    });

    on<LoginReInitialized>((event, emit) {
      emit(LoginInitial());
    });
  }
}
