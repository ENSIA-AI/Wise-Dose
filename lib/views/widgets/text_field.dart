import 'package:flutter/material.dart';
import 'package:wise_dose/views/themes/style_simple/colors.dart';

class CustomTextFormField extends StatefulWidget {
  final String label;
  final String hint;
  final String? Function(String?)? validate;

  const CustomTextFormField({
    super.key,
    required this.label,
    required this.hint,
    required this.validate,
  });

  @override
  State<CustomTextFormField> createState() => _CustomTextFormFieldState();
}


class _CustomTextFormFieldState extends State<CustomTextFormField> {
  @override
  Widget build(BuildContext context) {
    return TextFormField(
      cursorColor: lightBlue,
      decoration: InputDecoration(
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(12),
        ),
        focusedBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(12.0), // Border radius when focused
          borderSide: const BorderSide(color: lightBlue, width: 2.0),
        ),
        contentPadding: const EdgeInsets.symmetric(vertical: 12, horizontal: 12.0),
        hintText: widget.hint,
        hintStyle: const TextStyle(color: Colors.grey, fontSize: 14),
        labelText: widget.label,
        labelStyle: const TextStyle(color: Colors.grey, fontSize: 12),
        errorStyle: const TextStyle(
          fontSize: 8,
        ),
      ),
      validator: widget.validate,
    );
  }
}
