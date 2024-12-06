// ignore_for_file: use_key_in_widget_constructors, library_private_types_in_public_api

import 'package:flutter/material.dart';


class ToggleSwitch extends StatefulWidget {
  @override
  _ToggleSwitchState createState() => _ToggleSwitchState();
}

class _ToggleSwitchState extends State<ToggleSwitch> {
  bool _isSwitched = false; // Initial state of the switch

  @override
  Widget build(BuildContext context) {
    return Switch(
      value: _isSwitched, // Current state of the switch
      onChanged: (bool value) {
        setState(() {
          _isSwitched = value; // Update the state
        });
      },
      activeColor: Colors.orange, // Color when the switch is ON
      inactiveThumbColor: Colors.grey, // Thumb color when OFF
      inactiveTrackColor: Colors.white, // Track color when OFF
    );
  }
}
