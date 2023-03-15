import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:pomodoronepal/components/my_button.dart';
import 'package:pomodoronepal/components/my_textField_Login.dart';
import 'package:pomodoronepal/components/square_tile.dart';
import 'package:pomodoronepal/screens/sign_up.dart';
import 'package:pomodoronepal/screens/sign_up_page.dart';

class LoginPage extends StatelessWidget {
   LoginPage({Key? key}) : super(key: key);

  final emailController = TextEditingController();
  final passwordController = TextEditingController();

  Future<void> signInWithGoogle() async{
     GoogleSignInAccount? googleUser = await GoogleSignIn().signIn();
     GoogleSignInAuthentication? googleAuth = await googleUser?.authentication;
     AuthCredential credential = GoogleAuthProvider.credential(
         idToken:googleAuth?.idToken,
         accessToken: googleAuth?.accessToken
     );
     FirebaseAuth.instance.signInWithCredential(credential);
   }


   Future signIn() async{
    try{
      await FirebaseAuth.instance.signInWithEmailAndPassword(email: emailController.text.trim(), password: passwordController.text.trim());
    } on FirebaseAuthException catch(e){
      return Center(child: Text('Error Signing in: $e'),);
    }
   }


   @override
  Widget build(BuildContext context) {
    return  Scaffold(
      resizeToAvoidBottomInset: false,
      backgroundColor: Colors.grey[300],
      body:  SafeArea(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children:  [
          SizedBox(height: 100,),

          //logo
          Icon(
            Icons.lock,
            size: 100,
          ),
        SizedBox(height: 50,),
          //welcome back,
          Text('Welcome back, you\'ve been missed',
          style: TextStyle(
            color: Colors.grey[700],
            fontSize: 16
          ),),

          const SizedBox(height: 25,),

          //username textfield
          MyLoginTextField(

            obscureText: false,
            hintText: 'Enter email',
            controller: emailController,
          ),

          const SizedBox(height: 25,),


          //password textfield

          MyLoginTextField(
            obscureText: true,
            hintText: 'Enter password',
            controller: passwordController,
          ),

          SizedBox(height: 10,),
          //forgot password
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 25.0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                Text('Forgot Password?', style: TextStyle(color: Colors.grey[600]),),
              ],
            ),
          ),
          SizedBox(height: 25,),

          //sign in button
          MyButton(
            btnText: 'Sign In',
            onTap: ()  async  {
            showDialog(context: context, builder: (context) =>const Center(child: CircularProgressIndicator(),));
            await signIn();

          },),

          SizedBox(height: 30,),

          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 25),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Expanded(
                  child: Divider(
                    color: Colors.grey[400],
                    thickness: 0.5,
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 10.0),
                  child: Text('or continue with', style: TextStyle(color: Colors.grey[700]),),
                ),
                Expanded(
                  child: Divider(
                    color: Colors.grey[400],
                    thickness: 0.5 ,
                  ),
                )
              ],
            ),
          ),
          SizedBox(height: 20,),

          //or continue with

          //google sign in button
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              InkWell(
                onTap: () async{
                  await signInWithGoogle();
                },
                  child: SquareTile(imagePath: 'assets/images/google.png')),
            ],
          ),

          SizedBox(height: 10,),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text('Not a member?', style: TextStyle(color: Colors.grey[700]),),
              SizedBox(width: 4,),
              GestureDetector(
                onTap: (){
                  Navigator.push(context, MaterialPageRoute(builder: (context) => SignUpPage()) );
                },
                  child: Text('Register now', style: TextStyle(color: Colors.blue, fontWeight: FontWeight.bold, ),))
              
            ],
          )

        ],),
      ),
    );
  }
}
