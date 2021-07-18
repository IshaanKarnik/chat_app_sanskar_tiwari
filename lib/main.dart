import 'package:chat_app/helper/authenticate.dart';
import 'package:chat_app/widgets/widget.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';

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
      home: FutureBuilder(
          future: Firebase.initializeApp(),
          builder: (context, snapshot) {
            if (snapshot.hasError) {
              print(snapshot.error);
              return Scaffold(
                appBar: appBarMain(context),
                body: Center(
                  child: Text('Error Initializing Firebase'),
                ),
              );
            }
            if (snapshot.connectionState == ConnectionState.done) {
              return Authenticate();
              //return SignIn();
            }
            return Scaffold(
              appBar: appBarMain(context),
              body: Center(
                child: Column(
                  children: <Widget>[
                    Text('Initializing Firebase'),
                    SizedBox(
                      height: 25.0,
                    ),
                    CircularProgressIndicator(
                        //valueColor: AlwaysStoppedAnimation<Color>(Colors.white),
                        ),
                  ],
                ),
              ),
            );
          }),
    );
  }
}
