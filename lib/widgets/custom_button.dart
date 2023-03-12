import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class CustomButton extends StatelessWidget {
final Function() onTap;
final String text;

const CustomButton({required this.onTap, required this.text});



  @override
  Widget build(BuildContext context) {
    return ButtonTheme(
        minWidth: 200,
        child: Container(
          width: 150,
            child: ElevatedButton(onPressed: onTap, child: Text(text, style: GoogleFonts.raleway(
              fontSize: 13,
              fontWeight: FontWeight.bold,
              color: Colors.black,
            ), textAlign: TextAlign.center), )));
  }
}
