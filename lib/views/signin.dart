import 'dart:ui';

import 'package:chat_app/widgets/widget.dart';
import 'package:flutter/material.dart';

class SignIn extends StatefulWidget {
  SignIn({Key key}) : super(key: key);

  @override
  _SignInState createState() => _SignInState();
}

class _SignInState extends State<SignIn> {
  @override
  Widget build(BuildContext context) {
    return Container(
      child: Scaffold(
        appBar: appBarMain(context),
        body: Container(
          alignment: Alignment.bottomCenter,
          child: Container(
            padding: EdgeInsets.symmetric(horizontal: 24.0),
            child: Column(
              mainAxisSize: MainAxisSize
                  .min, //Required to Reduce the column height else it will take complete height
              children: [
                TextField(
                  decoration: textFieldInputDecoration('email'),
                  style: simpleTextFieldStyle(),
                ),
                TextField(
                  decoration: textFieldInputDecoration('password'),
                  style: simpleTextFieldStyle(),
                ),
                SizedBox(
                  height: 8.0,
                ),
                Container(
                  padding: EdgeInsets.symmetric(
                    vertical: 8.0,
                    horizontal: 16.0,
                  ),
                  alignment: Alignment.centerRight,
                  child: Text(
                    'Forgot Password',
                    style: simpleTextFieldStyle(),
                  ),
                ),
                SizedBox(
                  height: 8.0,
                ),
                Container(
                  alignment: Alignment.center,
                  width: MediaQuery.of(context).size.width,
                  padding: EdgeInsets.symmetric(vertical: 20.0),
                  decoration: BoxDecoration(
                    gradient: LinearGradient(colors: [
                      const Color(0xFF007EF4),
                      const Color(0xFF2A75BC),
                    ]),
                    borderRadius: BorderRadius.circular(30.0),
                  ),
                  child: Text(
                    'Sign In',
                    style: mediumTextFieldStyle(),
                  ),
                ),
                SizedBox(
                  height: 16.0,
                ),
                Container(
                  alignment: Alignment.center,
                  width: MediaQuery.of(context).size.width,
                  padding: EdgeInsets.symmetric(vertical: 20.0),
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(30.0),
                  ),
                  child: Text(
                    'Sign In with Google',
                    style: TextStyle(
                      color: Colors.black,
                      fontSize: 17.0,
                    ),
                  ),
                ),
                SizedBox(
                  height: 16.0,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      "Don't have a account? ",
                      style: mediumTextFieldStyle(),
                    ),
                    Text(
                      'Register Now',
                      style: TextStyle(
                        fontSize: 17.0,
                        color: Colors.white,
                        decoration: TextDecoration.underline,
                      ),
                    ),
                  ],
                ),
                SizedBox(
                  height: 100.0,
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
