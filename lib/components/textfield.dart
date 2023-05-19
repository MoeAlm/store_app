import 'package:flutter/material.dart';

Widget defaultTextFormField(
    {required String label,
    required String hint,
    required TextInputType inputType,
    Function(String)? onChanged,
    IconButton? iconButton,
    int? maxLines,
    bool obscureText = false}) {
  return TextFormField(
    decoration: InputDecoration(
      labelText: label,
      hintText: hint,
      suffixIcon: iconButton,
      border: OutlineInputBorder(borderRadius: BorderRadius.circular(30)),
    ),
    // validator: (value) {
    //   if (value!.isEmpty) {
    //     return 'Field is required';
    //   }
    //   return null;
    // },
    maxLines: maxLines,
    onChanged: onChanged,
    keyboardType: inputType,
    obscureText: obscureText,
  );
}
