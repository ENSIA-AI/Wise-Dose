// ignore_for_file: file_names, prefer_const_literals_to_create_immutables, prefer_const_constructors

import 'package:flutter/material.dart';
import 'package:numberpicker/numberpicker.dart';
import 'package:wise_dose/views/themes/style_simple/styles.dart';

class NumberPage extends StatefulWidget {
  const NumberPage({super.key});

  @override
  State<NumberPage> createState() => _NumberPageState();
}

class _NumberPageState extends State<NumberPage> {
  var hour = 0;
  var minute = 0;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 20),
      child: Container(
        height: 200,
        width: MediaQuery.of(context).size.width,
        padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
        decoration: BoxDecoration(
            color: Colors.white, borderRadius: BorderRadius.circular(10)),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            NumberPicker(
              minValue: 0,
              maxValue: 23,
              value: hour,
              zeroPad: true,
              infiniteLoop: true,
              itemWidth: 80,
              itemHeight: 60,
              onChanged: (value) {
                setState(() {
                  hour = value;
                });
              },
              textStyle: unselectedCounter,
              selectedTextStyle: selectedCounter,
            ),
            Text(
              ":",
              style: TextStyle(color: Colors.black, fontSize: 40.0),
            ),
            NumberPicker(
              minValue: 0,
              maxValue: 59,
              value: minute,
              zeroPad: true,
              infiniteLoop: true,
              itemWidth: 80,
              itemHeight: 60,
              onChanged: (value) {
                setState(() {
                  minute = value;
                });
              },
              textStyle: unselectedCounter,
              selectedTextStyle: selectedCounter,
            ),
            Column(
              children: [
                const SizedBox(
                  height: 15,
                ),
              ],
            )
          ],
        ),
      ),
    );
  }
}
