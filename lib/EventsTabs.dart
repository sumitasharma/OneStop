import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:flutter_news_app/EventsPage.dart';
import 'package:flutter_news_app/NewsTabs.dart';
import 'package:flutter_news_app/PodcastTabs.dart';
import 'package:flutter_news_app/page_view.dart';
import 'package:flutter_news_app/util.dart';
import 'package:geolocator/geolocator.dart';

import 'EventsTabsAddress.dart';

class EventsTabs extends StatefulWidget {
//
//  final double latitude;
//  final double longitude;
//
//  const EventsTabs({Key key, this.latitude, this.longitude}) : super(key: key);

  @override
  EventsPageState createState() => new EventsPageState();
}

class EventsPageState extends State<EventsTabs> {

  Util newUtil = new Util();
  static String _tokenKey;
  String _urlStringEvents = "https://www.eventbriteapi.com/v3/events/search/?";
  Icon actionIcon = new Icon(Icons.search);
  Widget appBarTitle = new Text("Local Events");
  final TextEditingController _searchQuery = new TextEditingController();
  Position position;
  bool currentWidget = true;
  double latitude = 37.3861;
  double longitude = -122.0839;
  Image image1;
  int _currentIndex = 2;


  @override
  void initState() {
    super.initState();
    _tokenKey = newUtil.tokenKey;
    initPlatformState();
  }

  Future<Null> initPlatformState() async {
    try {
      GeolocationStatus geolocationStatus = await Geolocator()
          .checkGeolocationPermissionStatus();
      position = await Geolocator().getCurrentPosition(
          desiredAccuracy: LocationAccuracy.low);
      latitude = position.latitude;
      longitude = position.longitude;
    } catch (e) {
      if (e.code == 'PERMISSION_DENIED' ||
          e.code == 'PERMISSION_DENIED_NEVER_ASK') {
        position = null;
      }
    }
  }

//  @override
//  void initState() {
//    super.initState();
//    _tokenKey = newUtil.tokenKey;
//  }


  @override
  void setState(fn) {
    super.setState(fn);
  }

