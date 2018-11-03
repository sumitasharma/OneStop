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

  final String days;

  const EventsTabs({Key key, this.days}) : super(key: key);

  @override
  EventsPageState createState() => new EventsPageState();
}

class EventsPageState extends State<EventsTabs> {

  Util newUtil = new Util();
  static String _tokenKey;
  String _urlStringEvents = "https://www.eventbriteapi.com/v3/events/search/?";
  Icon actionIcon = new Icon(Icons.search);
  Widget appBarTitle = new Text("Local Events", style: new TextStyle(
      fontWeight: FontWeight.bold,
      fontFamily: 'Raleway',
      fontSize: 22.0),);
  final TextEditingController _searchQuery = new TextEditingController();
  Position position;
  bool currentWidget = true;
  double latitude = 37.3861;
  double longitude = -122.0839;
  Image image1;
  int _currentIndex = 2;
  final GlobalKey<ScaffoldState> _scaffoldKey = new GlobalKey<ScaffoldState>();


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
        try {
          _scaffoldKey.currentState
              .showSnackBar(new SnackBar(
              content: new Text(
                  "Setting the events to Mountain View, CA"),
              backgroundColor: Colors.blueAccent));
        }
        catch (e) {
          return;
        }
        position = null;
      }
    }
  }

  @override
  void setState(fn) {
    super.setState(fn);
  }

  @override
  Widget build(BuildContext context) {
    timeDilation = 1.0;
    return MaterialApp(
        key: _scaffoldKey,
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
                            fontWeight: FontWeight.bold,
                            fontFamily: 'Raleway',
                            fontSize: 22.0,
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
                    }
                    );
                  },
                  ),
                ],

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
                  labelStyle: TextStyle(
                    fontSize: 20.0, fontFamily: 'RobotoMono',),
                ),
              ),
              body:
              TabBarView(
                children: [
                  widget.days != null ?
                  new HomePage(
                    url: _urlStringEvents + "q=free&location.latitude=" +
                        latitude.toString() +
                        "&location.longitude=" +
                        longitude.toString() + "&start_date.keyword=" +
                        widget.days + "&sort_by=date&token=" +
                        _tokenKey,)
                      : new HomePage(
                    url: _urlStringEvents + "q=free&location.latitude=" +
                        latitude.toString() +
                        "&location.longitude=" +
                        longitude.toString() + "&sort_by=date&token=" +
                        _tokenKey,),
                  widget.days != null ?
                  new HomePage(
                      url: _urlStringEvents + "q=music&location.latitude=" +
                          latitude.toString() +
                          "&location.longitude=" +
                          longitude.toString() + "&start_date.keyword=" +
                          widget.days + "&sort_by=date&token=" +
                          _tokenKey)
                      : new HomePage(
                      url: _urlStringEvents + "q=music&location.latitude=" +
                          latitude.toString() +
                          "&location.longitude=" +
                          longitude.toString() + "&sort_by=date&token=" +
                          _tokenKey),
                  widget.days != null ?
                  new HomePage(
                      url: _urlStringEvents +
                          "q=family+education&location.latitude=" +
                          latitude.toString() +
                          "&location.longitude=" +
                          longitude.toString() + "&start_date.keyword=" +
                          widget.days + "&sort_by=date&token=" +
                          _tokenKey)
                      : new HomePage(
                      url: _urlStringEvents +
                          "q=family+education&location.latitude=" +
                          latitude.toString() +
                          "&location.longitude=" +
                          longitude.toString() + "&sort_by=date&token=" +
                          _tokenKey),
                  widget.days != null ?
                  new HomePage(
                      url: _urlStringEvents + "q=business&location.latitude=" +
                          latitude.toString() + "&location.longitude=" +
                          longitude.toString() + "&start_date.keyword=" +
                          widget.days + "&sort_by=date&token=" + _tokenKey)
                      : new HomePage(
                      url: _urlStringEvents + "q=business&location.latitude=" +
                          latitude.toString() + "&location.longitude=" +
                          longitude.toString() + "&sort_by=date&token=" +
                          _tokenKey),
                  widget.days != null ?
                  new HomePage(
                      url: _urlStringEvents +
                          "q=science+technology&location.latitude=" +
                          latitude.toString() +
                          "&location.longitude=" +
                          longitude.toString() + "&start_date.keyword=" +
                          widget.days + "&sort_by=date&token=" +
                          _tokenKey)
                      : new HomePage(
                      url: _urlStringEvents +
                          "q=science+technology&location.latitude=" +
                          latitude.toString() +
                          "&location.longitude=" +
                          longitude.toString() + "&sort_by=date&token=" +
                          _tokenKey),
                  widget.days != null ?
                  new HomePage(
                      url: _urlStringEvents +
                          "q=sports&location.latitude=" +
                          latitude.toString() +
                          "&location.longitude=" +
                          longitude.toString() + "&start_date.keyword=" +
                          widget.days + "&sort_by=date&token=" +
                          _tokenKey)
                      : new HomePage(
                      url: _urlStringEvents +
                          "q=sports&location.latitude=" +
                          latitude.toString() +
                          "&location.longitude=" +
                          longitude.toString() + "&sort_by=date&token=" +
                          _tokenKey),
                  widget.days != null ?
                  new HomePage(
                      url: _urlStringEvents +
                          "q=health&location.latitude=" +
                          latitude.toString() +
                          "&location.longitude=" +
                          longitude.toString() + "&start_date.keyword=" +
                          widget.days + "&sort_by=date&token=" +
                          _tokenKey)
                      : new HomePage(
                      url: _urlStringEvents +
                          "q=health&location.latitude=" +
                          latitude.toString() +
                          "&location.longitude=" +
                          longitude.toString() + "&sort_by=date&token=" +
                          _tokenKey),
                  widget.days != null ?
                  new HomePage(
                      url: _urlStringEvents +
                          "q=travel&location.latitude=" +
                          latitude.toString() +
                          "&location.longitude=" +
                          longitude.toString() + "&start_date.keyword=" +
                          widget.days + "&sort_by=date&token=" +
                          _tokenKey)
                      : new HomePage(
                      url: _urlStringEvents +
                          "q=travel&location.latitude=" +
                          latitude.toString() +
                          "&location.longitude=" +
                          longitude.toString() + "&sort_by=date&token=" +
                          _tokenKey),
                  widget.days != null ?
                  new HomePage(
                      url: _urlStringEvents +
                          "q=film+media+entertainment&location.latitude=" +
                          latitude.toString() +
                          "&location.longitude=" +
                          longitude.toString() + "&start_date.keyword=" +
                          widget.days + "&sort_by=date&token=" +
                          _tokenKey)
                      : new HomePage(
                      url: _urlStringEvents +
                          "q=film+media+entertainment&location.latitude=" +
                          latitude.toString() +
                          "&location.longitude=" +
                          longitude.toString() + "&sort_by=date&token=" +
                          _tokenKey),
                  widget.days != null ?
                  new HomePage(
                      url: _urlStringEvents +
                          "q=charity+causes&location.latitude=" +
                          latitude.toString() +
                          "&location.longitude=" +
                          longitude.toString() + "&start_date.keyword=" +
                          widget.days + "&sort_by=date&token=" +
                          _tokenKey)
                      : new HomePage(
                      url: _urlStringEvents +
                          "q=charity+causes&location.latitude=" +
                          latitude.toString() +
                          "&location.longitude=" +
                          longitude.toString() + "&sort_by=date&token=" +
                          _tokenKey),
                  widget.days != null ?

                  new HomePage(
                      url: _urlStringEvents +
                          "q=school+activities&location.latitude=" +
                          latitude.toString() +
                          "&location.longitude=" +
                          longitude.toString() + "&start_date.keyword=" +
                          widget.days + "&sort_by=date&token=" +
                          _tokenKey)
                      : new HomePage(
                      url: _urlStringEvents +
                          "q=school+activities&location.latitude=" +
                          latitude.toString() +
                          "&location.longitude=" +
                          longitude.toString() + "&sort_by=date&token=" +
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
              drawer: Drawer(
                elevation: 20.0,
                child: ListView(
                  padding: EdgeInsets.zero,
                  children: <Widget>[
                    Container(
                      color: Colors.black,
                      height: 200.0,
                      child: DrawerHeader(
                        child: new Container(
                          decoration: new BoxDecoration(
                            image: new DecorationImage(
                              image: new AssetImage(
                                  "assets/eventsFireworks.jpg"),
                              fit: BoxFit.fitWidth,
                            ),
                          ),
                          padding: EdgeInsets.all(50.0),
                          child: Text("Events",
                              style: TextStyle(
                                fontFamily: 'Raleway',
                                fontWeight: FontWeight.bold,
                                fontSize: 35.0,
                                color: Colors.white,),
                              textAlign: TextAlign.center
                          ),
                        ),
                      ),
                    ),

                    ListTile(

                      title: Text('Today', style: TextStyle(
                        fontFamily: 'Raleway',
                        fontWeight: FontWeight.bold,
                        fontSize: 20.0,)
                      ),
                      onTap: () {
                        Navigator.of(context, rootNavigator: true).push(
                            new CupertinoPageRoute<bool>(
                                fullscreenDialog: false,
                                builder: (BuildContext context) =>
                                new EventsTabs(days: "today",)));
                      },
                    ),
                    new Divider(height: 20.0,
                        color: Color.fromRGBO(205, 92, 92, 50.0)),

                    ListTile(

                      title: Text('Tomorrow', style: TextStyle(
                        fontFamily: 'Raleway',
                        fontWeight: FontWeight.bold,
                        fontSize: 20.0,)
                      ),
                      onTap: () {
                        Navigator.of(context, rootNavigator: true).push(
                            new CupertinoPageRoute<bool>(
                                fullscreenDialog: false,
                                builder: (BuildContext context) =>
                                new EventsTabs(days: "tomorrow")));
                      },
                    ),
                    new Divider(height: 20.0,
                        color: Color.fromRGBO(205, 92, 92, 50.0)),

                    ListTile(

                      title: Text('This Week', style: TextStyle(
                        fontFamily: 'Raleway',
                        fontWeight: FontWeight.bold,
                        fontSize: 20.0,)
                      ),
                      onTap: () {
                        Navigator.of(context, rootNavigator: true).push(
                            new CupertinoPageRoute<bool>(
                                fullscreenDialog: false,
                                builder: (BuildContext context) =>
                                new EventsTabs(days: "this_week")));
                      },
                    ),

                    new Divider(height: 20.0,
                        color: Color.fromRGBO(205, 92, 92, 50.0)),
                    ListTile(

                      title: Text('Next Week', style: TextStyle(
                        fontFamily: 'Raleway',
                        fontWeight: FontWeight.bold,
                        fontSize: 20.0,)
                      ),
                      onTap: () {
                        Navigator.of(context, rootNavigator: true).push(
                            new CupertinoPageRoute<bool>(
                                fullscreenDialog: false,
                                builder: (BuildContext context) =>
                                new EventsTabs(days: "next_week",)));
                      },
                    ),
                    new Divider(height: 20.0,
                        color: Color.fromRGBO(205, 92, 92, 50.0)),
                    ListTile(

                      title: Text('This Weekend', style: TextStyle(
                        fontFamily: 'Raleway',
                        fontWeight: FontWeight.bold,
                        fontSize: 20.0,)
                      ),
                      onTap: () {
                        Navigator.of(context, rootNavigator: true).push(
                            new CupertinoPageRoute<bool>(
                                fullscreenDialog: false,
                                builder: (BuildContext context) =>
                                new EventsTabs(days: "this_weekend")));
                      },
                    ),
                    new Divider(height: 20.0,
                        color: Color.fromRGBO(205, 92, 92, 50.0)),
                    ListTile(

                      title: Text('This Month', style: TextStyle(
                        fontFamily: 'Raleway',
                        fontWeight: FontWeight.bold,
                        fontSize: 20.0,)
                      ),
                      onTap: () {
                        Navigator.of(context, rootNavigator: true).push(
                            new CupertinoPageRoute<bool>(
                                fullscreenDialog: false,
                                builder: (BuildContext context) =>
                                new EventsTabs(days: "this_month",)));
                      },
                    ),
                    new Divider(height: 20.0,
                        color: Color.fromRGBO(205, 92, 92, 50.0)),
                    ListTile(

                      title: Text('Next Month', style: TextStyle(
                        fontFamily: 'Raleway',
                        fontWeight: FontWeight.bold,
                        fontSize: 20.0,)
                      ),
                      onTap: () {
                        Navigator.of(context, rootNavigator: true).push(
                            new CupertinoPageRoute<bool>(
                                fullscreenDialog: false,
                                builder: (BuildContext context) =>
                                new EventsTabs(days: "next_month",)));
                      },
                    ),
                  ],
                ),
              ),
            )
        )
    );
  }

}





