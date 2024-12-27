// ignore_for_file: avoid_unnecessary_containers, prefer_const_constructors, prefer_const_literals_to_create_immutables, non_constant_identifier_names

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:wise_dose/blocs/medication_bloc/medication_bloc.dart';
import 'package:wise_dose/blocs/medication_bloc/medication_event.dart';
import 'package:wise_dose/blocs/medication_bloc/medication_state.dart';
import 'package:wise_dose/views/screens/medication-info.dart';
import 'package:wise_dose/views/themes/style_simple/colors.dart';
import 'package:wise_dose/views/themes/style_simple/styles.dart';
import 'package:wise_dose/views/widgets/app_bar.dart';
import 'package:wise_dose/views/widgets/reminder_container.dart';

/// Bloc for managing the selected tab (Completed or On-going)
class HistoryBloc extends Cubit<bool> {
  HistoryBloc() : super(true); // Initial state: Completed is selected

  void toggleSelection() => emit(!state);
}

class History extends StatelessWidget {
  const History({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (_) => HistoryBloc(),
      child: Scaffold(
        backgroundColor: Colors.white,
        floatingActionButton: GestureDetector(
          onTap: () {
            Navigator.push(
                context, MaterialPageRoute(builder: (context) => MedicationInfo()));
          },
          child: Container(
            width: 50,
            height: 50,
            decoration:
                BoxDecoration(shape: BoxShape.circle, gradient: buttonColor),
            child: const Icon(
              Icons.add,
              color: Colors.white,
            ),
          ),
        ),
        body: Column(
          children: [
            getAppBar(),
            const SizedBox(height: 36),
            BlocBuilder<HistoryBloc, bool>(
              builder: (context, completedSelected) {
                return Container(
                  height: 36,
                  color: Colors.white,
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      GestureDetector(
                        onTap: () {
                          context.read<HistoryBloc>().toggleSelection();
                          context.read<MedicationBloc>().add(OnGoingMedication());
                        },
                        child: Text(
                          'On-going',
                          style: completedSelected
                              ? orangeBoldHeaderTextUnderlined
                              : greyBoldHeaderText,
                        ),
                      ),
                      GestureDetector(
                        onTap: () {
                          context.read<HistoryBloc>().toggleSelection();
                          context.read<MedicationBloc>().add(CompletedMedication());
                        },
                        child: Text(
                          'Completed',
                          style: completedSelected
                              ? greyBoldHeaderText
                              : orangeBoldHeaderTextUnderlined,
                        ),
                      ),
                    ],
                  ),
                );
              },
            ),
            const SizedBox(height: 20),
            Expanded(
              child: Expanded(
                  child: BlocBuilder<MedicationBloc, MedicationState>(
                    builder: (context, medState) {
                      return FutureBuilder<List<Map<dynamic, dynamic>>>(
                        future: medState.myList,
                        builder: (context, snapshot) {
                          if (snapshot.connectionState == ConnectionState.waiting) {
                            return const Center(child: CircularProgressIndicator());
                          } else if (snapshot.hasError) {
                            return Center(child: Text('Error: ${snapshot.error}'));
                          } else if (!snapshot.hasData || snapshot.data!.isEmpty) {
                            return const Center(child: Text('No medications found'));
                          } else {
                            final medications = snapshot.data!;
                            return ListView.builder(
                              itemCount: medications.length,
                              itemBuilder: (context, index) {
                                return ListTile(
                                  title: ReminderContainer(name: medications[index]['medication_name'], startDate: medications[index]['start_date'], 
                                    endDate: medications[index]['end_date'], frequency: medications[index]['frequency'],),
                                );
                              },
                            );
                          }
                        },
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