  @override
  Widget build(BuildContext context) {
    timeDilation = 1.0;
    return MaterialApp(
        debugShowCheckedModeBanner: false,
        home: DefaultTabController(
          length: 11,
          child: Scaffold(
            appBar: AppBar(
              backgroundColor: Color.fromRGBO(205, 92, 92, 50.0),
              centerTitle: true,
              title: appBarTitle,
              actions: <Widget>[
                new IconButton(icon: actionIcon, onPressed: () {
                  setState(() {
                    if (this.actionIcon.icon == Icons.search) {
                      this.actionIcon = new Icon(Icons.close);
                      this.appBarTitle = new TextField(
                        controller: _searchQuery,
                        style: new TextStyle(
                          color: Colors.white,
                        ),
                        decoration: new InputDecoration(
                            prefixIcon: new Icon(
                                Icons.search, color: Colors.white),
                            hintText: "Search events in locaton...",
                            hintStyle: new TextStyle(color: Colors.white)
                        ),
                        onSubmitted: (String str) {
                          setState(() {
                            Navigator.of(context, rootNavigator: true).push(
                                new CupertinoPageRoute<bool>(
                                    fullscreenDialog: false,
                                    builder: (BuildContext context) =>
                                    new EventsTabsAddress(add: str))
                            );
                          }
                          );
                        },
                      );
                    }
                    else {
                      this.actionIcon = new Icon(Icons.search);
                      this.appBarTitle =
                      new Text("Events near " + _searchQuery.text);
                    }
                  });
                },),
              ],
              leading: new IconButton(
                  icon: new Icon(Icons.arrow_back),
                  onPressed: () {
                    Navigator.pop(context, true);
                  }),
              bottom: new TabBar(
                isScrollable: true,
                indicatorColor: Color.fromRGBO(205, 92, 92, 50.0),
                tabs: <Widget>[

                  new Tab(text: "Free Events"),
                  new Tab(text: "Music"),
                  new Tab(text: "Family & Education"),
                  new Tab(text: "Business & Professional"),
                  new Tab(text: "Science & Technology"),
                  new Tab(text: "Sports & Fitness"),
                  new Tab(text: "Health & Wellness",),
                  new Tab(text: "Travel & Outdoor",),
                  new Tab(text: "Film, Media & Entertainment",),
                  new Tab(text: "Charity & Causes",),
                  new Tab(text: "School Activities",)
                ],
              ),
            ),
            body: TabBarView(
              children: [
                new HomePage(
                  url: _urlStringEvents + "q=free&location.latitude=" +
                      latitude.toString() +
                      "&location.longitude=" +
                      longitude.toString() + "&token=" +
                      _tokenKey,),
                new HomePage(
                    url: _urlStringEvents + "q=music&location.latitude=" +
                        latitude.toString() +
                        "&location.longitude=" +
                        longitude.toString() + "&token=" +
                        _tokenKey),
                new HomePage(
                    url: _urlStringEvents +
                        "q=family+education&location.latitude=" +
                        latitude.toString() +
                        "&location.longitude=" +
                        longitude.toString() + "&token=" +
                        _tokenKey),
                new HomePage(
                    url: _urlStringEvents +
                        "q=business&location.latitude=" +
                        latitude.toString() +
                        "&location.longitude=" +
                        longitude.toString() + "&token=" +
                        _tokenKey),
                new HomePage(
                    url: _urlStringEvents +
                        "q=science+technology&location.latitude=" +
                        latitude.toString() +
                        "&location.longitude=" +
                        longitude.toString() + "&token=" +
                        _tokenKey),
                new HomePage(
                    url: _urlStringEvents +
                        "q=sports&location.latitude=" +
                        latitude.toString() +
                        "&location.longitude=" +
                        longitude.toString() + "&token=" +
                        _tokenKey),
                new HomePage(
                    url: _urlStringEvents +
                        "q=health&location.latitude=" +
                        latitude.toString() +
                        "&location.longitude=" +
                        longitude.toString() + "&token=" +
                        _tokenKey),
                new HomePage(
                    url: _urlStringEvents +
                        "q=travel&location.latitude=" +
                        latitude.toString() +
                        "&location.longitude=" +
                        longitude.toString() + "&token=" +
                        _tokenKey),
                new HomePage(
                    url: _urlStringEvents +
                        "q=film+media+entertainment&location.latitude=" +
                        latitude.toString() +
                        "&location.longitude=" +
                        longitude.toString() + "&token=" +
                        _tokenKey),
                new HomePage(
                    url: _urlStringEvents +
                        "q=charity+causes&location.latitude=" +
                        latitude.toString() +
                        "&location.longitude=" +
                        longitude.toString() + "&token=" +
                        _tokenKey),
                new HomePage(
                    url: _urlStringEvents +
                        "q=school+activities&location.latitude=" +
                        latitude.toString() +
                        "&location.longitude=" +
                        longitude.toString() + "&token=" +
                        _tokenKey)
              ],
            ),
            bottomNavigationBar: BottomNavigationBar(
              currentIndex: _currentIndex,
              onTap: (newIndex) =>
                  setState(() {
                    _currentIndex = newIndex;
                    switch (_currentIndex) {
                      case 0:
                        print("In the intropage");
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => IntroPageView()),
                        );
                        break;
                      case 1:
                        print("In the newstabs");
                        Navigator.of(context, rootNavigator: true).push(
                          new CupertinoPageRoute<bool>(
                              fullscreenDialog: false,
                              builder: (BuildContext context) =>
                              new NewsTabs(country: 'us',)),
                        );
                        break;
                      case 3:
                        print("In the podcasttabs");
                        Navigator.of(context, rootNavigator: true).push(
                          new CupertinoPageRoute<bool>(
                              fullscreenDialog: false,
                              builder: (
                                  BuildContext context) => new PodcastTabs()),
                        );
                        break;
                    }
                    print(_currentIndex);
                  }),
              items: [
                BottomNavigationBarItem(
                  icon: new Icon(Icons.home),
                  title: new Text('Home'),
                  backgroundColor: Color.fromRGBO(205, 92, 92, 50.0),
                ),
                BottomNavigationBarItem(
                  icon: new Icon(Icons.book),
                  title: new Text('News'),
                  backgroundColor: Color.fromRGBO(205, 92, 92, 50.0),
                ),
                BottomNavigationBarItem(
                  icon: new Icon(Icons.event),
                  title: new Text('Events'),
                  backgroundColor: Color.fromRGBO(205, 92, 92, 50.0),
                ),
                BottomNavigationBarItem(
                  icon: Icon(Icons.headset),
                  title: Text('Podcast'),
                  backgroundColor: Color.fromRGBO(205, 92, 92, 50.0),

                ),
              ],
            ),

          ),
        )

    );
  }

}





