
import 'dart:convert';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:http/http.dart' as http;
import 'package:wise_dose/blocs/login_bloc/login_event.dart';
import 'package:wise_dose/blocs/login_bloc/login_state.dart';
import 'package:wise_dose/database/userId.dart';
import 'package:wise_dose/main.dart';

class LoginBloc extends Bloc<LoginEvent, LoginState> {
  LoginBloc() : super(LoginInitial()) {
    on<LoginSubmitted>((event, emit) async {
      emit(LoginLoading());
      try {
        final url = Uri.parse('https://wise-dose-backend-f83x.vercel.app/login');

        final response = await http.post(url,
            headers: {'Content-Type': 'application/json'},
            body:
                jsonEncode({'email': event.email, 'password': event.password}));

        print("Response code: ${response.statusCode}");

        if (response.statusCode == 200) {
          final responseData = jsonDecode(response.body);

          // Extract user_id and token from the response
          
          final userId = responseData['user_id']; 

          // Save user_id and token in SharedPreferences
          await saveUserId(userId);
          
          MedDB.syncFromSupabase(userId);
          final localRecords = await MedDB.getOnGoingRecords(userId);
          MedDB.syncToSupabase(localRecords, userId);

          print('Login successful. User ID saved: $userId');
          emit(LoginSuccess());
        } else {
          emit(LoginError("Login failed"));
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
