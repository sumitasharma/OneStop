import 'package:flutter/material.dart';
import 'package:flutter_news_app/EventsTabs.dart';
import 'package:flutter_news_app/page_view.dart';

import 'NewsTabs.dart';


void main() {
  runApp(MaterialApp(
    debugShowCheckedModeBanner: false,
    title: 'News',
    theme: new ThemeData(primaryColor: Color.fromRGBO(58, 66, 86, 1.0)),
    // Start the app with the "/" named route. In our case, the app will start
    // on the FirstScreen Widget
    home: new IntroPageView(),
    initialRoute: '/',
    routes: {

      '/NewsTab': (context) => new NewsTabs(),
      // When we navigate to the "/second" route, build the DetailNews Widget
      '/EventsTab': (context) => new EventsTabs(),
    },
  ));
}


//void main() {
//  runApp(new MaterialApp(
//    home: new HomePage(),
//  ));
//}



