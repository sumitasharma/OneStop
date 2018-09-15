import 'package:flutter/material.dart';
import 'package:flutter_news_app/HomePage.dart';



class NewsTabs extends StatelessWidget {
  final _apiKey = "";

  @override
  Widget build(BuildContext context) {
    String _country = 'us';
    String _urlString = "https://newsapi.org/v2/top-headlines?";
    return MaterialApp(
      home: DefaultTabController(
        length: 9,
        child: Scaffold(
          appBar: AppBar(
            actions: <Widget>[
              // overflow menu
              PopupMenuButton<Choice>(
                  onSelected: null,
                  itemBuilder: (BuildContext context) {
                    return choices.skip(2).map((Choice choice) {
                      return PopupMenuItem<Choice>(
                        value: choice,
                        child: Text(choice.title),
                      );
                    }).toList();
                  }
              )
            ],
            bottom: new TabBar(isScrollable: true,
              tabs: <Widget>[
                new Tab(text: "World"),
                new Tab(text: "USA"),
                new Tab(text: "India"),
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
                  url: _urlString + "country=" + _country +
                      "&language=en&apiKey=" +
                      _apiKey),
              new HomePage(
                  url: _urlString + "country=" + _country +
                      "&language=en&apiKey=" +
                      _apiKey),
              new HomePage(
                  url: _urlString + "country=" + _country +
                      "&category=business&apiKey=" +
                      _apiKey),
              new HomePage(
                  url: "https://newsapi.org/v2/top-headlines?category=technology&country=" +
                      _country + "&apiKey=" +
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