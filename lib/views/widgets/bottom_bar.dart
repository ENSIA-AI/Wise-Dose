// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables

import 'package:flutter/material.dart';

Widget getBottomBarWidget(context
  /*{
  required int currentIndex,
  required Function(int) onTap,
  required List<BottomNavigationBarItem> items,
}*/
) {
  return Container(
    decoration: BoxDecoration(
      color: Colors.white, // Background color of the bottom nav bar
      borderRadius: BorderRadius.only(
        topLeft: Radius.circular(32), // Customize radius
        topRight: Radius.circular(32),
        bottomLeft: Radius.circular(32),
        bottomRight: Radius.circular(32)
      ),
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
        bottomLeft: Radius.circular(32),
        bottomRight: Radius.circular(32)
      ),
      child: BottomNavigationBar(
        items:[
          BottomNavigationBarItem(
            icon: Icon(
              Icons.qr_code_scanner,
              color: Color(0xFF214353),
              size: 32,
            ),
            label: ""
          ),
          BottomNavigationBarItem(
            icon: Icon(
              Icons.list_alt_sharp,
              size: 32,
              color: Color(0xFF214353),
            ),
            label: ""
          ),
          BottomNavigationBarItem(
            icon: Icon(
              Icons.home_filled,
              size: 32,
              color: Color(0xFF214353),
            ),
            label: ""
          ),
          BottomNavigationBarItem(
            icon: Icon(
              Icons.people_alt_outlined,
              size: 32,
              color: Color(0xFF214353),
            ),
            label: ""
          ),
          BottomNavigationBarItem(
            icon: Icon(
              Icons.settings,
              size: 32,
              color: Color(0xFF214353),
            ),
            label: ""
          )
        ],
        backgroundColor: Colors.white,
        elevation: 0, // Disable default elevation as we added custom shadow
        showSelectedLabels: false,
        showUnselectedLabels: false,
        type: BottomNavigationBarType.fixed, // Keeps icons fixed in size
      ),
    ),
  );
}
