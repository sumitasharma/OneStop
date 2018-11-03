import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:flutter_news_app/EventsTabs.dart';
import 'package:flutter_news_app/NewsTabs.dart';
import 'package:flutter_news_app/PodcastPage.dart';
import 'package:flutter_news_app/page_view.dart';
import 'package:flutter_news_app/util.dart';


class PodcastTabs extends StatefulWidget {
  @override
  PodcastPageState createState() => new PodcastPageState();
}

class PodcastPageState extends State<PodcastTabs> {
  Util newUtil = new Util();
  static String _podCastApi;
  String _urlStringPodCast = "http://api.digitalpodcast.com/v2r/search/?format=json&appid=";
  String _keyword = "&keywords=";
  String _search;
  int _currentIndex = 3;


  @override
  void initState() {
    super.initState();
    _podCastApi = newUtil.podCastApi;
  }

  @override
  Widget build(BuildContext context) {
    timeDilation = 1.0;
    return MaterialApp(
        debugShowCheckedModeBanner: false,
        home: DefaultTabController(
          length: 13,
          child: Scaffold(
            appBar: AppBar(
                backgroundColor: Color.fromRGBO(128, 0, 128, 50.0),
                leading: new IconButton(
                    icon: new Icon(Icons.arrow_back),
                    onPressed: () {
                      Navigator.pop(context, true);
                    }),
                bottom: new TabBar(
                  isScrollable: true,
                  indicatorColor: Color.fromRGBO(128, 0, 128, 50.0),
                  tabs: <Widget>[

                    new Tab(text: "Music"),
                    new Tab(text: "Business"),
                    new Tab(text: "Educational"),
                    new Tab(text: "Comedy"),
                    new Tab(text: "News & Politics",),
                    new Tab(text: "Science & Medicine"),
                    new Tab(text: "Sports"),
                    new Tab(text: "Technology & Gadgets",),
                    new Tab(text: "Television",),
                    new Tab(text: "Film & Entertainment",),
                    new Tab(text: "Charity & Causes",),
                    new Tab(text: "Religion & Spirituality",),
                    new Tab(text: "Arts",)
                  ],
                  labelStyle: TextStyle(
                    fontSize: 20.0, fontFamily: 'RobotoMono',),
                ),
                title: Text("Podcast", style: new TextStyle(
                  fontWeight: FontWeight.bold,
                  fontFamily: 'Raleway',
                  fontSize: 22.0,
                  color: Colors.white,
                ),)),
            body: TabBarView(
              children: [
                new HomePage(
                    url: _urlStringPodCast + _podCastApi + _keyword + "music"),
                new HomePage(
                    url: _urlStringPodCast + _podCastApi + _keyword +
                        "business"),
                new HomePage(
                    url: _urlStringPodCast + _podCastApi + _keyword +
                        "educational"),
                new HomePage(
                    url: _urlStringPodCast + _podCastApi + _keyword + "comedy"),
                new HomePage(
                    url: _urlStringPodCast + _podCastApi + _keyword +
                        "news & politics"),
                new HomePage(
                    url: _urlStringPodCast + _podCastApi + _keyword +
                        "science & medicine"),
                new HomePage(
                    url: _urlStringPodCast + _podCastApi + _keyword + "sports"),
                new HomePage(
                    url: _urlStringPodCast + _podCastApi + _keyword +
                        "technology & gadgets"),
                new HomePage(
                    url: _urlStringPodCast + _podCastApi + _keyword +
                        "television"),
                new HomePage(
                    url: _urlStringPodCast + _podCastApi + _keyword +
                        "film & entertainment"),
                new HomePage(
                    url: _urlStringPodCast + _podCastApi + _keyword +
                        "charity & causes"),
                new HomePage(
                    url: _urlStringPodCast + _podCastApi + _keyword +
                        "religion & spirituality"),
                new HomePage(
                    url: _urlStringPodCast + _podCastApi + _keyword + "arts")
              ],
            ),
            bottomNavigationBar: BottomNavigationBar(
              currentIndex: _currentIndex,
              onTap: (newIndex) =>
                  setState(() {
                    _currentIndex = newIndex;
                    switch (_currentIndex) {
                      case 0:
                        print("In the intropage");
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => IntroPageView()),
                        );
                        break;
                      case 1:
                        print("In the newstabs");
                        Navigator.of(context, rootNavigator: true).push(
                          new CupertinoPageRoute<bool>(
                              fullscreenDialog: false,
                              builder: (BuildContext context) =>
                              new NewsTabs(country: 'us',)),
                        );
                        break;
                      case 2:
                        print("In the eventstabs");
                        Navigator.of(context, rootNavigator: true).push(
                          new CupertinoPageRoute<bool>(
                              fullscreenDialog: false,
                              builder: (
                                  BuildContext context) => new EventsTabs()),
                        );
                        break;
                    }
                    print(_currentIndex);
                  }),
              items: [
                BottomNavigationBarItem(
                    icon: new Icon(Icons.home),
                    title: new Text('Home'),
                    backgroundColor: Color.fromRGBO(128, 0, 128, 50.0)
                ),
                BottomNavigationBarItem(
                    icon: new Icon(Icons.book),
                    title: new Text('News'),
                    backgroundColor: Color.fromRGBO(128, 0, 128, 50.0)
                ),
                BottomNavigationBarItem(
                    icon: new Icon(Icons.event),
                    title: new Text('Events'),
                    backgroundColor: Color.fromRGBO(128, 0, 128, 50.0)
                ),
                BottomNavigationBarItem(
                    icon: Icon(Icons.headset),
                    title: Text('Podcast'),
                    backgroundColor: Color.fromRGBO(128, 0, 128, 50.0)

                ),
              ],
            ),
          ),
        )

    );
  }
}

String searchKeyword(String searchCode) {
  String _searchCode;
  switch (searchCode) {
    case 'Music':
      _searchCode = "music";
      break;
    case 'Business':
      _searchCode = "business";
      break;
    case 'Educational':
      _searchCode = "educational";
      break;
    case 'Comedy':
      _searchCode = "comedy";
      break;
    case 'News & Politics':
      _searchCode = "news & politics";
      break;
    case 'Science & Medicine':
      _searchCode = "science & medicine";
      break;
    case 'Sports':
      _searchCode = "sports";
      break;
    case 'Technology & Gadgets':
      _searchCode = "technology & gadgets";
      break;
    case 'Television':
      _searchCode = "television";
      break;
    case 'Film & Entertainment':
      _searchCode = "film & entertainment";
      break;
    case 'Charity & Causes':
      _searchCode = "charity & causes";
      break;
    case 'Religion & Spirituality':
      _searchCode = "religion & spirituality";
      break;
    case 'Arts':
      _searchCode = "arts";
      break;
  }
  return _searchCode;
}

