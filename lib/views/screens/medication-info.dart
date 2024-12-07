// ignore_for_file: file_names, prefer_const_constructors, avoid_unnecessary_containers, sized_box_for_whitespace, prefer_const_literals_to_create_immutables

import 'package:flutter/material.dart';
import 'package:wise_dose/views/themes/style_simple/colors.dart';
import 'package:wise_dose/views/themes/style_simple/styles.dart';
import 'package:wise_dose/views/widgets/app_bar_arrow_back.dart';
import 'package:wise_dose/views/widgets/gradient_button.dart';
import 'package:wise_dose/views/widgets/number_picker.dart';
import 'package:wise_dose/views/widgets/switch_button.dart';
import 'package:wise_dose/views/widgets/text_field.dart';

class MedicationInfo extends StatefulWidget {
  const MedicationInfo({super.key});

  @override
  State<MedicationInfo> createState() => _MedicationInfoState();
}

class _MedicationInfoState extends State<MedicationInfo> {
  final _formGlobalKey = GlobalKey<FormState>();
  final items  = ["Daily", "2 to 3 times a week", "Weekly"];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      //bottomNavigationBar: Bottom_Nav_Bar(),
      body: Column(
        children: [
          getAppBarArrowBack(context),
          Expanded(
            child: SingleChildScrollView(
              child: Column(
                children: [
                  NumberPage(),
                  Form(
                      key: _formGlobalKey,
                      child: Container(
                        margin: EdgeInsets.symmetric(horizontal: 15),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            SizedBox(
                              height: 4,
                            ),
                            // medication name
                            Container(
                              child: CustomTextFormField(
                                label: "Medication Name",
                                hint: "Enter Medication Name",
                                validate: (value) {
                                  if (value == null || value == "a") {
                                    return "aaaaa error";
                                  }
                                  return null;
                                }
                              ),
                            ),
                            SizedBox(height: 15,),
                            Row(
                              children: [
                                Text(
                                  "From :",
                                  style: standardText,
                                ),
                                SizedBox(width: 8,),
                                Container(
                                  width: 120,
                                  height: 50,
                                  child: CustomTextFormField(
                                    label: 'Start date', 
                                    hint: 'dd/mm/yyyy', 
                                    validate: (value) {
                                      if (value == null || value == "a") {
                                        return "aaaaa error";
                                      }
                                      return null;
                                    }
                                  ),
                                ),
                                SizedBox(width: 8,),
                                Text(
                                  "To : ",
                                  style: standardText,
                                ),
                                SizedBox(width: 8,),
                                Container(
                                  width: 120,
                                  height: 50,
                                  child: CustomTextFormField(
                                    label: 'End date', 
                                    hint: 'dd/mm/yyyy', 
                                    validate: (value) {
                                      if (value == null || value == "a") {
                                        return "aaaaa error";
                                      }
                                      return null;
                                    }
                                  ),
                                ),
                              ], 
                            ),
                            SizedBox(height: 15,),
                            // frequency select element
                            Row(
                              children: [
                                Text(
                                  "Frequency :",
                                  style: standardText,
                                ),
                                SizedBox(width: 12,),
                                Container(
                                  width: 120,
                                  height: 50,
                                  child: CustomTextFormField(
                                    label: '', 
                                    hint: 'Daily', 
                                    validate: (value) {
                                      if (value == null || value == "a") {
                                        return "aaaaa error";
                                      }
                                      return null;
                                    }
                                  ),
                                ),
                              ], 
                            ),
                            SizedBox(height: 5,),
                            Text(
                              'Details', // The label above the text field
                              style: paragraphText,
                            ),
                            SizedBox(
                              height: 4,
                            ),
                            Container(
                              //height: 100,
                              child: TextFormField(
                                keyboardType: TextInputType.multiline,
                                maxLines: null,
                                cursorColor: lightBlue,
                                decoration: InputDecoration(
                                  border: OutlineInputBorder(
                                    borderRadius: BorderRadius.circular(12),
                                  ),
                                  focusedBorder: OutlineInputBorder(
                                    borderRadius: BorderRadius.circular(12.0), // Border radius when focused
                                    borderSide: const BorderSide(color: lightBlue, width: 2.0),
                                  ),
              
                                  contentPadding: EdgeInsets.only(bottom: 60, left: 15), 
                                  hintText: "Enter Details",
                                  hintStyle: const TextStyle(color: Colors.grey, fontSize: 14),
                                  labelText: "",
                                  labelStyle: const TextStyle(color: Colors.grey, fontSize: 12),
                                  errorStyle: const TextStyle(
                                    fontSize: 8,
                                  ),
                                ),
                                validator: (value) {
                                  return null;
                                },
                              ),
                            ),
                            SizedBox(height: 15,),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceAround,
                              children: [
                                Text(
                                  'Add "Yes, I took my medications" button?',
                                  style: TextStyle(
                                    fontSize: 14,
                                    color: darkBlue
                                  )
                                ),
                                SizedBox(width: 4,),
                                ToggleSwitch()
                              ],
                            ),
                            SizedBox(height: 5,),
                            GradientButton(
                              onPressed: () {}, 
                              text: "Add Medication",
                              gradient: buttonColor
                            ),
                            SizedBox(height: 20,)
                          ],
                        ),
                      ))
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
