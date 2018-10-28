import 'dart:async';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_news_app/EventsTabs.dart';
import 'package:geolocator/geolocator.dart';


class EventLocation extends StatefulWidget {
  @override
  EventLocationState createState() => new EventLocationState();
}

class EventLocationState extends State<EventLocation> {

  Position position;
  bool currentWidget = true;
  Image image1;

  @override
  void initState() {
    super.initState();
    initPlatformState();
  }

  Future<Null> initPlatformState() async {

    try {
      GeolocationStatus geolocationStatus = await Geolocator()
          .checkGeolocationPermissionStatus();
      position = await Geolocator().getCurrentPosition(
          desiredAccuracy: LocationAccuracy.low);
    } on PlatformException catch (e) {
      if (e.code == 'PERMISSION_DENIED' ||
          e.code == 'PERMISSION_DENIED_NEVER_ASK') {
        position = null;
      }
    }
  }


  @override
  Widget build(BuildContext context) {
    return new MaterialApp(
      debugShowCheckedModeBanner: false,
      home: new Scaffold(
        appBar: new AppBar(
          backgroundColor: Color.fromRGBO(205, 92, 92, 50.0),
          leading: new IconButton(
              icon: new Icon(Icons.arrow_back),
              onPressed: () {
                Navigator.pop(context, true);
              }),
          title: new Text('Events In Your Area'),
        ),
        body:
        new InkWell(
          onTap: () {
            position != null ?
            Navigator.of(context, rootNavigator: true).push(
                new CupertinoPageRoute<bool>(
                    fullscreenDialog: false,
                    builder: (BuildContext context) =>
                    new EventsTabs(
                        latitude: position.latitude,
                        longitude: position.longitude)))
                :
            Navigator.of(context, rootNavigator: true).push(
                new CupertinoPageRoute<bool>(
                    fullscreenDialog: false,
                    builder: (BuildContext context) =>
                    new EventsTabs(
                        latitude: 37.3861,
                        longitude: -122.0839)));
          },
          child:
          new Container(
            decoration: new BoxDecoration(
              image: new DecorationImage(
                  image: new AssetImage("assets/events.jpg"),
                  fit: BoxFit.contain),
            ),
          ),
        )
        ),
    );
  }
}