import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

class SignUpForm extends StatefulWidget {
  @override
  _SignUpFormState createState() => _SignUpFormState();
}

class _SignUpFormState extends State<SignUpForm> {
  final _formKey = GlobalKey<FormState>();

   String? _email;
  String? _password;
  String? _confirmPassword;

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: Form(
          key: _formKey,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              TextFormField(
                validator: (value) {
                  if (value!.isEmpty) {
                    return 'Please enter your email';
                  }
                  return null;
                },
                keyboardType: TextInputType.emailAddress,
                decoration: InputDecoration(
                  labelText: 'Email',
                ),
                onSaved: (value) {
                  _email = value;
                },
              ),
              TextFormField(
                validator: (value) {
                  if (value!.isEmpty) {
                    return 'Please enter your password';
                  }
                  return null;
                },
                obscureText: true,
                decoration: InputDecoration(
                  labelText: 'Password',
                ),
                onSaved: (value) {
                  _password = value;
                },
              ),
              TextFormField(
                validator: (value) {
                  if (value!.isEmpty) {
                    return 'Please confirm your password';
                  } else if (value != _password) {
                    return 'Passwords do not match';
                  }
                  return null;
                },
                obscureText: true,
                decoration: InputDecoration(
                  labelText: 'Confirm Password',
                ),
                onSaved: (value) {
                  _confirmPassword = value;
                },
              ),
              SizedBox(height: 20),
              Center(
                child: ElevatedButton(
                  onPressed: _submitForm,
                  child: Text('Sign Up'),
                ),
              ),
              Center(
                child: ElevatedButton(
                  onPressed: (){
                    Navigator.pop(context);
                  },
                  child: Text('Return To Login Page'),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  void _submitForm() {
    _formKey.currentState!.save();
    if (_formKey.currentState!.validate()) {
      FirebaseAuth.instance.createUserWithEmailAndPassword(email: _email!, password: _password!);
      ScaffoldMessenger.of(context).showSnackBar(
       const SnackBar(
          content: Text('Account created!'),
          duration: Duration(seconds: 3),
        ),
      );
    }
  }
}
