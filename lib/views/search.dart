import 'package:chat_app/widgets/widget.dart';
import 'package:flutter/material.dart';

class SearchScreen extends StatefulWidget {
  //const SearchScreen({ Key? key }) : super(key: key);

  @override
  _SearchScreenState createState() => _SearchScreenState();
}

class _SearchScreenState extends State<SearchScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: appBarMain(context),
      body: Container(
        padding: EdgeInsets.symmetric(
          horizontal: 24.0,
          vertical: 16.0,
        ),
        child: Column(
          children: [
            Row(
              children: [
                Expanded(child: TextField()),
                Image.asset('assets/images/search_white.png'),
              ],
            )
          ],
        ),
      ),
    );
  }
}
