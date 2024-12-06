// ignore_for_file: non_constant_identifier_names

import 'package:flutter/material.dart';

class GradientButton extends StatelessWidget {
  final VoidCallback onPressed;
  final String text;
  final LinearGradient gradient;
  final double width;
  final double height;
  final double font_size;

  const GradientButton({
    Key? key,
    required this.onPressed,
    required this.text,
    required this.gradient,
    this.width = double.infinity,
    this.height = 50.0,
    this.font_size = 16.0
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      width: width,
      height: height,
      decoration: BoxDecoration(
        gradient: gradient,
        borderRadius: BorderRadius.circular(12.0),
      ),
      child: ElevatedButton(
        onPressed: onPressed,
        style: ElevatedButton.styleFrom(
          backgroundColor:
              Colors.transparent, // Make button background transparent
          shadowColor:
              Colors.transparent, // Remove shadow to keep gradient effect clean
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(12.0), // Match border radius
          ),
        ),
        child: Text(
          text,
          style: TextStyle(
            color: Colors.white,
            fontSize: font_size
          ),
        ),
      ),
    );
  }
}
