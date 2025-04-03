import 'package:flutter/material.dart';

class CustomTextField extends StatelessWidget {
  final TextEditingController controller;
  final String label;
  final FocusNode focusNode;
  final TextInputType? keyboardType;
  final bool obscureText;
  final Function(String)? onChanged;
  final Function(String)? onSubmitted;
  final Widget? suffixIcon;

  CustomTextField({
    required this.controller,
    required this.label,
    required this.focusNode,
    this.keyboardType,
    this.obscureText = false,
    this.onChanged,
    this.onSubmitted,
    this.suffixIcon,
  });

  @override
  Widget build(BuildContext context) {
    return TextField(
      controller: controller,
      focusNode: focusNode,
      keyboardType: keyboardType,
      obscureText: obscureText,
      decoration: InputDecoration(
        labelText: label,
        labelStyle: TextStyle(color: Color(0xff858585)),
        border: OutlineInputBorder(borderRadius: BorderRadius.circular(10),borderSide: BorderSide(color:Color(0xff858585) )),
        focusedBorder:OutlineInputBorder(
          borderRadius: BorderRadius.circular(10),
         borderSide: BorderSide(color: Color(0xff2A629A), width: 1.5) ,)
,        suffixIcon: suffixIcon,
      ),
      onChanged: onChanged,
      onSubmitted: onSubmitted,
    );
  }
}