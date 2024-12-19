// ignore_for_file: avoid_unnecessary_containers, prefer_const_constructors, prefer_const_literals_to_create_immutables, non_constant_identifier_names

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:wise_dose/views/screens/medication-info.dart';
import 'package:wise_dose/views/themes/style_simple/colors.dart';
import 'package:wise_dose/views/themes/style_simple/styles.dart';
import 'package:wise_dose/views/widgets/app_bar.dart';
import 'package:flutter_svg/flutter_svg.dart';

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
                        },
                        child: Text(
                          'Completed',
                          style: completedSelected
                              ? orangeBoldHeaderTextUnderlined
                              : greyBoldHeaderText,
                        ),
                      ),
                      GestureDetector(
                        onTap: () {
                          context.read<HistoryBloc>().toggleSelection();
                        },
                        child: Text(
                          'On-going',
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
              child: SingleChildScrollView(
                child: Column(
                  children: List.generate(
                    4,
                    (index) => const Padding(
                      padding: EdgeInsets.symmetric(vertical: 10),
                      child: ReminderContainer(),
                    ),
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

/// Stateless version of ReminderContainer
class ReminderContainer extends StatelessWidget {
  const ReminderContainer({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.symmetric(horizontal: 15),
      padding: const EdgeInsets.all(15),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(10),
        color: Colors.white,
        boxShadow: [
          BoxShadow(
            color: const Color.fromRGBO(0, 0, 0, 0.16),
            blurRadius: 6,
            spreadRadius: 0,
            offset: const Offset(0, 3),
          ),
          BoxShadow(
            color: const Color.fromRGBO(0, 0, 0, 0.23),
            blurRadius: 6,
            spreadRadius: 0,
            offset: const Offset(0, 3),
          ),
        ],
      ),
      child: Column(
        children: [
          Row(
            children: [
              const Icon(
                Icons.calendar_month_outlined,
                size: 30,
                color: Color(0xff214353),
              ),
              const SizedBox(width: 8),
              Text('For Me:', style: standardText),
              const SizedBox(width: 4),
              Text('Paracetamol', style: boldStandardText),
            ],
          ),
          const SizedBox(height: 12),
          Row(
            children: [
              SvgPicture.asset("assets/icons/Clock.svg"),
              const SizedBox(width: 8),
              Text('From:', style: titleText),
              const SizedBox(width: 4),
              Text('01 Oct, 2024', style: boldTitleText),
              const SizedBox(width: 4),
              Text('To', style: titleText),
              const SizedBox(width: 4),
              Text('01 Nov, 2024', style: boldTitleText),
            ],
          ),
          const SizedBox(height: 12),
          Row(
            children: [
              SvgPicture.asset('assets/icons/Frequency-Icon.svg'),
              const SizedBox(width: 8),
              Text('Two', style: boldTitleText),
              const SizedBox(width: 4),
              Text('per day', style: titleText),
            ],
          ),
        ],
      ),
    );
  }
}
