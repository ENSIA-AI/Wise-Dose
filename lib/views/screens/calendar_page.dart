// ignore_for_file: depend_on_referenced_packages, library_private_types_in_public_api, prefer_const_constructors, prefer_const_literals_to_create_immutables, unused_import

import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:table_calendar/table_calendar.dart';
import 'package:intl/intl.dart';
import 'package:wise_dose/views/widgets/app_bar.dart';
import 'package:wise_dose/views/widgets/bottom_bar.dart';
import 'package:wise_dose/views/screens/medication-info.dart';
import 'package:wise_dose/views/themes/style_simple/colors.dart';
import 'package:wise_dose/views/themes/style_simple/styles.dart';
// import 'package:lucide_icons/lucide_icons.dart';

class MedicationCalendarPage extends StatefulWidget {
  const MedicationCalendarPage({super.key});

  @override
  _MedicationCalendarPageState createState() => _MedicationCalendarPageState();
}

class _MedicationCalendarPageState extends State<MedicationCalendarPage> {
  DateTime today = DateTime.now();
  bool showCard = false;
  bool isChecked = false;
  void _onDaySelected(DateTime day, DateTime focusedDay) {
    setState(() {
      today = day;
      showCard = (day.year == 2024 && day.month == 12 && day.day == 16);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
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
          getAppBar(),
          Expanded(
            child: SingleChildScrollView(
              child: Column(
                children: [
                  Padding(
                    padding: const EdgeInsets.all(20.0),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        Padding(
                          padding: const EdgeInsets.all(20.0),
                          child: Text(
                            "Calendar",
                            style: boldHeaderText,
                          ),
                        ),
                       Column(
                children: [
                  Container(
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(15),
                border: Border.all(
                  color: Colors.white,
                  width: 2,
                ),
                boxShadow: [
                  BoxShadow(
                    color: Colors.black.withOpacity(0.2),
                    spreadRadius: 2,
                    blurRadius: 8,
                    offset: Offset(4, 4),
                  ),
                ],
              ),
              child: TableCalendar(
                locale: "en_US",
                headerStyle: HeaderStyle(
                  formatButtonVisible: false,
                  titleCentered: true,
                ),
                availableGestures: AvailableGestures.all,
                selectedDayPredicate: (day) => isSameDay(day, today),
                focusedDay: today,
                firstDay: DateTime.utc(2010, 10, 16),
                lastDay: DateTime.utc(2030, 10, 16),
                onDaySelected: _onDaySelected,
                calendarBuilders: CalendarBuilders(
                  headerTitleBuilder: (context, day) {
                    String formattedDate = DateFormat('d MMMM, yyyy').format(today);
                    return Center(
                      child: Text(
                        formattedDate,
                        style: TextStyle(
                          fontSize: 20,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    );
                  },
                ),
                calendarStyle: CalendarStyle(
                  selectedDecoration: BoxDecoration(
                    color: Color(0xff214353),
                    shape: BoxShape.circle,
                  ),
                  todayDecoration: BoxDecoration(
                    color: Color(0xff214353).withOpacity(0.3),
                    shape: BoxShape.circle,
                  ),
                  selectedTextStyle: TextStyle(
                    color: Colors.white,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
                  ),
                  Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20.0, vertical: 20.0),
              child: Row(
                children: [
                  Text(
                    DateFormat('d MMM yyyy').format(today),
                    style: TextStyle(
                      fontSize: 16.0,
                      fontWeight: FontWeight.bold,
                      color: Color(0xff214353),
                    ),
                  ),
                  SizedBox(width: 8.0),
                  Expanded(
                    child: Divider(
                      color: Color(0xff214353),
                      thickness: 1.5,
                    ),
                  ),
                ],
              ),
                  ),
                  if (showCard)
              _buildMedicationInfo()
                  else
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 20.0),
                child: SvgPicture.asset(
                  'icons/No_medication.svg', // Path to your SVG file
                  height: 200, // Set appropriate size
                ),
              ),
                ],
              )
              
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }

  // Widget _buildCalendarHeader() {
  //   return Text(
  //     '${_selectedDate.month}/${_selectedDate.day}/${_selectedDate.year}',
  //     style: TextStyle(
  //       fontSize: 24.0,
  //       fontWeight: FontWeight.bold,
  //     ),
  //   );
  // }

  // Widget _buildCalendarGrid() {
  //   return GridView.builder(
  //     gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
  //       crossAxisCount: 7,
  //       childAspectRatio: 1.0,
  //     ),
  //     itemCount: 31,
  //     itemBuilder: (context, index) {
  //       final day = index + 1;
  //       final isSelected = _selectedDate.day == day;
  //       return GestureDetector(
  //         onTap: () {
  //           setState(() {
  //             _selectedDate = DateTime(_selectedDate.year, _selectedDate.month, day);
  //           });
  //         },
  //         child: Container(
  //           decoration: BoxDecoration(
  //             color: isSelected ? Colors.blue : Colors.transparent,
  //             border: Border.all(color: Colors.grey),
  //           ),
  //           child: Center(
  //             child: Text(
  //               '$day',
  //               style: TextStyle(
  //                 color: isSelected ? Colors.white : Colors.black,
  //               ),
  //             ),
  //           ),
  //         ),
  //       );
  //     },
  //   );
  // }

  Widget _buildMedicationInfo() {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 30.0),
      child: Container(
        width: double.infinity,
        decoration: BoxDecoration(
          color: Colors.white, // Background color of the container
          borderRadius: BorderRadius.circular(15), // Rounded corners
          border: Border.all(
            color: Colors.white, // Border color
            width: 2, // Border width
          ),
          boxShadow: [
            BoxShadow(
              color: Colors.black.withOpacity(0.2), // Shadow color
              spreadRadius: 2, // How much the shadow spreads
              blurRadius: 8, // Softness of the shadow
              offset: const Offset(4, 4), // Shadow position
            ),
          ],
        ),
        child: Card(
          color: Colors.white,
          child: Padding(
            padding: const EdgeInsets.all(15.0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                const Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Row(
                      children: [
                        Icon(
                          Icons.calendar_month_outlined,
                          size: 30, // Icon for the medication name
                          color: Color(0xff214353),
                        ),
                        SizedBox(width: 8.0), // Space between icon and text
                        Text(
                          'For Me: Paracetamol',
                          style: boldStandardText,
                        ),
                      ],
                    ),
                    SizedBox(height: 8.0),
                    Row(
                      children: [
                        Icon(
                          Icons.access_time_outlined, // Icon for the time
                          color: Color(0xff214353),
                        ),
                        SizedBox(width: 8.0), // Space between icon and text
                        Text(
                          '13:30',
                          style: titleText,
                        ),
                      ],
                    ),
                  ],
                ),
                // Checkbox with custom size and color
                Transform.scale(
                  scale: 1.5, // Adjust the scale to make the checkbox bigger
                  child: Checkbox(
                    value: isChecked,
                    onChanged: (bool? value) {
                      setState(() {
                        isChecked = value!;
                      });
                    },
                    activeColor: Colors.orange, // Color when checked
                    checkColor: Colors.white, // Color of the checkmark
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
