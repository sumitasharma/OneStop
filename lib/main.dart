import 'package:flutter/material.dart';
import 'package:flutter_news_app/EventsTabs.dart';
import 'package:flutter_news_app/page_view.dart';

import 'NewsTabs.dart';
import 'PodcastTabs.dart';


void main() {
  runApp(MaterialApp(
    debugShowCheckedModeBanner: false,
    title: 'News',
    theme: new ThemeData(primaryColor: Color.fromRGBO(58, 66, 86, 1.0)),
    home: new IntroPageView(),
    initialRoute: '/',
    routes: {
      '/IntroPageView': (context) => IntroPageView(),
      '/NewsTab': (context) => new NewsTabs(),
      '/EventsTab': (context) => new EventsTabs(),
      '/PodcastTab': (context) => new PodcastTabs()
    },
  ));
}




