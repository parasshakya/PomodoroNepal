import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

class MySignUpTextField extends StatelessWidget {

  final controller;
  final String hintText;
  final bool obscureText;

  final validator;


  MySignUpTextField({super.key, required this.validator, required this.controller, required this.hintText, required this.obscureText});

  @override
  Widget build(BuildContext context) {
    return  Padding(
      padding: const EdgeInsets.symmetric(horizontal:25),
      child:  TextFormField(
        controller: controller,
        obscureText: obscureText,
        validator: validator,
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
      )
    );


  }



}
