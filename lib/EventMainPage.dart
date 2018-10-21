import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:location/location.dart';

import 'EventsTabs.dart';
import 'EventsTabsAddress.dart';

class EventsMainPage extends StatefulWidget {
  @override
  EventsMainPageState createState() => new EventsMainPageState();
}

class EventsMainPageState extends State<EventsMainPage> {

  Map<String, double> _startLocation;
  Map<String, double> _currentLocation;
  StreamSubscription<Map<String, double>> _locationSubscription;


  Location _location = new Location();
  bool _permission = false;
  String error;
  var addresses;

  bool currentWidget = true;

  Image image1;

  @override
  void initState() {
    super.initState();

    initPlatformState();

    _locationSubscription =
        _location.onLocationChanged().listen((Map<String, double> result) {
          setState(() {
            _currentLocation = result;
          });
        });
  }

  // Platform messages are asynchronous, so we initialize in an async method.
  initPlatformState() async {
    Map<String, double> location;
    // Platform messages may fail, so we use a try/catch PlatformException.

    try {
      _permission = await _location.hasPermission();
      location = await _location.getLocation();
      _startLocation = location;
      error = null;
    } on PlatformException catch (e) {
      if (e.code == 'PERMISSION_DENIED') {
        error = 'Permission denied';
      } else if (e.code == 'PERMISSION_DENIED_NEVER_ASK') {
        error =
        'Permission denied - please ask the user to enable it from the app settings';
      }
//
//      location = null;
    }


    // If the widget was removed from the tree while the asynchronous platform
    // message was in flight, we want to discard the reply rather than calling
    // setState to update our non-existent appearance.
    //if (!mounted) return;

    setState(() {
      _startLocation = location;

      print("_startlocation : " + _startLocation.toString());
    });
//    final coordinates = new Coordinates(_startLocation["latitude"],_startLocation["longitude"]);
//    addresses = await Geocoder.local.findAddressesFromCoordinates(coordinates);

  }


  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
          appBar: AppBar(

            title: Text("Events"),
          ),
          body: new Container(
              child: new Center(
                  child: new Column(
                    children: <Widget>[
                      new InkWell(
                          onTap: () =>
                              Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                      builder: (context) =>
                                      new EventsTabs(
                                          location: _startLocation))
                              ),
                          child: new Text("Check the events in this location",
                              style: new TextStyle(fontSize: 24.0,
                                  fontStyle: FontStyle.italic))),
                      new Text("OR"),
                      new TextFormField(
                          decoration: InputDecoration(
                              labelText: 'Enter address'
                          ),
                          onFieldSubmitted: (String str) {
                            setState(() {
                              Navigator.push(
                                  context,
                                  MaterialPageRoute(builder: (context) =>
                                  new EventsTabsAddress(add: str))
                              );
                            }
                            );
                          }
                      ),


                    ],)))

      ),
    );
  }
}





