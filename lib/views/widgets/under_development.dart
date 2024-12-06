// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';
import 'package:wise_dose/views/themes/style_simple/styles.dart';

class UnderDevelopment extends StatelessWidget {
  const UnderDevelopment({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      //bottomNavigationBar: Bottom_Nav_Bar(),
      body: Container(
        height: MediaQuery.of(context).size.height,
        color: Colors.white,
        margin: EdgeInsets.only(top: 100),
        child: Text(
          "This page is still under development since it needs backend features",
          style: selectedCounter,
          textAlign: TextAlign.center,
        ),
      ),
    );
  }
}
