import 'package:chat_app/views/signup.dart';
import 'package:flutter/material.dart';
import 'package:chat_app/views/signin.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Chat App using Firebase',
      theme: ThemeData(
        primaryColor: Color(0xFF145C9E),
        scaffoldBackgroundColor: Color(0xFF1F1F1F),
        primarySwatch: Colors.blue,
      ),
      home: SignUp(),
      //home: SignIn(),
    );
  }
}
