import 'package:flutter/material.dart';
import 'package:flutter_news_app/DetailNews.dart';
import 'package:flutter_news_app/NewsTabs.dart';


void main() {
  runApp(MaterialApp(
    title: 'News',
    theme: new ThemeData(primaryColor: Color.fromRGBO(58, 66, 86, 1.0)),
    // Start the app with the "/" named route. In our case, the app will start
    // on the FirstScreen Widget
    initialRoute: '/',
    routes: {
      // When we navigate to the "/" route, build the HomePage Widget
      '/': (context) => NewsTabs(),
      // When we navigate to the "/second" route, build the DetailNews Widget
      '/second': (context) => DetailNews(),
    },
  ));
}


//void main() {
//  runApp(new MaterialApp(
//    home: new HomePage(),
//  ));
//}



