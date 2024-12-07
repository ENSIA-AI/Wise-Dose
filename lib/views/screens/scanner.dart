// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:wise_dose/views/themes/style_simple/colors.dart';
import 'package:wise_dose/views/themes/style_simple/styles.dart';
import 'package:wise_dose/views/widgets/app_bar.dart';
import 'package:wise_dose/views/widgets/gradient_button.dart';

class Scanner extends StatefulWidget {
  const Scanner({super.key});

  @override
  State<Scanner> createState() => _ScannerState();
}

class _ScannerState extends State<Scanner> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      //bottomNavigationBar: Bottom_Nav_Bar(),
      backgroundColor: Colors.white,
      body: Column(
        children: [
          getAppBar(),
          Container(
            margin: EdgeInsets.symmetric(horizontal: 30),
            child: Column(
              children: [
                SizedBox(height: 15,),
                Text(
                  'Scanner',
                  style: boldHeaderText,
                ),
                SizedBox(height: 30,),
                SvgPicture.asset("assets/images/qr-code-scan.svg"),
                SizedBox(height: 24,),
                Text(
                  'Scan your medications directly and avoid filling boring forms!',
                  style: standardText,
                  textAlign: TextAlign.center,
                ),
                SizedBox(height: 30,),
                GradientButton(
                  onPressed: () {}, 
                  text: "Scan now", 
                  gradient: buttonColor
                )
              ],
            ),
          ),
        ],
      ),
    );
  }
}
