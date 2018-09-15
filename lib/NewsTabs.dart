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
                  url: "https://newsapi.org/v2/top-headlines?country=us&source=google&apiKey=" +
                      _apiKey),
              new HomePage(
                  url: "https://newsapi.org/v2/top-headlines?country=in&source=google&apiKey=" +
                      _apiKey),
              new HomePage(
                  url: "https://newsapi.org/v2/top-headlines?category=business&source=google&apiKey=" +
                      _apiKey),
              new HomePage(
                  url: "https://newsapi.org/v2/top-headlines?category=technology&source=google&apiKey=" +
                      _apiKey),
              new HomePage(
                  url: "https://newsapi.org/v2/top-headlines?category=entertainment&source=google&apiKey=" +
                      _apiKey),
              new HomePage(
                  url: "https://newsapi.org/v2/top-headlines?category=sports&source=google&apiKey=" +
                      _apiKey),
              new HomePage(
                  url: "https://newsapi.org/v2/top-headlines?category=science&source=google&apiKey=" +
                      _apiKey),
              new HomePage(
                  url: "https://newsapi.org/v2/top-headlines?category=health&source=google&apiKey=" +
                      _apiKey),
            ],
          ),
        ),
      ),
    );
  }
}