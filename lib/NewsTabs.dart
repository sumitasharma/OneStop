import 'package:flutter/material.dart';
import 'package:flutter_news_app/HomePage.dart';



class NewsTabs extends StatelessWidget {
  final _apiKey = "";



  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: DefaultTabController(
        length: 9,
        child: Scaffold(
          appBar: AppBar(
            actions: <Widget>[
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
                url: "https://newsapi.org/v2/top-headlines?language=en&apiKey=" +
                    _apiKey,),
              new HomePage(
                  url: "https://newsapi.org/v2/top-headlines?country=us&language=en&apiKey=" +
                      _apiKey),
              new HomePage(
                  url: "https://newsapi.org/v2/top-headlines?country=in&language=en&apiKey=" +
                      _apiKey),
              new HomePage(
                  url: "https://newsapi.org/v2/top-headlines?country=us&category=business&apiKey=" +
                      _apiKey),
              new HomePage(
                  url: "https://newsapi.org/v2/top-headlines?category=technology&country=us&apiKey=" +
                      _apiKey),
              new HomePage(
                  url: "https://newsapi.org/v2/top-headlines?category=entertainment&country=us&apiKey=" +
                      _apiKey),
              new HomePage(
                  url: "https://newsapi.org/v2/top-headlines?category=sports&country=us&apiKey=" +
                      _apiKey),
              new HomePage(
                  url: "https://newsapi.org/v2/top-headlines?category=science&country=us&apiKey=" +
                      _apiKey),
              new HomePage(
                  url: "https://newsapi.org/v2/top-headlines?category=health&country=us&apiKey=" +
                      _apiKey),
            ],
          ),
        ),
      ),
    );
  }
}