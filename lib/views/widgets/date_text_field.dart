

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:wise_dose/views/themes/style_simple/colors.dart';
import 'package:wise_dose/views/widgets/text_field.dart';

class CustomDateTextFormField extends StatelessWidget {
  const CustomDateTextFormField({super.key});

  @override
  Widget build(BuildContext context) {
    return TextFormField(
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
        contentPadding: const EdgeInsets.only(
            top: 8.0,
            right: 12.0,
            bottom: 8.0,
            left: 12.0),
        hintText: 'yyyy-mm-dd',
        hintStyle: const TextStyle(color: Colors.grey, fontSize: 14),
        labelText: 'yyyy-mm-dd',
        labelStyle: const TextStyle(color: Colors.grey, fontSize: 12),
        errorStyle: const TextStyle(
          fontSize: 8,
        ),
      ),
      keyboardType: TextInputType.number,
      inputFormatters: [
        FilteringTextInputFormatter.digitsOnly,
        DateInputFormatter(),
      ],
      validator: (value) {},
      onSaved: (value) => {},
    );
  }
}

class DateInputFormatter extends TextInputFormatter {
  @override
  TextEditingValue formatEditUpdate(
      TextEditingValue oldValue, TextEditingValue newValue) {
    final text = newValue.text;

    // Insert '/' after yyyy and after yyyy-mm if needed.
    StringBuffer newText = StringBuffer();
    for (int i = 0; i < text.length; i++) {
      newText.write(text[i]);
      if (i == 3 || i == 6) {
        newText.write('-');
      }
    }

    // Prevent overflow of characters.
    if (newText.toString().length > 10) {
      return oldValue;
    }

    return TextEditingValue(
      text: newText.toString(),
      selection: TextSelection.collapsed(offset: newText.length),
    );
  }
}