

import 'package:flutter/material.dart';
import 'package:wise_dose/views/themes/style_simple/colors.dart';

class TransparentButton extends StatefulWidget {
  final VoidCallback onPressed;
  final double width;
  final double height;
  final String content;
  const TransparentButton({super.key,
    required this.onPressed,
    required this.content,
    this.height = 50.0,
    required this.width
  });

  @override
  State<TransparentButton> createState() => _TransparentButtonState();
}

class _TransparentButtonState extends State<TransparentButton> {
  @override
  Widget build(BuildContext context) {
    return  Container(
                      width: widget.width, 
                      height: widget.height,
                      decoration: BoxDecoration(
                        color: Colors.transparent,
                        border: Border.all(
                          color: darkBlue, // Border color
                          width: 1.0,         // Border width
                        ),
                        borderRadius: BorderRadius.circular(12), // Rounded corners (optional)
                      ),
                      child: ElevatedButton(
                        onPressed:  widget.onPressed,
                        style: ElevatedButton.styleFrom(
                          backgroundColor:
                              Colors.transparent, 
                          shadowColor:
                              Colors.transparent,
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(12.0), // Match border radius
                          ),
                        ),
                        child: Text(
                          widget.content,
                          style: const TextStyle(
                            color: darkBlue,
                            fontSize: 16
                          ),
                        ),
                      ),
                    );
  }
}