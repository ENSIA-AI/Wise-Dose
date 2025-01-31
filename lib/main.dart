import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:wise_dose/blocs/login_bloc/login_bloc.dart';
import 'package:wise_dose/blocs/medication_bloc/medication_bloc.dart';
import 'package:wise_dose/blocs/signup_bloc/signup_bloc.dart';
import 'package:wise_dose/cubits/number_picker_cubit.dart';
import 'package:wise_dose/cubits/remember_pwd_cubit.dart';
import 'package:wise_dose/database/medication_event_table.dart';
import 'package:wise_dose/database/medication_table.dart';
import 'package:wise_dose/views/screens/calendar_page.dart';
import 'package:wise_dose/views/screens/history.dart';
import 'package:wise_dose/views/screens/login.dart';
import 'package:wise_dose/views/screens/medication-info.dart';
import 'package:wise_dose/views/screens/onboarding.dart';
import 'package:wise_dose/views/screens/scanner.dart';
import 'package:wise_dose/views/screens/signup.dart';
import 'package:wise_dose/views/widgets/bottom_bar.dart';
import 'package:wise_dose/views/widgets/number_picker.dart';
import 'package:wise_dose/database/chat_repository.dart';
import 'package:wise_dose/views/screens/chat_screen.dart';

final MedDB = MedicationTable();

void main() {
  const apiKey = 'AIzaSyBUjgb0puQXr3n2eCS0La-q_MO5y-DgLew'; // Replace with your actual API key

  runApp(
    RepositoryProvider(
      create: (context) => ChatRepository(apiKey: apiKey),
      child: const MyApp(),
    ),
  );
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(create: (_) => MedicationBloc()),
        BlocProvider(create: (_) => RememberPwdCubit()),
        BlocProvider(create: (_) => LoginBloc()),
        BlocProvider(create: (_) => SignupBloc()),
        BlocProvider(create: (_) => NumberPickerCubit()),
      ],
      child: MaterialApp(
        title: 'Wise Dose',
        theme: ThemeData(
          colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
          useMaterial3: true,
        ),
        home: Bottom_Nav_Bar(), // Directly open chat screen on launch
        debugShowCheckedModeBanner: false,
         
        
      ),
    );
  }
}