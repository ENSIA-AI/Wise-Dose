// ignore_for_file: file_names, prefer_const_constructors, avoid_unnecessary_containers, sized_box_for_whitespace, prefer_const_literals_to_create_immutables

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:wise_dose/blocs/medication_info_bloc/medication_info_bloc.dart';
import 'package:wise_dose/views/themes/style_simple/colors.dart';
import 'package:wise_dose/views/themes/style_simple/styles.dart';
import 'package:wise_dose/views/widgets/app_bar_arrow_back.dart';
import 'package:wise_dose/views/widgets/gradient_button.dart';
import 'package:wise_dose/views/widgets/number_picker.dart';
import 'package:wise_dose/views/widgets/switch_button.dart';
import 'package:wise_dose/views/widgets/text_field.dart';

class MedicationInfo extends StatelessWidget {
  final _formGlobalKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (_) => MedicationInfoBloc(),
      child: Scaffold(
        backgroundColor: Colors.white,
        body: Column(
          children: [
            getAppBarArrowBack(context),
            Expanded(
              child: SingleChildScrollView(
                child: BlocConsumer<MedicationInfoBloc, MedicationInfoState>(
                  listener: (context, state) {
                    if (state is FormValidated) {
                      ScaffoldMessenger.of(context).showSnackBar(
                        SnackBar(content: Text("Form is valid!")),
                      );
                    } else if (state is FormInvalid) {
                      ScaffoldMessenger.of(context).showSnackBar(
                        SnackBar(content: Text("Form is invalid!")),
                      );
                    }
                  },
                  builder: (context, state) {
                    return Column(
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
                                ),
                                SizedBox(height: 15),
                                Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceEvenly,
                                  children: [
                                    Text("From :", style: standardText),
                                    SizedBox(width: 8),
                                    Container(
                                      width: MediaQuery.of(context).size.width /
                                          3.5,
                                      child: CustomTextFormField(
                                        label: 'Start date',
                                        hint: 'dd/mm/yyyy',
                                        validate: (value) {
                                          if (value == null ||
                                              value.isEmpty) {
                                            return "Enter start date.";
                                          }
                                          return null;
                                        },
                                      ),
                                    ),
                                    SizedBox(width: 8),
                                    Text("To :", style: standardText),
                                    SizedBox(width: 8),
                                    Container(
                                      width: MediaQuery.of(context).size.width /
                                          3.5,
                                      child: CustomTextFormField(
                                        label: 'End date',
                                        hint: 'dd/mm/yyyy',
                                        validate: (value) {
                                          if (value == null ||
                                              value.isEmpty) {
                                            return "Enter end date.";
                                          }
                                          return null;
                                        },
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
                                          if (value == null ||
                                              value.isEmpty) {
                                            return "Enter frequency.";
                                          }
                                          return null;
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
                                      borderSide: BorderSide(
                                          color: lightBlue, width: 2.0),
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
                                Row(
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
                                ),
                                SizedBox(height: 5),
                                GradientButton(
                                  onPressed: () {
                                    context.read<MedicationInfoBloc>().add(
                                          ValidateFormEvent(_formGlobalKey),
                                        );
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
                    );
                  },
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
