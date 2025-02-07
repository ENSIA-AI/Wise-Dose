// ignore_for_file: non_constant_identifier_names, prefer_const_constructors_in_immutables, use_key_in_widget_constructors, prefer_const_constructors

import 'package:flutter/material.dart';
import 'package:wise_dose/database/logout.dart';
import 'package:wise_dose/views/screens/login.dart';
import 'package:wise_dose/views/themes/style_simple/colors.dart';
import 'package:wise_dose/views/themes/style_simple/styles.dart';
import 'package:wise_dose/views/widgets/app_bar_settings.dart';

class AccountOptionRow extends StatelessWidget {
  final IconData icon;
  final String title;
  final VoidCallback onTap;
  final Color iconColor;
  final TextStyle text_Style;

  AccountOptionRow(
      {required this.icon,
      required this.title,
      required this.onTap,
      required this.iconColor,
      required this.text_Style});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 8.0),
      child: Row(
        children: [
          Icon(
            icon,
            size: 24,
            color: iconColor,
          ),
          SizedBox(width: 16),
          Text(
            title,
            style: text_Style,
          ),
        ],
      ),
    );
  }
}

class Settings extends StatefulWidget {
  const Settings({super.key});

  @override
  State<Settings> createState() => _SettingsState();
}

class _SettingsState extends State<Settings> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
        getAppBarSettings(),
        SizedBox(
          height: 20,
        ),
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20.0),
          child: Text(
            'Account',
            style: boldStandardText,
          ),
        ),
        Container(
          margin: EdgeInsets.all(16),
          padding: EdgeInsets.all(16),
          decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.circular(12),
            boxShadow: [
              BoxShadow(
                color: Colors.black.withOpacity(0.3),
                blurRadius: 10,
                offset: Offset(0, 5),
              ),
            ],
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              AccountOptionRow(
                icon: Icons.person,
                title: 'Edit profile',
                onTap: () {},
                iconColor: darkBlue,
                text_Style: standardText,
              ),
              AccountOptionRow(
                icon: Icons.shield_outlined,
                title: 'Security',
                onTap: () {},
                iconColor: darkBlue,
                text_Style: standardText,
              ),
              AccountOptionRow(
                icon: Icons.notifications_outlined,
                title: 'Notifications',
                onTap: () {},
                iconColor: darkBlue,
                text_Style: standardText,
              ),
              AccountOptionRow(
                icon: Icons.lock_outline,
                title: 'Privacy',
                onTap: () {},
                iconColor: darkBlue,
                text_Style: standardText,
              ),
            ],
          ),
        ),
        SizedBox(
          height: 20,
        ),
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20.0),
          child: Text(
            'Actions',
            style: boldStandardText,
          ),
        ),
        Container(
          margin: EdgeInsets.all(16),
          padding: EdgeInsets.all(16),
          decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.circular(12),
            boxShadow: [
              BoxShadow(
                color: Colors.black.withOpacity(0.3),
                blurRadius: 10,
                offset: Offset(0, 5),
              ),
            ],
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              AccountOptionRow(
                icon: Icons.person_add_alt,
                title: 'Add person',
                onTap: () {},
                iconColor: darkBlue,
                text_Style: standardText,
              ),
              GestureDetector(
                onTap: () {
                  Navigator.pushReplacement(context,
                      MaterialPageRoute(builder: (context) => Login()));
                },
                child: AccountOptionRow(
                  icon: Icons.logout,
                  title: 'Log out',
                  onTap: () async {
                    logoutUser();
                    Navigator.pushReplacement(context,
                        MaterialPageRoute(builder: (context) => Login()));
                  },
                  iconColor: orange,
                  text_Style: orangeStandardText,
                ),
              ),
            ],
          ),
        ),
      ]),
    );
  }
}
