import 'package:flutter/material.dart';

Widget newsRectangle() {
  return Container(
    color: Colors.greenAccent
    ,);
}

void main() {
  runApp(
    MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        appBar: AppBar(
          title: Text("News "),
        ),
        body: newsRectangle(),
      )
      ,)
    ,);
}
