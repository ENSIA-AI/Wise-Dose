// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables, sized_box_for_whitespace

import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:wise_dose/views/themes/style_simple/styles.dart';

Widget getAppBarSettings() {
  return Container(
    height: 100,
    child: ClipRRect(
      borderRadius: BorderRadius.vertical(
        bottom: Radius.circular(32), // Adjust the radius for rounded corners
      ),
      child: Container(
        margin: EdgeInsets.symmetric(vertical: 5),
        height: 95,
        decoration: BoxDecoration(
            borderRadius: BorderRadius.vertical(
              bottom: Radius.circular(32),
            ),
            color: Colors.white, // AppBar background color
            boxShadow: [
              BoxShadow(
                color: Color.fromRGBO(0, 0, 0, 0.16),
                blurRadius: 6,
                spreadRadius: 0,
                offset: Offset(
                  0,
                  3,
                ),
              ),
              BoxShadow(
                color: Color.fromRGBO(0, 0, 0, 0.23),
                blurRadius: 6,
                spreadRadius: 0,
                offset: Offset(
                  0,
                  3,
                ),
              ),
            ]),
        child: SafeArea(
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 16.0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Icon(
                  Icons.arrow_back
                ),
                Text(
                  "Settings" , 
                  style: boldHeaderText,

                ),
                SvgPicture.asset("assets/icons/Reminder.svg")
              ],
            ),
          ),
        ),
      ),
    ),
  );
}
