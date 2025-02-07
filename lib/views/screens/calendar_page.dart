import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/svg.dart';
import 'package:table_calendar/table_calendar.dart';
import 'package:intl/intl.dart';
import 'package:wise_dose/blocs/calendar/calendar_event.dart';
import 'package:wise_dose/blocs/calendar/calendar_state.dart';
import 'package:wise_dose/views/screens/medication-info.dart';
import 'package:wise_dose/views/themes/style_simple/styles.dart';
import 'package:wise_dose/views/widgets/app_bar.dart';
import 'package:wise_dose/views/themes/style_simple/colors.dart';
import 'package:wise_dose/blocs/calendar/calendar_bloc.dart';

class MedicationCalendarPage extends StatelessWidget {
  const MedicationCalendarPage({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (_) => MedicationCalendarBloc(),
      child: Scaffold(
        backgroundColor: Colors.white,
        floatingActionButton: GestureDetector(
          onTap: () {
            Navigator.push(context,
                MaterialPageRoute(builder: (context) => MedicationInfo()));
          },
          child: Container(
            width: 50,
            height: 50,
            decoration: const BoxDecoration(
              shape: BoxShape.circle,
              gradient: buttonColor,
            ),
            child: const Icon(
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
                      child: BlocBuilder<MedicationCalendarBloc,
                          MedicationCalendarState>(
                        builder: (context, state) {
                          return Column(
                            crossAxisAlignment: CrossAxisAlignment.center,
                            children: [
                              const Padding(
                                padding: EdgeInsets.all(20.0),
                                child: Text(
                                  "Calendar",
                                  style: boldHeaderText,
                                ),
                              ),
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
                                      offset: const Offset(4, 4),
                                    ),
                                  ],
                                ),
                                child: TableCalendar(
                                  locale: "en_US",
                                  headerStyle: const HeaderStyle(
                                    formatButtonVisible: false,
                                    titleCentered: true,
                                  ),
                                  availableGestures: AvailableGestures.all,
                                  selectedDayPredicate: (day) => isSameDay(
                                      day, DateTime.parse(state.selectedDate)),
                                  focusedDay:
                                      DateTime.parse(state.selectedDate),
                                  firstDay: DateTime.utc(2010, 10, 16),
                                  lastDay: DateTime.utc(2030, 10, 16),
                                  onDaySelected: (selectedDay, _) {
                                    context.read<MedicationCalendarBloc>().add(
                                          SelectDay(
                                              selectedDate:
                                                  DateFormat('yyyy-MM-dd')
                                                      .format(selectedDay)
                                                      .toString()),
                                        );
                                  },
                                  calendarStyle: CalendarStyle(
                                    selectedDecoration: const BoxDecoration(
                                      color: Color(0xff214353),
                                      shape: BoxShape.circle,
                                    ),
                                    todayDecoration: BoxDecoration(
                                      color: const Color(0xff214353)
                                          .withOpacity(0.3),
                                      shape: BoxShape.circle,
                                    ),
                                    selectedTextStyle: const TextStyle(
                                      color: Colors.white,
                                      fontWeight: FontWeight.bold,
                                    ),
                                  ),
                                ),
                              ),
                              const SizedBox(height: 20),
                              Row(
                                children: [
                                  Text(
                                    DateFormat('d MMM yyyy').format(
                                        DateTime.parse(state.selectedDate)),
                                    style: const TextStyle(
                                      fontSize: 16.0,
                                      fontWeight: FontWeight.bold,
                                      color: Color(0xff214353),
                                    ),
                                  ),
                                  const SizedBox(width: 8.0),
                                  const Expanded(
                                    child: Divider(
                                      color: Color(0xff214353),
                                      thickness: 1.5,
                                    ),
                                  ),
                                ],
                              ),
                              FutureBuilder<List<Map<dynamic, dynamic>>>(
                                  future: state.dayListMedication,
                                  builder: (context, snapshot) {
                                    if (snapshot.connectionState ==
                                        ConnectionState.waiting) {
                                      return const Center(
                                          child: CircularProgressIndicator());
                                    } else if (snapshot.hasError) {
                                      return Center(
                                          child:
                                              Text('Error: ${snapshot.error}'));
                                    } else if (!snapshot.hasData ||
                                        snapshot.data!.isEmpty) {
                                      return Padding(
                                        padding: const EdgeInsets.symmetric(
                                            horizontal: 20.0),
                                        child: SvgPicture.asset(
                                          'icons/No_medication.svg', // Path to your SVG file
                                          height: 200, // Set appropriate size
                                        ),
                                      );
                                    } else {
                                      final medEvents = snapshot.data!;
                                      return ListView.builder(
                                        shrinkWrap:
                                            true, // Add shrinkWrap to avoid unbounded height error
                                        physics:
                                            const NeverScrollableScrollPhysics(), // Prevent ListView from independently scrolling
                                        itemCount: medEvents.length,
                                        itemBuilder: (context, index) {
                                          return ListTile(
                                            title: _buildMedicationInfo(
                                              context,
                                              medEvents[index]
                                                  ['medication_name'],
                                              DateFormat('HH:mm').format(DateTime(0, 0, 1, medEvents[index]['hours'], medEvents[index]['minutes']),)
                                            ),
                                          );
                                        },
                                      );
                                    }
                                  })
                            ],
                          );
                        },
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildMedicationInfo(BuildContext context, String name, String time) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 30.0),
      child: Container(
        width: double.infinity,
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(15),
          boxShadow: [
            BoxShadow(
              color: Colors.black.withOpacity(0.2),
              spreadRadius: 2,
              blurRadius: 8,
              offset: const Offset(4, 4),
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
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Row(
                      children: [
                        const Icon(
                          Icons.calendar_month_outlined,
                          size: 30,
                          color: Color(0xff214353),
                        ),
                        const SizedBox(width: 8.0),
                        Text(
                          name,
                          style: boldStandardText,
                        ),
                      ],
                    ),
                    const SizedBox(height: 8.0),
                    Row(
                      children: [
                        const Icon(
                          Icons.access_time_outlined,
                          color: Color(0xff214353),
                        ),
                        const SizedBox(width: 8.0),
                        Text(
                          time,
                          style: titleText,
                        ),
                      ],
                    ),
                  ],
                ),
                Transform.scale(
                  scale: 1.5,
                  child: Checkbox(
                    value: false,
                    onChanged: (bool? value) {
                      context
                          .read<MedicationCalendarBloc>()
                          .add(ToggleCheckbox(value ?? false));
                    },
                    activeColor: Colors.orange,
                    checkColor: Colors.white,
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


/*  */