// ignore_for_file: file_names, prefer_const_constructors, avoid_unnecessary_containers, sized_box_for_whitespace, prefer_const_literals_to_create_immutables

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:wise_dose/blocs/medication_bloc/medication_bloc.dart';
import 'package:wise_dose/blocs/medication_bloc/medication_event.dart';
import 'package:wise_dose/views/themes/style_simple/colors.dart';
import 'package:wise_dose/views/themes/style_simple/styles.dart';
import 'package:wise_dose/views/widgets/DateInputFormatter.dart';
import 'package:wise_dose/views/widgets/app_bar_arrow_back.dart';
// import 'package:wise_dose/views/widgets/date_text_field.dart';
import 'package:wise_dose/views/widgets/gradient_button.dart';
import 'package:wise_dose/views/widgets/number_picker.dart';
import 'package:wise_dose/views/widgets/switch_button.dart';
import 'package:wise_dose/views/widgets/text_field.dart';

class MedicationInfo extends StatelessWidget {
  final _formGlobalKey = GlobalKey<FormState>();

  String _medName = '';
  String _startDate = '';
  String _endDate = '';
  String _frequency = '';

  MedicationInfo({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
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
                        SizedBox(height: 4),
                        CustomTextFormField(
                          label: "Medication Name",
                          hint: "Enter Medication Name",
                          validate: (value) {
                            if (value == null || value.isEmpty) {
                              return "Please enter medication name.";
                            }
                            return null;
                          },
                          save: (value) {
                            _medName = value ?? '';
                          },
                        ),
                        SizedBox(height: 15),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                          children: [
                            Text("From :", style: standardText),
                            SizedBox(width: 8),
                            Container(
                              width: MediaQuery.of(context).size.width / 3.5,
                              child: CustomTextFormField(
                                label: 'start date',
                                hint: 'yyyy-mm-dd',
                                validate: (value) {
                                  if (value == null || value.isEmpty) {
                                    return "Enter a valid end date.";
                                  }
                                  final regex = RegExp(r'^\d{4}-\d{2}-\d{2}$');
                                  if (!regex.hasMatch(value)) {
                                    return 'Date must be in yyyy-mm-dd format.';
                                  }
                                  try {
                                    final parts = value.split('-');
                                    final year = int.parse(parts[0]);
                                    final month = int.parse(parts[1]);
                                    final day = int.parse(parts[2]);
                                     final parsedDate = DateTime(year, month, day);
                                    if (parsedDate.year != year || parsedDate.month != month || parsedDate.day != day) {
                                         return 'Enter a valid calendar date.';
                                        } // Validates the actual date
                                  } catch (_) {
                                    return 'Enter a valid calendar date.';
                                  }
                                  return null;
                                },
                                save: (value) {
                                  _startDate = value ?? '';
                                },
                                
                                inputFormatters: [
                                  FilteringTextInputFormatter.digitsOnly,
                                  DateInputFormatter(),
                                ],
                              ),
                            ),
                            SizedBox(width: 8),
                            Text("To :", style: standardText),
                            SizedBox(width: 8),
                            Container(
                              width: MediaQuery.of(context).size.width / 3.5,
                              child: CustomTextFormField(
                                label: 'End date',
                                hint: 'yyyy-mm-dd',
                                validate: (value) {
                                  if (value == null || value.isEmpty) {
                                    return "Enter a valid end date.";
                                  }
                                  final regex = RegExp(r'^\d{4}-\d{2}-\d{2}$');
                                  if (!regex.hasMatch(value)) {
                                    return 'Date must be in yyyy-mm-dd format.';
                                  }
                                  try {
                                    final parts = value.split('-');
                                    final year = int.parse(parts[0]);
                                    final month = int.parse(parts[1]);
                                    final day = int.parse(parts[2]);
                                     final parsedDate = DateTime(year, month, day);
  if (parsedDate.year != year || parsedDate.month != month || parsedDate.day != day) {
    return 'Enter a valid calendar date.';
  } // Validates the actual date
                                  } catch (_) {
                                    return 'Enter a valid calendar date.';
                                  }
                                  return null;
                                },
                                save: (value) {
                                  _endDate = value ?? '';
                                },
                                
                                inputFormatters: [
                                  FilteringTextInputFormatter.digitsOnly,
                                  DateInputFormatter(),
                                ],
                              ),
                            ),
                          ],
                        ),
                        SizedBox(height: 15),
                        Row(
                          children: [
                            Text("Frequency :", style: standardText),
                            SizedBox(width: 12),
                            Container(
                              width: 120,
                              child: CustomTextFormField(
                                label: '',
                                hint: 'Daily',
                                validate: (value) {
                                  if (value == null || value.isEmpty) {
                                    return "Enter frequency.";
                                  }
                                  return null;
                                },
                                save: (value) {
                                  _frequency = value ?? '';
                                },
                              ),
                            ),
                          ],
                        ),
                        SizedBox(height: 5),
                        Text('Details', style: paragraphText),
                        SizedBox(height: 4),
                        TextFormField(
                          keyboardType: TextInputType.multiline,
                          maxLines: null,
                          cursorColor: lightBlue,
                          decoration: InputDecoration(
                            border: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(12),
                            ),
                            focusedBorder: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(12.0),
                              borderSide:
                                  BorderSide(color: lightBlue, width: 2.0),
                            ),
                            contentPadding:
                                EdgeInsets.only(bottom: 60, left: 15),
                            hintText: "Enter Details",
                          ),
                          validator: (value) {
                            return null;
                          },
                        ),
                        SizedBox(height: 15),
                        /* Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceAround,
                                  children: [
                                    Text(
                                      'Add "Yes, I took my medications" button?',
                                      style: TextStyle(
                                        fontSize: 14,
                                        color: darkBlue,
                                      ),
                                    ),
                                    SizedBox(width: 4),
                                    ToggleSwitch(),
                                  ],
                                ), */
                        SizedBox(height: 5),
                        GradientButton(
                          onPressed: () {
                            if (_formGlobalKey.currentState!.validate()) {
                              _formGlobalKey.currentState!.save();
                              print('----------------');
                              print(_medName);
                              print('----------------');
                              context.read<MedicationBloc>().add(AddMedication(
                                  name: _medName,
                                  startDate: _startDate,
                                  endDate: _endDate,
                                  frequency: _frequency));
                            }
                          },
                          text: "Add Medication",
                          gradient: buttonColor,
                        ),
                        SizedBox(height: 20),
                      ],
                    ),
                  ),
                ),
              ],
            )),
          ),
        ],
      ),
    );
  }
}
