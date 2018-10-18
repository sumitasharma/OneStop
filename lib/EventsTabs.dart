import 'package:flutter/material.dart';
import 'package:flutter_news_app/EventsPage.dart';

class EventsTabs extends StatefulWidget {

  final Map<String, double> location;

  const EventsTabs({Key key, this.location}) : super(key: key);

  @override
  EventsPageState createState() => new EventsPageState();
}

class EventsPageState extends State<EventsTabs> {

  String _tokenKey = "";
  String _urlStringEvents = "https://www.eventbriteapi.com/v3/events/search/?";

  @override
  void initState() {
    super.initState();
    print("location is :" + widget.location.toString());
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
                widget.location.toString() == null ? new Text(
                    "No Acces to Location yet")
                    : new HomePage(
                  url: _urlStringEvents + "q=free+events&location.latitude=" +
                      widget.location["latitude"].toString() +
                      "&location.longitude=" +
                      widget.location["longitude"].toString() + "&token=" +
                      _tokenKey,),
                new HomePage(
                    url: _urlStringEvents + "q=music&location.latitude=" +
                        widget.location["latitude"].toString() +
                        "&location.longitude=" +
                        widget.location["longitude"].toString() + "&token=" +
                        _tokenKey),
                new HomePage(
                    url: _urlStringEvents +
                        "q=family+education&location.latitude=" +
                        widget.location["latitude"].toString() +
                        "&location.longitude=" +
                        widget.location["longitude"].toString() + "&token=" +
                        _tokenKey),
                new HomePage(
                    url: _urlStringEvents +
                        "q=business&location.latitude=" +
                        widget.location["latitude"].toString() +
                        "&location.longitude=" +
                        widget.location["longitude"].toString() + "&token=" +
                        _tokenKey),
                new HomePage(
                    url: _urlStringEvents +
                        "q=science+technology&location.latitude=" +
                        widget.location["latitude"].toString() +
                        "&location.longitude=" +
                        widget.location["longitude"].toString() + "&token=" +
                        _tokenKey),
                new HomePage(
                    url: _urlStringEvents +
                        "q=sports&location.latitude=" +
                        widget.location["latitude"].toString() +
                        "&location.longitude=" +
                        widget.location["longitude"].toString() + "&token=" +
                        _tokenKey),
                new HomePage(
                    url: _urlStringEvents +
                        "q=health&location.latitude=" +
                        widget.location["latitude"].toString() +
                        "&location.longitude=" +
                        widget.location["longitude"].toString() + "&token=" +
                        _tokenKey),
                new HomePage(
                    url: _urlStringEvents +
                        "q=travel&location.latitude=" +
                        widget.location["latitude"].toString() +
                        "&location.longitude=" +
                        widget.location["longitude"].toString() + "&token=" +
                        _tokenKey),
                new HomePage(
                    url: _urlStringEvents +
                        "q=film+media+entertainment&location.latitude=" +
                        widget.location["latitude"].toString() +
                        "&location.longitude=" +
                        widget.location["longitude"].toString() + "&token=" +
                        _tokenKey),
                new HomePage(
                    url: _urlStringEvents +
                        "q=charity+causes&location.latitude=" +
                        widget.location["latitude"].toString() +
                        "&location.longitude=" +
                        widget.location["longitude"].toString() + "&token=" +
                        _tokenKey),
                new HomePage(
                    url: _urlStringEvents +
                        "q=school+activities&location.latitude=" +
                        widget.location["latitude"].toString() +
                        "&location.longitude=" +
                        widget.location["longitude"].toString() + "&token=" +
                        _tokenKey)
              ],
            ),

          ),
        )

    );
  }
}





