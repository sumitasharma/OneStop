import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_news_app/EventsTabs.dart';
import 'package:geolocator/geolocator.dart';


class EventLocation extends StatefulWidget {
  @override
  EventLocationState createState() => new EventLocationState();
}

class EventLocationState extends State<EventLocation> {

  Map<String, double> _startLocation;

//  Map<String, double> _currentLocation;
//
//  StreamSubscription<Map<String, double>> _locationSubscription;
//
//  Location _location = new Location();
//  bool _permission = false;
//  String error;


  Position position;
  bool currentWidget = true;

  Image image1;

  @override
  void initState() {
    super.initState();

    initPlatformState();

//    _locationSubscription =
//        _location.onLocationChanged().listen((Map<String, double> result) {
//          setState(() {
//            _currentLocation = result;
//          });
//        });
  }

  // Platform messages are asynchronous, so we initialize in an async method.
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
            Navigator.push(
                context,
                MaterialPageRoute(
                    builder: (context) =>
                    new EventsTabs(
                        latitude: position.latitude,
                        longitude: position.longitude)))
                : Navigator.push(
                context,
                MaterialPageRoute(
                    builder: (context) =>
                    new EventsTabs(
                        latitude: 37.3861,
                        longitude: 122.0839)));
          },
          child:
          new Container(
            decoration: new BoxDecoration(
              image: new DecorationImage(
                  image: new AssetImage("assets/events.jpg"),
                  fit: BoxFit.scaleDown),
            ),
          ),
        ),
      ),
    );
  }
}