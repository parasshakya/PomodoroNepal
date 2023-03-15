import 'package:flutter/material.dart';

class MyLoginTextField extends StatelessWidget {

final controller;
final String hintText;
final bool obscureText;

MyLoginTextField({super.key,required this.controller, required this.hintText, required this.obscureText});

  @override
  Widget build(BuildContext context) {
    return  Padding(
      padding: const EdgeInsets.symmetric(horizontal:25),
      child: TextFormField(
        controller: controller,
        obscureText: obscureText,
        decoration: InputDecoration(
            hintText: hintText,
            hintStyle: TextStyle(color: Colors.grey[500]),
            enabledBorder: OutlineInputBorder(
              borderSide: BorderSide(color: Colors.white),
            ),
            focusedBorder: OutlineInputBorder(
              borderSide: BorderSide(color: Colors.grey.shade400),

            ),
            fillColor: Colors.grey.shade200,
            filled: true
        ),
      ),
    );

  }


}
