import 'package:flutter/material.dart';

class FormPrimary extends StatelessWidget {
  final TextEditingController controller;
  final String labelText;
  final String? Function(String?)? validator;
  final bool obscureText;
  final Widget? prefixIcon;
  final Widget? suffixIcon;

  const FormPrimary({
    Key? key,
    required this.controller,
    required this.labelText,
    this.validator,
    this.obscureText = false,
    this.prefixIcon,
    this.suffixIcon,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      controller: controller,
      decoration: InputDecoration(
        labelText: labelText,
        border: OutlineInputBorder(), // Adds a border around the input field
        focusedBorder: OutlineInputBorder(
          borderSide: BorderSide(color: Theme.of(context).primaryColor),
        ), // Border when focused
        enabledBorder: OutlineInputBorder(
          borderSide: BorderSide(color: Colors.grey),
        ), // Border when not focused
        // hintText: 'Masukan $labelText', // Example hint text
        prefixIcon: prefixIcon, // Example icon (you can customize)
        suffixIcon: suffixIcon,
        contentPadding: EdgeInsets.symmetric(horizontal: 16, vertical: 12),
      ),
      validator: validator,
      obscureText: obscureText,
    );
  }
}
