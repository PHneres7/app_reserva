import 'package:flutter/material.dart';

class CustomTextFormField extends StatefulWidget {
  final String label;

  const CustomTextFormField({
    super.key,
    required this.label,
  });

  @override
  State<CustomTextFormField> createState() => _CustomTextFormFieldState();
}

class _CustomTextFormFieldState extends State<CustomTextFormField> {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 15),
      child: TextFormField(
        decoration: InputDecoration(
          border: OutlineInputBorder(),
          focusedBorder: OutlineInputBorder(),
          label: Text(widget.label),
          labelStyle: TextStyle(
            color: Colors.black,
          ),
          floatingLabelBehavior: FloatingLabelBehavior.always,
        ),
        cursorColor: Colors.black,
        cursorWidth: 1.0,
      ),
    );
  }
}
