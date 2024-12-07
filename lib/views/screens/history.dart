// ignore_for_file: avoid_unnecessary_containers, prefer_const_constructors, prefer_const_literals_to_create_immutables, non_constant_identifier_names

import 'package:flutter/material.dart';
import 'package:wise_dose/views/screens/medication-info.dart';
import 'package:wise_dose/views/themes/style_simple/colors.dart';
import 'package:wise_dose/views/themes/style_simple/styles.dart';
import 'package:wise_dose/views/widgets/app_bar.dart';
import 'package:flutter_svg/flutter_svg.dart';

class History extends StatefulWidget {
  const History({super.key});

  @override
  State<History> createState() => _HistoryState();
}

class _HistoryState extends State<History> {
  bool completed_selected = true;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      //bottomNavigationBar: Bottom_Nav_Bar(),
      floatingActionButton: GestureDetector(
        onTap: () {
          Navigator.push(context,
              MaterialPageRoute(builder: (context) => MedicationInfo()));
          setState(() {
            
          });
        },
        child: Container(
          width: 50,
          height: 50,
          decoration:
              BoxDecoration(shape: BoxShape.circle, gradient: buttonColor),
          child: Icon(
            Icons.add,
            color: Colors.white,
          ),
        ),
      ),
      body: Column(
        children: [
          // Fixed AppBar
          getAppBar(),
          SizedBox(height: 36),
          Container(
            padding: EdgeInsets.symmetric(horizontal: 60),
            height: 36,
            color: Colors.white,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                GestureDetector(
                  onTap: () {
                    completed_selected = !completed_selected;
                    setState(() {});
                  },
                  child: Text(
                    'Completed',
                    style: completed_selected
                        ? orangeBoldHeaderTextUnderlined
                        : greyBoldHeaderText,
                  ),
                ),
                GestureDetector(
                  onTap: () {
                    completed_selected = !completed_selected;
                    setState(() {});
                  },
                  child: Text(
                    'On going',
                    style: completed_selected
                        ? greyBoldHeaderText
                        : orangeBoldHeaderTextUnderlined,
                  ),
                ),
              ],
            ),
          ),
          SizedBox(
            height: 20,
          ),
          // Scrollable Content
          Expanded(
            child: SingleChildScrollView(
              child: Column(
                children: [
                  SizedBox(height: 20),
                  ReminderContanier(),
                  SizedBox(height: 20),
                  ReminderContanier(),
                  SizedBox(height: 20),
                  ReminderContanier(),
                  SizedBox(height: 20),
                  ReminderContanier(),
                  SizedBox(height: 20),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget ReminderContanier() {
    return Container(
      height: 145,
      margin: EdgeInsets.symmetric(horizontal: 15),
      padding: EdgeInsets.all(15),
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(10),
          color: Colors.white,
          boxShadow: [
            BoxShadow(
              color: Color.fromRGBO(0, 0, 0, 0.16),
              blurRadius: 6,
              spreadRadius: 0,
              offset: Offset(0, 3),
            ),
            BoxShadow(
              color: Color.fromRGBO(0, 0, 0, 0.23),
              blurRadius: 6,
              spreadRadius: 0,
              offset: Offset(0, 3),
            ),
          ]),
      child: Column(
        children: [
          Row(
            children: [
              Icon(
                Icons.calendar_month_outlined,
                size: 30,
                color: Color(0xff214353),
              ),
              SizedBox(
                width: 8,
              ),
              Text(
                'For Me:',
                style: headerText,
              ),
              SizedBox(
                width: 4,
              ),
              Text(
                'Paracetamol',
                style: boldHeaderText,
              ),
            ],
          ),
          SizedBox(height: 12),
          Row(
            children: [
              SvgPicture.asset("assets/icons/Clock.svg"),
              SizedBox(width: 8),
              Text(
                'From:',
                style: titleText,
              ),
              SizedBox(width: 4),
              Text(
                '01 Oct, 2024',
                style: boldTitleText,
              ),
              SizedBox(width: 4),
              Text(
                'To',
                style: titleText,
              ),
              SizedBox(width: 4),
              Text(
                '01 Nov, 2024',
                style: boldTitleText,
              ),
            ],
          ),
          SizedBox(height: 12),
          Row(
            children: [
              SvgPicture.asset(
                'assets/icons/Frequency-Icon.svg',
              ),
              SizedBox(width: 8),
              Text(
                'Two',
                style: boldTitleText,
              ),
              SizedBox(width: 4),
              Text(
                'per day',
                style: titleText,
              ),
            ],
          ),
        ],
      ),
    );
  }
}
