import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:pomodoronepal/components/my_button.dart';
import 'package:pomodoronepal/components/my_textField_SignUp.dart';
import 'package:pomodoronepal/components/my_textField_Login.dart';
import 'package:pomodoronepal/components/square_tile.dart';
import 'package:pomodoronepal/screens/loginPage.dart';
import 'package:pomodoronepal/screens/sign_up.dart';

class SignUpPage extends StatelessWidget {

  final emailController = TextEditingController();
  final passwordController = TextEditingController();
  final confirmPasswordController = TextEditingController();
  final _formKey = GlobalKey<FormState>();




  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      backgroundColor: Colors.grey[300],
      body: SafeArea(
        child: Form(
          key: _formKey,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              SizedBox(height: 100,),

              //logo
              Icon(
                Icons.draw,
                size: 100,
              ),
              SizedBox(height: 50,),
              //welcome back,
              Text('Let\'s sign up, shall we?',
                style: TextStyle(
                    color: Colors.grey[700],
                    fontSize: 16
                ),),

              const SizedBox(height: 25,),

              //username textfield
              MySignUpTextField(

                validator: (value){
                      if((value as String).isEmpty){
                        return 'Enter email';
                      }else{
                        return null;
                      }
                },
                obscureText: false,
                hintText: 'Enter email',
                controller: emailController,

              ),

              const SizedBox(height: 25,),


              //password textfield

              MySignUpTextField(
                validator: (value){
                  if((value as String).isEmpty){
                    return 'Enter password';
                  }else{
                    return null;
                  }

                },
                obscureText: true,
                hintText: 'Enter password',
                controller: passwordController,
              ),

              SizedBox(height: 25,),

              MySignUpTextField(
                validator: (value){
                  if((value as String).isEmpty ){
                    return 'Confirm Password';

                  }if((value as String).isNotEmpty && value != passwordController.text.trim() ){
                    return 'Password did not match';
                  }else{
                    return null;
                  }
                },

                obscureText: true,
                hintText: 'Confirm password',
                controller: confirmPasswordController,
              ),

              //forgot password
              SizedBox(height: 25,),

              //sign in button
              MyButton(
                btnText: 'Sign Up',
                onTap: () async {
                  _submitForm(context);
                },),

              SizedBox(height: 50,),

              SizedBox(height: 10,),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text('Already a member? ',
                    style: TextStyle(color: Colors.grey[700]),),
                  SizedBox(width: 4,),
                  GestureDetector(
                      onTap: () {
                        Navigator.pop(context);
                      },
                      child: Text('Go to Login', style: TextStyle(
                        color: Colors.blue, fontWeight: FontWeight.bold,),))

                ],
              )

            ],),
        ),
      ),
    );
  }

  void _submitForm(BuildContext context) {
    _formKey.currentState!.save();
    if (_formKey.currentState!.validate()) {
      FirebaseAuth.instance.createUserWithEmailAndPassword(email: emailController.text.trim(), password: passwordController.text.trim());
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(
          content: Text('Account created!'),
          duration: Duration(seconds: 3),
        ),
      );
    }
  }
}





