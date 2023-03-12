import 'package:flutter/material.dart';

class CustomButton extends StatelessWidget {
final Function() onTap;
final String text;

const CustomButton({required this.onTap, required this.text});



  @override
  Widget build(BuildContext context) {
    return ButtonTheme(

        child: Container(
          width: 150,
            child: ElevatedButton(onPressed: onTap, child: Text(text, style: TextStyle(fontSize: 15),), )));
  }
}
