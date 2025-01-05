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
                                         if ( _endDate.isNotEmpty) {
                                                final endParts = _endDate!.split('-');
                                                final endYear = int.parse(endParts[0]);
                                                final endMonth = int.parse(endParts[1]);
                                                final endDay = int.parse(endParts[2]);
                                                 final endDate = DateTime(endYear, endMonth, endDay);

                                               if (parsedDate.isAfter(endDate)) {
                                                     return 'start date must be .';
                                                    }
                                                }
                                  } catch (_) {
                                    return 'Enter a valid  date.';
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
                                         if ( _startDate.isNotEmpty) {
                                                final startParts = _startDate!.split('-');
                                                final startYear = int.parse(startParts[0]);
                                                final startMonth = int.parse(startParts[1]);
                                                final startDay = int.parse(startParts[2]);
                                                 final startDate = DateTime(startYear, startMonth, startDay);

                                               if (parsedDate.isBefore(startDate)) {
                                                     return 'before the end date.';
                                                    }
                                                } 
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
      width: 200, // Adjust width as needed
      child: DropdownButtonFormField<String>(
        value: 'Every day', // Initial value, should match one of the items or be null
        decoration: InputDecoration(
          labelText: "Select Frequency",
          labelStyle: TextStyle(color: Colors.grey, fontSize: 12),
          border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(12),
          ),
          focusedBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(12),
            borderSide: BorderSide(color: lightBlue, width: 2.0), // Custom border color
          ),
          contentPadding: const EdgeInsets.symmetric(horizontal: 12),
        ),
        items: [
          DropdownMenuItem(value: 'Every day', child: Text('Every day')),
          DropdownMenuItem(value: 'Every two days', child: Text('Every two days')),
          DropdownMenuItem(value: 'Every three days', child: Text('Every three days')),
          DropdownMenuItem(value: 'Custom', child: Text('Custom')),
        ],
        onChanged: (value) {
          
            _frequency = value ?? '';
          
        },
        validator: (value) {
          if (value == null || value.isEmpty) {
            return "Please select a frequency.";
          }
          return null;
        },
        onSaved: (value) {
          _frequency = value ?? '';
        },
        // Adding a custom dropdown style
        dropdownColor: Colors.white,
        icon: Icon(Icons.arrow_drop_down, color: lightBlue),
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
                             // Save form data first to update `_startDate`
                             _formGlobalKey.currentState!.save();
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
