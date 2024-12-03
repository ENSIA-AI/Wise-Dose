import 'package:flutter/material.dart';
import 'package:wise_dose/views/themes/style_simple/colors.dart';

class CustomTextField extends StatefulWidget {
  final String hint;
  /* final TextEditingController controller;
  final String? Function(String) validateInput; */

  const CustomTextField({
    super.key,
    required this.hint,
    /* required this.controller,
    required this.validateInput, */
  });

  @override
  // ignore: library_private_types_in_public_api
  _CustomTextFieldState createState() => _CustomTextFieldState();
}

class _CustomTextFieldState extends State<CustomTextField> {
  final FocusNode _focusNode = FocusNode();
  String? _errorText;
  Color _borderColor = Colors.grey;

  @override
  void initState() {
    super.initState();
    _focusNode.addListener(() {
      setState(() {
        _borderColor = _focusNode.hasFocus ? lightBlue : Colors.grey;
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 60,
      child: TextField(
        //controller: widget.controller,
        focusNode: _focusNode, // FocusNode to track focus state
        decoration: InputDecoration(
          border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(12),
            borderSide: BorderSide(color: _borderColor),
          ),
          hintText: widget.hint,
          hintStyle: const TextStyle(color: Colors.grey),
          errorText: _errorText,
          contentPadding: const EdgeInsets.symmetric(
            vertical: 12.0, 
            horizontal: 12.0,
          ),
          floatingLabelBehavior: FloatingLabelBehavior.always, // Floating label
          labelText: widget.hint, // Hint will act as label
        ),
      ),
    );
  }
}
