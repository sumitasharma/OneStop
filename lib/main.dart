import 'package:flutter/material.dart';

class newsRectangle extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Center(
        child:
        Container(
          color: Colors.greenAccent,
          height: 400.0,
          width: 500.0,
          child: Center(
            child: Text(
              'Daily News',
              style: TextStyle(fontSize: 40.0),
            ),
          )
          ,)
    );
  }


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
