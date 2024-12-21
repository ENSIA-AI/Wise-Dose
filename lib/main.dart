// ignore_for_file: prefer_const_constructors, unused_import

import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:wise_dose/views/screens/calendar_page.dart';
import 'package:wise_dose/views/screens/login.dart';
import 'package:wise_dose/views/screens/onboarding.dart';
import 'package:wise_dose/views/screens/signup.dart';
import 'package:wise_dose/views/widgets/bottom_bar.dart';

void main(){
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      home: Bottom_Nav_Bar(),
      debugShowCheckedModeBanner: false,
    );
  }
}

