import 'package:flutter/material.dart';

class newsRectangle extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Material(
        color: Colors.transparent,
        child: Container(
            child: Center(
                child: InkWell(
                    highlightColor: Color(50),
                    splashColor: Color(100),
                    onTap: () {
                      print("Tapped");
                    },
                    child: Container(
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
                )
            )
        )
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
          body: Padding(
            padding: const EdgeInsets.all(25.0),
            child:
            newsRectangle(),
      )
      )
      ,)
    ,);
}
