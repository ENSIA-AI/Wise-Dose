import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:wise_dose/views/themes/style_simple/styles.dart';
// ignore_for_file: avoid_unnecessary_containers, prefer_const_constructors, prefer_const_literals_to_create_immutables, non_constant_identifier_names

/// Stateless version of ReminderContainer
class ReminderContainer extends StatelessWidget {
  final String name;
  final String startDate;
  final String endDate;
  final String frequency;
  const ReminderContainer({
    super.key,
    required this.name,
    required this.startDate,
    required this.endDate,
    required this.frequency,
  });

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
              Text( name, style: boldStandardText),
            ],
          ),
          const SizedBox(height: 12),
          Row(
            children: [
              SvgPicture.asset("assets/icons/Clock.svg"),
              const SizedBox(width: 8),
              Text('From:', style: paragraphText),
              const SizedBox(width: 4),
              Text(startDate, style: boldParagraphText),
              const SizedBox(width: 4),
              Text('To', style: paragraphText),
              const SizedBox(width: 4),
              Text(endDate, style: boldParagraphText),
            ],
          ),
          const SizedBox(height: 12),
          Row(
            children: [
              SvgPicture.asset('assets/icons/Frequency-Icon.svg'),
              const SizedBox(width: 8),
              Text(frequency, style: boldParagraphText),
              const SizedBox(width: 4),
              Text('per day', style: paragraphText),
            ],
          ),
        ],
      ),
    );
  }
}
