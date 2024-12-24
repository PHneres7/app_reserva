import 'package:flutter/material.dart';


class CustomTextFormField extends StatefulWidget {
  final String label;
  final FloatingLabelBehavior? floatingLabelBehavior;
  final double? fontSize;
  final String? Function(String?)? validator;

  const CustomTextFormField({
    super.key,
    required this.label,
    this.floatingLabelBehavior,
    this.fontSize,
    this.validator,
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
          border: const OutlineInputBorder(),
          focusedBorder: const OutlineInputBorder(),
          label: Text(
            widget.label,
            style: TextStyle(fontSize: widget.fontSize ?? 14),
          ),
          labelStyle: const TextStyle(
            color: Colors.black,
          ),
          floatingLabelBehavior:
              widget.floatingLabelBehavior ?? FloatingLabelBehavior.always,
        ),
        
        cursorColor: Colors.black,
        cursorWidth: 1.0,
        validator: widget.validator, 
      ),
    );
  }
}
