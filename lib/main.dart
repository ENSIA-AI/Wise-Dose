// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:supabase_flutter/supabase_flutter.dart';
import 'package:wise_dose/blocs/login_bloc/login_bloc.dart';
import 'package:wise_dose/blocs/medication_bloc/medication_bloc.dart';
import 'package:wise_dose/blocs/signup_bloc/signup_bloc.dart';
import 'package:wise_dose/cubits/number_picker_cubit.dart';
import 'package:wise_dose/cubits/remember_pwd_cubit.dart';
import 'package:wise_dose/database/medication_table.dart';
import 'package:wise_dose/database/sync_services.dart';
import 'package:wise_dose/database/userId.dart';
import 'package:wise_dose/views/screens/onboarding.dart';
import 'package:wise_dose/views/widgets/bottom_bar.dart';

final MedDB = MedicationTable();
late bool newCon;

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  bool? newConnection = await getNewConnection();

  if (newConnection == null) {
    markNewConnection(true);
  } else {
    markNewConnection(false);
  }

  newCon = newConnection!;

  try {
    print("loading dotenv ...");
    await dotenv.load(fileName: ".env");
    print("dotenv loaded!");
    print("initializing supabase ...");
    await Supabase.initialize(
        url: dotenv.env['SUPABASE_URL']!,
        anonKey: dotenv.env['SUPABASE_ANON_KEY']!);

    SyncManager().monitorConnectivity();
  } catch (e) {
    throw Exception('Error initialzing app: $e');
  }
  runApp(MyApp(newConnection: newCon,));
}

class MyApp extends StatelessWidget {
  final bool newConnection;
  const MyApp({super.key, required this.newConnection});

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
        home: newCon ? Onboarding() : Bottom_Nav_Bar(),
        debugShowCheckedModeBanner: false,
      ),
    );
  }
}
