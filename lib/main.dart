// ignore_for_file: prefer_const_constructors, unused_import

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:wise_dose/blocs/medication_bloc/medication_bloc.dart';
import 'package:wise_dose/cubits/remember_pwd_cubit.dart';
import 'package:wise_dose/database/medication_table.dart';
import 'package:wise_dose/views/screens/calendar_page.dart';
import 'package:wise_dose/views/screens/history.dart';
import 'package:wise_dose/views/screens/login.dart';
import 'package:wise_dose/views/screens/medication-info.dart';
import 'package:wise_dose/views/screens/onboarding.dart';
import 'package:wise_dose/views/screens/signup.dart';
import 'package:wise_dose/views/widgets/bottom_bar.dart';


final MedDB = MedicationTable();

void main(){
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});
  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(create: (_) => MedicationBloc()),
        BlocProvider(create: (_) => RememberPwdCubit())
      ],
      child: MaterialApp(
        title: 'Flutter Demo',
        theme: ThemeData(
          colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
          useMaterial3: true,
        ),
        home: Login(),
        debugShowCheckedModeBanner: false,
      ),
    );
  }
}

