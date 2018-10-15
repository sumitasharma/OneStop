import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter_news_app/EventsPage.dart';
import 'package:location/location.dart';

class EventsTabs extends StatefulWidget {
  @override
  EventsPageState createState() => new EventsPageState();
}

class EventsPageState extends State<EventsTabs> {

  String _tokenKey = "";

  //String _location = " Mountain View, CA";
  String _locationAddress;
  String _urlStringEvents = "https://www.eventbriteapi.com/v3/events/search/?";

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
    } catch (e) {
      if (e.code == 'PERMISSION_DENIED') {
        error = 'Permission denied';
      } else if (e.code == 'PERMISSION_DENIED_NEVER_ASK') {
        error =
        'Permission denied - please ask the user to enable it from the app settings';
      }

      location = null;
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
        home: DefaultTabController(
          length: 11,
          child: Scaffold(
            appBar: AppBar(
              bottom: new TabBar(isScrollable: true,
                tabs: <Widget>[

                  new Tab(text: "Free Events"),
                  new Tab(text: "Music"),
                  new Tab(text: "Family&Education"),
                  new Tab(text: "Business&Professional"),
                  new Tab(text: "Science&Technology"),
                  new Tab(text: "Sports&Fitness"),
                  new Tab(text: "Health&Wellness",),
                  new Tab(text: "Travel&Outdoor",),
                  new Tab(text: "Film,Media&Entertainment",),
                  new Tab(text: "Charity&Causes",),
                  new Tab(text: "School Activities",)
                ],
              ),
              title: Text("Events near your area"),
            ),
            body: TabBarView(
              children: [
                new HomePage(
                  url: _urlStringEvents + "q=free+events&location.latitude=" +
                      _startLocation["latitude"].toString() +
                      "&location.longitude=" +
                      _startLocation["longitude"].toString() + "&token=" +
                      _tokenKey,),
                new HomePage(
                    url: _urlStringEvents + "q=music&location.latitude=" +
                        _startLocation["latitude"].toString() +
                        "&location.longitude=" +
                        _startLocation["longitude"].toString() + "&token=" +
                        _tokenKey),
                new HomePage(
                    url: _urlStringEvents +
                        "q=family+education&location.latitude=" +
                        _startLocation["latitude"].toString() +
                        "&location.longitude=" +
                        _startLocation["longitude"].toString() + "&token=" +
                        _tokenKey),
                new HomePage(
                    url: _urlStringEvents +
                        "q=business&location.latitude=" +
                        _startLocation["latitude"].toString() +
                        "&location.longitude=" +
                        _startLocation["longitude"].toString() + "&token=" +
                        _tokenKey),
                new HomePage(
                    url: _urlStringEvents +
                        "q=science+technology&location.latitude=" +
                        _startLocation["latitude"].toString() +
                        "&location.longitude=" +
                        _startLocation["longitude"].toString() + "&token=" +
                        _tokenKey),
                new HomePage(
                    url: _urlStringEvents +
                        "q=sports&location.latitude=" +
                        _startLocation["latitude"].toString() +
                        "&location.longitude=" +
                        _startLocation["longitude"].toString() + "&token=" +
                        _tokenKey),
                new HomePage(
                    url: _urlStringEvents +
                        "q=health&location.latitude=" +
                        _startLocation["latitude"].toString() +
                        "&location.longitude=" +
                        _startLocation["longitude"].toString() + "&token=" +
                        _tokenKey),
                new HomePage(
                    url: _urlStringEvents +
                        "q=travel&location.latitude=" +
                        _startLocation["latitude"].toString() +
                        "&location.longitude=" +
                        _startLocation["longitude"].toString() + "&token=" +
                        _tokenKey),
                new HomePage(
                    url: _urlStringEvents +
                        "q=film+media+entertainment&location.latitude=" +
                        _startLocation["latitude"].toString() +
                        "&location.longitude=" +
                        _startLocation["longitude"].toString() + "&token=" +
                        _tokenKey),
                new HomePage(
                    url: _urlStringEvents +
                        "q=charity+causes&location.latitude=" +
                        _startLocation["latitude"].toString() +
                        "&location.longitude=" +
                        _startLocation["longitude"].toString() + "&token=" +
                        _tokenKey),
                new HomePage(
                    url: _urlStringEvents +
                        "q=school+activities&location.latitude=" +
                        _startLocation["latitude"].toString() +
                        "&location.longitude=" +
                        _startLocation["longitude"].toString() + "&token=" +
                        _tokenKey)
              ],
            ),

          ),
        )

    );
  }
}
//
//String country(String country) {
//  String _countryCode;
//  switch (country) {
//    case 'India':
//      _countryCode = "in";
//      break;
//    case 'USA':
//      _countryCode = "us";
//      break;
//    case 'China':
//      _countryCode = "cn";
//      break;
//    case 'Australia':
//      _countryCode = "au";
//      break;
//    case 'Ireland':
//      _countryCode = "ie";
//      break;
//    case 'Netherland':
//      _countryCode = "nl";
//      break;
//    case 'New Zealand':
//      _countryCode = "it";
//      break;
//    case 'United Kingdom':
//      _countryCode = "gb";
//      break;
//    case 'Japan':
//      _countryCode = "jp";
//      break;
//    case 'Israel':
//      _countryCode = "il";
//      break;
//  }
//  return _countryCode;
//}
//
//class Choice {
//  const Choice({this.title});
//
//  final String title;
//}
//
//const List<Choice> choices = const <Choice>[
//  const Choice(title: 'India'),
//  const Choice(title: 'USA'),
//  const Choice(title: 'China'),
//  const Choice(title: 'Australia'),
//  const Choice(title: 'Ireland'),
//  const Choice(title: 'Netherland'),
//  const Choice(title: 'Italy'),
//  const Choice(title: 'United Kingdom'),
//  const Choice(title: 'Japan'),
//  const Choice(title: 'Israel')
//];




