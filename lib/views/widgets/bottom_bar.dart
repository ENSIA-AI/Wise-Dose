import 'package:flutter/material.dart';
import 'package:wise_dose/views/screens/calendar_page.dart';
import 'package:wise_dose/views/screens/history.dart';
import 'package:wise_dose/views/screens/scanner.dart';
import 'package:wise_dose/views/screens/settings.dart';
import 'package:wise_dose/views/themes/style_simple/colors.dart';
import 'package:wise_dose/views/widgets/under_development.dart';

class Bottom_Nav_Bar extends StatefulWidget {
  const Bottom_Nav_Bar({super.key});

  @override
  State<Bottom_Nav_Bar> createState() => _Bottom_Nav_BarState();
}

class _Bottom_Nav_BarState extends State<Bottom_Nav_Bar> {
  int _selectedIndex = 2;

  final List<Widget> _pages = [
    Scanner(),
    History(),
    MedicationCalendarPage(),
    UnderDevelopment(),
    Settings()
  ];

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: _pages[_selectedIndex],
      bottomNavigationBar: Container(
        decoration: BoxDecoration(
          color: Colors.white, // Background color of the bottom nav bar
          borderRadius: BorderRadius.only(
              topLeft: Radius.circular(32), // Customize radius
              topRight: Radius.circular(32),
              bottomLeft: Radius.circular(32),
              bottomRight: Radius.circular(32)),
          boxShadow: [
            BoxShadow(
              color: Colors.black.withOpacity(0.2), // Shadow color
              blurRadius: 10, // Softness of shadow
              spreadRadius: 2, // Spread of shadow
              offset: Offset(0, -2), // Position of shadow (above the nav bar)
            ),
          ],
        ),
        child: ClipRRect(
          borderRadius: BorderRadius.only(
            topLeft: Radius.circular(32),
            topRight: Radius.circular(32),
          ),
          child: BottomNavigationBar(
            currentIndex: _selectedIndex,
            type: BottomNavigationBarType.fixed,
            backgroundColor: Colors.white,
            showSelectedLabels: false,
            showUnselectedLabels: false,
            onTap: _onItemTapped,
            items: [
              BottomNavigationBarItem(
                  icon: Icon(
                    Icons.qr_code_scanner,
                    size: 32,
                  ),
                  label: ""),
              BottomNavigationBarItem(
                  icon: Icon(
                    Icons.list_alt_sharp,
                    size: 32,
                  ),
                  label: ""),
              BottomNavigationBarItem(
                  icon: Icon(
                    Icons.home_filled,
                    size: 32,
                  ),
                  label: ""),
              BottomNavigationBarItem(
                  icon: Icon(
                    Icons.people_alt_outlined,
                    size: 32,
                  ),
                  label: ""),
              BottomNavigationBarItem(
                  icon: Icon(
                    Icons.settings,
                    size: 32,
                  ),
                  label: "")
            ],
            selectedItemColor: orange,
            unselectedItemColor: darkBlue,
          ),
        ),
      ),
    );
  }
}

// ignore_for_file: camel_case_types, prefer_const_constructors, prefer_const_literals_to_create_immutables

