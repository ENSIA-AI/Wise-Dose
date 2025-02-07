// ignore_for_file: avoid_print

import 'package:flutter/services.dart';

class DateInputFormatter extends TextInputFormatter {
  @override
  TextEditingValue formatEditUpdate(
      TextEditingValue oldValue, TextEditingValue newValue) {
    final oldText = oldValue.text;
    final newText = newValue.text;
    var numOfchars = 0;
    print('old value: $oldText');
    print('new value: $newText');
   
   // Remove all existing hyphens to work with raw digits
    final rawDigits = newText.replaceAll('-', '');

    // Prevent overflow of characters beyond 10
    if (rawDigits.length > 8) {
      return oldValue;
    }

    

    // Format the date with hyphens after the year and month
    final buffer = StringBuffer();
    for (int i = 0; i < rawDigits.length; i++) {
      buffer.write(rawDigits[i]);
      if (i == 3 || i == 5) {
        buffer.write('-'); // Add hyphen after the year (4th char) and month (7th char)
        numOfchars++;
      }
    }
     if (newText.length + numOfchars -1 < oldText.length) {
      
      var newPosition = oldText.length - 1;
      // Check if we're deleting a hyphen
      if (oldText.length > newText.length &&
          oldText[newText.length] == '-') {
        
        numOfchars--;
        if (newPosition < 0) return newValue;
        
        return TextEditingValue(
          text: oldText.substring(0, newPosition),
          selection: TextSelection.collapsed(offset: newPosition),
        );
      }
      print(newValue.text);
     return TextEditingValue(
          text: oldText.substring(0, newPosition),
          selection: TextSelection.collapsed(offset: newPosition),
        ); // Return the new value directly on other deletions
    }

    final formattedText = buffer.toString();
    print(formattedText.length);

    return TextEditingValue(
      text: formattedText,
      selection: TextSelection.collapsed(offset: buffer.length),
    );
  }
}

// import 'package:flutter/services.dart';

// class DateInputFormatter extends TextInputFormatter {
//   @override
//   TextEditingValue formatEditUpdate(
//       TextEditingValue oldValue, TextEditingValue newValue) {
//     final text = newValue.text;

//     StringBuffer newText = StringBuffer();
//     for (int i = 0; i < text.length; i++) {
//       newText.write(text[i]);
//       if (i == 3 || i == 5) {
//         newText.write('-'); // Insert '-' after yyyy and mm
//       }
//     }

//     // Prevent overflow of characters.
//     if (newText.toString().length > 10) {
//       return oldValue;
//     }

//     return TextEditingValue(
//       text: newText.toString(),
//       selection: TextSelection.collapsed(offset: newText.length),
//     );
//   }
// }


