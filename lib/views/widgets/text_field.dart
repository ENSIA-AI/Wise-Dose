import 'package:flutter/material.dart';
import 'package:wise_dose/views/themes/style_simple/colors.dart';

class CustomTextFormField extends StatelessWidget {
  final String label;
  final String hint;
  final String? Function(String?)? validate;
  final void Function(String?) save;
  final double paddingTop;
  final double paddingBottom;
  final double paddingLeft;
  final double paddingRight;
  final bool obscure;

  const CustomTextFormField({
    super.key,
    required this.label,
    required this.hint,
    required this.validate,
    required this.save,
    this.paddingTop = 8.0,
    this.paddingBottom = 8.0,
    this.paddingLeft = 12.0,
    this.paddingRight = 12.0,
    this.obscure = false,
  });

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      obscureText: obscure,
      cursorColor: lightBlue,
      decoration: InputDecoration(
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(12),
        ),
        focusedBorder: OutlineInputBorder(
          borderRadius:
              BorderRadius.circular(12.0), // Border radius when focused
          borderSide: const BorderSide(color: lightBlue, width: 2.0),
        ),
        contentPadding: EdgeInsets.only(
          top: paddingTop,
          right: paddingRight,
          bottom: paddingBottom,
          left: paddingLeft,
        ),
        hintText: hint,
        hintStyle: const TextStyle(color: Colors.grey, fontSize: 14),
        labelText: label,
        labelStyle: const TextStyle(color: Colors.grey, fontSize: 12),
        errorStyle: const TextStyle(
          fontSize: 8,
        ),
      ),
      validator: validate,
      onSaved: (value) => save(value),
    );
  }
}
