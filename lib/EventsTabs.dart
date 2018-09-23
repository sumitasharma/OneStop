import 'package:flutter/material.dart';
import 'package:flutter_news_app/EventsPage.dart';


class EventsTabs extends StatefulWidget {
  @override
  EventsPageState createState() => new EventsPageState();
}

class EventsPageState extends State<EventsTabs> {

  String _tokenKey = "";
  String _locationAddress = "Mountain+View+CA";
  String _urlStringEvents = "https://www.eventbriteapi.com/v3/events/search/?";


  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        debugShowMaterialGrid: false,
        home: DefaultTabController(
          length: 11,
          child: Scaffold(
            appBar: AppBar(
              actions: <Widget>[
                // overflow menu
                PopupMenuButton<Choice>(
                    itemBuilder: (BuildContext context) {
                      return choices.map((Choice choice) {
                        return PopupMenuItem<Choice>(
                          value: choice,
                          child: Text(choice.title),
                        );
                      }
                      ).toList();
                    },
                    onSelected: (Choice result) {
                      setState(() {
                        _locationAddress = result.title;
                        //  _country = country(result.title);
                      });
                    }
                )
              ],
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
              title: Text(_locationAddress + "'s Events"),
            ),
            body: TabBarView(
              children: [
                new HomePage(
                  url: _urlStringEvents + "q=free+events&location.address=" +
                      _locationAddress + "&token=" +
                      _tokenKey,),
                new HomePage(
                    url: _urlStringEvents + "q=music&token=" +
                        _tokenKey),
                new HomePage(
                    url: _urlStringEvents + "q=family+education&token=" +
                        _tokenKey),
                new HomePage(
                    url: _urlStringEvents + "q=business+professional&token=" +
                        _tokenKey),
                new HomePage(
                    url: _urlStringEvents + "q=science+technology&token=" +
                        _tokenKey),
                new HomePage(
                    url: _urlStringEvents + "q=sports+fitness&token=" +
                        _tokenKey),
                new HomePage(
                    url: _urlStringEvents + "q=health+wellness&token&token=" +
                        _tokenKey),
                new HomePage(
                    url: _urlStringEvents + "q=travel+outdoor&token=" +
                        _tokenKey),
                new HomePage(
                    url: _urlStringEvents +
                        "q=film+media+entertainment&token=" +
                        _tokenKey),
                new HomePage(
                    url: _urlStringEvents + "q=charity+causes7token=" +
                        _tokenKey),
                new HomePage(
                    url: _urlStringEvents + "q=school+activities&token=" +
                        _tokenKey)
              ],
            ),

          ),
        )

    );
  }
}

String country(String country) {
  String _countryCode;
  switch (country) {
    case 'India':
      _countryCode = "in";
      break;
    case 'USA':
      _countryCode = "us";
      break;
    case 'China':
      _countryCode = "cn";
      break;
    case 'Australia':
      _countryCode = "au";
      break;
    case 'Ireland':
      _countryCode = "ie";
      break;
    case 'Netherland':
      _countryCode = "nl";
      break;
    case 'New Zealand':
      _countryCode = "it";
      break;
    case 'United Kingdom':
      _countryCode = "gb";
      break;
    case 'Japan':
      _countryCode = "jp";
      break;
    case 'Israel':
      _countryCode = "il";
      break;
  }
  return _countryCode;
}

class Choice {
  const Choice({this.title});

  final String title;
}

const List<Choice> choices = const <Choice>[
  const Choice(title: 'India'),
  const Choice(title: 'USA'),
  const Choice(title: 'China'),
  const Choice(title: 'Australia'),
  const Choice(title: 'Ireland'),
  const Choice(title: 'Netherland'),
  const Choice(title: 'Italy'),
  const Choice(title: 'United Kingdom'),
  const Choice(title: 'Japan'),
  const Choice(title: 'Israel')
];




