
import 'dart:convert';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:wise_dose/blocs/signup_bloc/signup_event.dart';
import 'package:wise_dose/blocs/signup_bloc/signup_state.dart';
import 'package:http/http.dart' as http;
import 'package:wise_dose/database/userId.dart';

class SignupBloc extends Bloc<SignupEvent, SignupState> {
  SignupBloc() : super(SignupInitial()) {
    on<SignupSubmitted>((event, emit) async {
      emit(SignupLoading());
      try {
        final url = Uri.parse('https://wise-dose-backend-f83x.vercel.app/signup');

        await http.post(url,
            headers: {'Content-Type': 'application/json'},
            body: jsonEncode({
              'username': event.userName,
              'email': event.email,
              'password': event.password
            }));

        emit(SignupSuccess());
      } catch (e) {
        emit(SignupError(e.toString()));
      }
    });

      on<SignupReInitialized>((event, emit) {
        emit(SignupInitial());
      },);
    }
}