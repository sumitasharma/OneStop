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
    return new Card(
        margin: EdgeInsets.only(left: 8.0, right: 8.0, bottom: 16.0),
        shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(15.0)),
        elevation: 4.0,
        child: new Column(
            children: <Widget>[
              new InkWell(
                onTap: () =>
                    Navigator.push(
                      context,
                      MaterialPageRoute(builder: (context) => NewsTabs()),
                    ),
                  child: new Container(
                      height: 150.0,
                      decoration: new BoxDecoration(
                        image: new DecorationImage(
                            image: new AssetImage(
                                'assets/news.jpg'),
                            fit: BoxFit.fill),
                        borderRadius: new BorderRadius.all(
                            new Radius.circular(16.0)),
                        border: new Border.all(
                          color: Colors.pinkAccent,
                          width: 2.0,
                        ),
                      ))
              ),

              new InkWell( // this is the one you are looking for..........
                onTap: () =>
                    Navigator.push(
                      context,
                      MaterialPageRoute(builder: (context) => EventsTabs()),
                    ),

                  child: new Container(
                      height: 150.0,
                      decoration: new BoxDecoration(
                        image: new DecorationImage(
                            image: new AssetImage(
                                'assets/events.jpg'),
                            fit: BoxFit.fill),
                        borderRadius: new BorderRadius.all(
                            new Radius.circular(16.0)),
                        border: new Border.all(
                          color: Colors.pinkAccent,
                          width: 2.0,
                        ),
                      ))

              ),
              new InkWell(
                onTap: () =>
                    Navigator.push(
                      context,
                      MaterialPageRoute(builder: (context) => NewsTabs()),
                    ),
                  child: new Container(
                      height: 150.0,
                      decoration: new BoxDecoration(
                        image: new DecorationImage(
                            image: new AssetImage(
                                'assets/podcast.jpg'),
                            fit: BoxFit.scaleDown),
                        borderRadius: new BorderRadius.all(
                            new Radius.circular(16.0)),
                        border: new Border.all(
                          color: Colors.pinkAccent,
                          width: 2.0,
                        ),
                      ))

              ),
            ],
          )

    );
  }
}