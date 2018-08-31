import 'package:flutter/material.dart';

void main() {
  runApp(new MaterialApp(
      home: MyStatelessWidget()
  ));
}

class MyStatelessWidget extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return new Scaffold(
      appBar: new AppBar(title: new Text("My AppBar")),
      body: new Container(
          padding: EdgeInsets.all(8.0),
          child: new Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: <Widget>[
              new MyCardView(
                  text: new Text("hello", style: new TextStyle(
                      fontSize: 25.0, fontStyle: FontStyle.italic)),
                  icon: new Icon(
                      Icons.face, size: 40.0, color: Colors.limeAccent)
              ),
              new MyCardView(
                  text: new Text("Bye", style: new TextStyle(
                      fontSize: 25.0, fontStyle: FontStyle.italic)),
                  icon: new Icon(Icons.accessibility_new, size: 40.0,
                      color: Colors.lightGreen)
              )
            ],
          )
      ),
    );
  }
}

class MyCardView extends StatelessWidget {
  MyCardView({this.text, this.icon});

  final Widget text;
  final Widget icon;

  @override
  Widget build(BuildContext context) {
    return new Container(
        child: new Card(
          child: new Column(
            children: <Widget>[
              text,
              icon
            ],
          ),
        )
    );
  }
}