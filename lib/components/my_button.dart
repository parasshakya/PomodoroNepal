import 'package:flutter/material.dart';

class MyButton extends StatelessWidget {

  final Function() onTap;
  final String btnText;
  MyButton({required this.onTap, required this.btnText});

  @override
  Widget build(BuildContext context) {
    return  GestureDetector(
      onTap: onTap,
      child: Container(
        padding: const EdgeInsets.symmetric(horizontal: 25.0, vertical: 25.0),
        margin: const  EdgeInsets.symmetric(horizontal: 25.0),
        decoration: BoxDecoration(
          color: Colors.black,
          borderRadius: BorderRadius.circular(8.0)
        ),
        child:  Center(
          child: Text(btnText, style: TextStyle(color: Colors.white, fontSize: 16.0, fontWeight: FontWeight.bold),),
        ),
      ),
    );
  }
}
