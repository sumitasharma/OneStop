import 'package:flutter/material.dart';

import 'EventsTabs.dart';
import 'NewsTabs.dart';

class FirstPage extends StatefulWidget {
  @override
  _SettingPageState createState() => new _SettingPageState();
}

class _SettingPageState extends State<FirstPage> {
  @override
  Widget build(BuildContext context) {
    return new Scaffold(
      body: new Center(
          child: new Column(
            children: <Widget>[
              new InkWell( // this is the one you are looking for..........
                onTap: () =>
                    Navigator.push(
                      context,
                      MaterialPageRoute(builder: (context) => NewsTabs()),
                    ),
                child: new Container(
                  //width: 50.0,
                  //height: 50.0,
                  padding: const EdgeInsets.all(20.0),
                  //I used some padding without fixed width and height
                  decoration: new BoxDecoration(
                      shape: BoxShape.circle,
                      color: Colors.green
                  ),
                  child: new Text("News"),
                ),

              ),
              new InkWell( // this is the one you are looking for..........
                onTap: () =>
                    Navigator.push(
                      context,
                      MaterialPageRoute(builder: (context) => EventsTabs()),
                    ),
                child: new Container(
                  //width: 50.0,
                  height: 50.0,
                  padding: const EdgeInsets.all(20.0),
                  //I used some padding without fixed width and height
                  decoration: new BoxDecoration(
                      shape: BoxShape.circle,
                      color: Colors.green
                  ),
                  child: new Text("Events"),
                ),

              ),
              new InkWell( // this is the one you are looking for..........
                onTap: () =>
                    Navigator.push(
                      context,
                      MaterialPageRoute(builder: (context) => NewsTabs()),
                    ),
                child: new Container(
                  //width: 50.0,
                  //height: 50.0,
                  padding: const EdgeInsets.all(20.0),
                  //I used some padding without fixed width and height
                  decoration: new BoxDecoration(
                      shape: BoxShape.circle,
                      color: Colors.green
                  ),
                  child: new Text("Podcast"),
                ),

              ),
            ],
          )


      ),
    );
  }
}