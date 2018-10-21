import 'package:flutter/material.dart';
import 'package:flutter_news_app/EventLocation.dart';
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

      '/NewsTab': (context) => new NewsTabs(),
      '/EventsTab': (context) => new EventLocation(),
      '/PodcastTab': (context) => new PodcastTabs()
    },
  ));
}




