import 'package:chat_app/helper/authenticate.dart';
import 'package:chat_app/services/auth.dart';
import 'package:chat_app/views/search.dart';
import 'package:flutter/material.dart';

class ChatRoom extends StatefulWidget {
  ChatRoom({Key key}) : super(key: key);

  @override
  _ChatRoomState createState() => _ChatRoomState();
}

class _ChatRoomState extends State<ChatRoom> {
  AuthMethod authMethod = AuthMethod();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Image.asset(
          'assets/images/logo.png',
          height: 50.0,
        ),
        actions: [
          GestureDetector(
            onTap: () {
              authMethod.signOut();
              Navigator.pushReplacement(
                context,
                MaterialPageRoute(builder: (context) => Authenticate()),
              );
            },
            child: Container(
              padding: EdgeInsets.symmetric(horizontal: 16.0),
              child: Icon(Icons.exit_to_app),
            ),
          ),
        ],
      ),
      floatingActionButton: FloatingActionButton(
        child: Icon(Icons.search),
        onPressed: () {
          Navigator.push(
              context, MaterialPageRoute(builder: (context) => SearchScreen()));
        },
      ),
    );
  }
}
