import 'package:flutter/material.dart';
import 'package:flutter_news_app/HomePage.dart';


class NewsTabs extends StatefulWidget {
  @override
  HomePageState createState() => new HomePageState();
}

class HomePageState extends State<NewsTabs> {

  String _apiKey = "";
  String _country = "us";
  String _countryName = "USA";
  String _urlString = "https://newsapi.org/v2/top-headlines?";

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {

    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: DefaultTabController(
        length: 8,
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
                      _countryName = result.title;
                      _country = country(result.title);
                    });
                  }
              )
            ],
            bottom: new TabBar(isScrollable: true,
              tabs: <Widget>[
                new Tab(text: "World"),
                new Tab(text: _countryName + "'s Top News"),
                new Tab(text: "Buisness"),
                new Tab(text: "Technology"),
                new Tab(text: "Entertainment"),
                new Tab(text: "Sports"),
                new Tab(text: "Science",),
                new Tab(text: "Health",)
              ],
            ),
            title: Text("Today's News"),
          ),
          body: TabBarView(
            children: [
              new HomePage(
                url: _urlString + "language=en&apiKey=" +
                    _apiKey,),
              new HomePage(
                  url: _urlString + "country=" + _country + "&apiKey=" +
                      _apiKey),
              new HomePage(
                  url: _urlString + "country=" + _country +
                      "&category=business&apiKey=" +
                      _apiKey),
              new HomePage(
                  url: _urlString + "country=" + _country +
                      "&category=technology&apiKey=" +
                      _apiKey),
              new HomePage(
                  url: _urlString + "category=entertainment&country=" +
                      _country + "&apiKey=" +
                      _apiKey),
              new HomePage(
                  url: _urlString + "category=sports&country=" + _country +
                      "&apiKey=" +
                      _apiKey),
              new HomePage(
                  url: _urlString + "category=science&country=" + _country +
                      "&apiKey=" +
                      _apiKey),
              new HomePage(
                  url: _urlString + "category=health&country=" + _country +
                      "&apiKey=" +
                      _apiKey),
            ],
          ),
        ),
      ),
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
      _countryCode = "nz";
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
  const Choice(title: 'New Zealand'),
  const Choice(title: 'United Kingdom'),
  const Choice(title: 'Japan'),
  const Choice(title: 'Israel')
];