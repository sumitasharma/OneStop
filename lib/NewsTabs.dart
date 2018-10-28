import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:flutter_news_app/EventsTabs.dart';
import 'package:flutter_news_app/NewsPage.dart';
import 'package:flutter_news_app/PodcastTabs.dart';
import 'package:flutter_news_app/SearchNews.dart';
import 'package:flutter_news_app/page_view.dart';

import 'util.dart';

class NewsTabs extends StatefulWidget {
  final String country;

  const NewsTabs({Key key, this.country}) : super(key: key);

  @override
  NewsPageState createState() => new NewsPageState();
}

class NewsPageState extends State<NewsTabs> {

  final GlobalKey<ScaffoldState> _scaffoldKey = new GlobalKey<ScaffoldState>();
  Util newUtil = new Util();
  static String _apiKey;
  static String _countryName;
  int _currentIndex = 1;
  //String _country='us';
  String _urlStringTopHeadlines = "https://newsapi.org/v2/top-headlines?";
  String _urlStringSearchNews = "https://newsapi.org/v2/everything?";
  Icon actionIcon = new Icon(Icons.search);
  Widget appBarTitle = new Text("News Today");
  final TextEditingController _searchQuery = new TextEditingController();

  @override
  void initState() {
    super.initState();
    _apiKey = newUtil.apiKey;
    _countryName = country(widget.country);
  }

  @override
  void setState(fn) {
    super.setState(fn);
    _apiKey = newUtil.apiKey;
  }

  @override
  Widget build(BuildContext context) {
    timeDilation = 1.0;
    return MaterialApp(
        debugShowCheckedModeBanner: false,
        home: DefaultTabController(
          length: 8,
          child: Scaffold(

            key: _scaffoldKey,
            appBar: AppBar(
              centerTitle: true,
              title: appBarTitle,
              actions: <Widget>[
                new IconButton(icon: actionIcon, onPressed: () {
                  setState(() {
                    if (this.actionIcon.icon == Icons.search) {
                      this.actionIcon = new Icon(Icons.close);
                      this.appBarTitle = new TextField(
                        controller: _searchQuery,
                        style: new TextStyle(
                          color: Colors.white,
                        ),
                        decoration: new InputDecoration(
                            prefixIcon: new Icon(
                                Icons.search, color: Colors.white),
                            hintText: "Search...",
                            hintStyle: new TextStyle(color: Colors.white)
                        ),
                        onSubmitted: (String str) {
                          setState(() {
                            Navigator.of(context, rootNavigator: true).push(
                                new CupertinoPageRoute<bool>(
                                    fullscreenDialog: false,
                                    builder: (BuildContext context) =>
                                    new SearchNews(
                                        url: _urlStringSearchNews + "q=" + str +
                                            "&apiKey=" + _apiKey, query: str))
                            );
                          }
                          );
                        },
                      );
                    }
                    else {
                      this.actionIcon = new Icon(Icons.search);
                      this.appBarTitle = new Text("News Today");
                    }
                  });
                },),
              ],
              bottom: new TabBar(
                isScrollable: true,
                tabs: <Widget>[
                  new Tab(text: _countryName + "'s Top News"),
                  new Tab(text: "World"),
                  new Tab(text: "Buisness"),
                  new Tab(text: "Technology"),
                  new Tab(text: "Entertainment"),
                  new Tab(text: "Sports"),
                  new Tab(text: "Science",),
                  new Tab(text: "Health",)
                ],
              ),
            ),
            body: TabBarView(
              children: [
                new HomePage(
                    url: _urlStringTopHeadlines + "country=" + widget.country +
                        "&apiKey=" +
                        _apiKey),
                new HomePage(
                  url: _urlStringTopHeadlines + "language=en&apiKey=" +
                      _apiKey,),
                new HomePage(
                    url: _urlStringTopHeadlines + "country=" + widget.country +
                        "&category=business&apiKey=" +
                        _apiKey),
                new HomePage(
                    url: _urlStringTopHeadlines + "country=" + widget.country +
                        "&category=technology&apiKey=" +
                        _apiKey),
                new HomePage(
                    url: _urlStringTopHeadlines +
                        "category=entertainment&country=" +
                        widget.country + "&apiKey=" +
                        _apiKey),
                new HomePage(
                    url: _urlStringTopHeadlines + "category=sports&country=" +
                        widget.country +
                        "&apiKey=" +
                        _apiKey),
                new HomePage(
                    url: _urlStringTopHeadlines + "category=science&country=" +
                        widget.country +
                        "&apiKey=" +
                        _apiKey),
                new HomePage(
                    url: _urlStringTopHeadlines + "category=health&country=" +
                        widget.country +
                        "&apiKey=" +
                        _apiKey),
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
                      case 2:
                        print("In the eventstabs");
                        Navigator.of(context, rootNavigator: true).push(
                          new CupertinoPageRoute<bool>(
                              fullscreenDialog: false,
                              builder: (
                                  BuildContext context) => new EventsTabs()),
                        );
                        break;
                      case 3:
                        print("In the podcasttabs");
                        Navigator.of(context, rootNavigator: true).push(
                          new CupertinoPageRoute<bool>(
                              fullscreenDialog: false,
                              builder: (
                                  BuildContext context) => new PodcastTabs()),
                        );
                        break;
                    }
                  }),
              items: [
                BottomNavigationBarItem(
                    icon: new Icon(Icons.home),
                    title: new Text('Home'),
                    backgroundColor: Colors.blue
                ),
                BottomNavigationBarItem(
                    icon: new Icon(Icons.book),
                    title: new Text('News'),
                    backgroundColor: Colors.blue
                ),
                BottomNavigationBarItem(
                    icon: new Icon(Icons.event),
                    title: new Text('Events'),
                    backgroundColor: Colors.blue
                ),
                BottomNavigationBarItem(
                    icon: Icon(Icons.headset),
                    title: Text('Podcast'),
                    backgroundColor: Colors.blue

                ),
              ],
            ),
            drawer: Drawer(
              child: ListView(
                padding: EdgeInsets.zero,
                children: <Widget>[
                  Container(
                    height: 120.0,
                    child: DrawerHeader(
                      child: Text("Country's News",
                        style: new TextStyle(
                            fontSize: 24.0,
                            fontStyle: FontStyle.italic,
                            color: Colors.white),),
                      decoration: BoxDecoration(
                        shape: BoxShape.rectangle,
                        color: Colors.blue,
                      ),
                    ),
                  ),
                  ListTile(
                    trailing: new Container(
                        height: 50.0,
                        width: 50.0,
                        decoration: new BoxDecoration(
                          image: new DecorationImage(
                              image: new AssetImage(
                                  'assets/indian_flag.png'),
                              fit: BoxFit.scaleDown),
                          borderRadius: new BorderRadius.all(
                              new Radius.circular(16.0)),
                          border: new Border.all(
                            color: Colors.white,
                            width: 2.0,
                          ),
                        )),
                    title: Text('India', style: new TextStyle(
                        fontSize: 18.0, fontStyle: FontStyle.italic),),
                    onTap: () {
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => NewsTabs(country: 'in')));
                    },
                  ),
                  ListTile(
                    trailing: new Container(
                        height: 50.0,
                        width: 50.0,
                        decoration: new BoxDecoration(
                          image: new DecorationImage(
                              image: new AssetImage(
                                  'assets/america_flag.png'),
                              fit: BoxFit.scaleDown),
                          borderRadius: new BorderRadius.all(
                              new Radius.circular(16.0)),
                          border: new Border.all(
                            color: Colors.white,
                            width: 2.0,
                          ),
                        )),
                    title: Text('United States of America',
                        style: new TextStyle(
                            fontSize: 18.0, fontStyle: FontStyle.italic)),
                    onTap: () {
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => NewsTabs(country: 'us')));
                    },
                  ),
                  ListTile(
                    trailing: new Container(
                        height: 50.0,
                        width: 50.0,
                        decoration: new BoxDecoration(
                          image: new DecorationImage(
                              image: new AssetImage(
                                  'assets/china_flag.png'),
                              fit: BoxFit.scaleDown),
                          borderRadius: new BorderRadius.all(
                              new Radius.circular(16.0)),
                          border: new Border.all(
                            color: Colors.white,
                            width: 2.0,
                          ),
                        )),
                    title: Text('China', style: new TextStyle(
                        fontSize: 18.0, fontStyle: FontStyle.italic)),
                    onTap: () {
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => NewsTabs(country: 'cn')));
                    },
                  ),
                  ListTile(
                    trailing: new Container(
                        height: 50.0,
                        width: 50.0,
                        decoration: new BoxDecoration(
                          image: new DecorationImage(
                              image: new AssetImage(
                                  'assets/australia_flag.png'),
                              fit: BoxFit.scaleDown),
                          borderRadius: new BorderRadius.all(
                              new Radius.circular(16.0)),
                          border: new Border.all(
                            color: Colors.white,
                            width: 2.0,
                          ),
                        )),
                    title: Text(
                        'Australia', style: new TextStyle(
                        fontSize: 18.0, fontStyle: FontStyle.italic)),
                    onTap: () {
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => NewsTabs(country: 'au')));
                    },
                  ),
                  ListTile(
                    trailing: new Container(
                        height: 50.0,
                        width: 50.0,
                        decoration: new BoxDecoration(
                          image: new DecorationImage(
                              image: new AssetImage(
                                  'assets/ireland_flag.png'),
                              fit: BoxFit.scaleDown),
                          borderRadius: new BorderRadius.all(
                              new Radius.circular(16.0)),
                          border: new Border.all(
                            color: Colors.white,
                            width: 2.0,
                          ),
                        )),
                    title: Text(
                        'Ireland', style: new TextStyle(
                        fontSize: 18.0, fontStyle: FontStyle.italic)),
                    onTap: () {
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => NewsTabs(country: 'ie')));
                    },
                  ),
                  ListTile(
                    trailing: new Container(
                        height: 50.0,
                        width: 50.0,
                        decoration: new BoxDecoration(
                          image: new DecorationImage(
                              image: new AssetImage(
                                  'assets/netherlands_flag.png'),
                              fit: BoxFit.scaleDown),
                          borderRadius: new BorderRadius.all(
                              new Radius.circular(16.0)),
                          border: new Border.all(
                            color: Colors.white,
                            width: 2.0,
                          ),
                        )),
                    title: Text(
                        'Netherland', style: new TextStyle(
                        fontSize: 18.0, fontStyle: FontStyle.italic)),
                    onTap: () {
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => NewsTabs(country: 'nl')));
                    },
                  ),
                  ListTile(
                    trailing: new Container(
                        height: 50.0,
                        width: 50.0,
                        decoration: new BoxDecoration(
                          image: new DecorationImage(
                              image: new AssetImage(
                                  'assets/new_zealand_flag.png'),
                              fit: BoxFit.scaleDown),
                          borderRadius: new BorderRadius.all(
                              new Radius.circular(16.0)),
                          border: new Border.all(
                            color: Colors.white,
                            width: 2.0,
                          ),
                        )),
                    title: Text(
                        'New Zealand', style: new TextStyle(
                        fontSize: 18.0, fontStyle: FontStyle.italic)),
                    onTap: () {
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => NewsTabs(country: 'nz')));
                    },
                  ),
                  ListTile(
                    trailing: new Container(
                        height: 50.0,
                        width: 50.0,
                        decoration: new BoxDecoration(
                          image: new DecorationImage(
                              image: new AssetImage(
                                  'assets/uk_flag.png'),
                              fit: BoxFit.scaleDown),
                          borderRadius: new BorderRadius.all(
                              new Radius.circular(16.0)),
                          border: new Border.all(
                            color: Colors.white,
                            width: 2.0,
                          ),
                        )),
                    title: Text(
                        'United Kingdom', style: new TextStyle(
                        fontSize: 18.0, fontStyle: FontStyle.italic)),
                    onTap: () {
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => NewsTabs(country: 'gb')));
                    },
                  ),
                  ListTile(
                    trailing: new Container(
                        height: 50.0,
                        width: 50.0,
                        decoration: new BoxDecoration(
                          image: new DecorationImage(
                              image: new AssetImage(
                                  'assets/japan_flag.png'),
                              fit: BoxFit.scaleDown),
                          borderRadius: new BorderRadius.all(
                              new Radius.circular(16.0)),
                          border: new Border.all(
                            color: Colors.white,
                            width: 2.0,
                          ),
                        )),
                    title: Text('Japan', style: new TextStyle(
                        fontSize: 18.0, fontStyle: FontStyle.italic)),
                    onTap: () {
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => NewsTabs(country: 'jp')));
                    },
                  ),
                  ListTile(
                    trailing: new Container(
                        height: 50.0,
                        width: 50.0,
                        decoration: new BoxDecoration(
                          image: new DecorationImage(
                              image: new AssetImage(
                                  'assets/israel_flag.jpg'),
                              fit: BoxFit.scaleDown),
                          borderRadius: new BorderRadius.all(
                              new Radius.circular(16.0)),
                          border: new Border.all(
                            color: Colors.white,
                            width: 2.0,
                          ),
                        )),
                    title: Text('Israel', style: new TextStyle(
                        fontSize: 18.0, fontStyle: FontStyle.italic)),
                    onTap: () {
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => NewsTabs(country: 'il')));
                    },
                  ),
                  ListTile(
                    trailing: new Container(
                        height: 50.0,
                        width: 50.0,
                        decoration: new BoxDecoration(
                          image: new DecorationImage(
                              image: new AssetImage(
                                  'assets/canada_flag.png'),
                              fit: BoxFit.scaleDown),
                          borderRadius: new BorderRadius.all(
                              new Radius.circular(16.0)),
                          border: new Border.all(
                            color: Colors.white,
                            width: 2.0,
                          ),
                        )),
                    title: Text('Canada', style: new TextStyle(
                        fontSize: 18.0, fontStyle: FontStyle.italic)),
                    onTap: () {
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => NewsTabs(country: 'ca')));
                    },
                  ),
                  ListTile(
                    trailing: new Container(
                        height: 50.0,
                        width: 50.0,
                        decoration: new BoxDecoration(
                          image: new DecorationImage(
                              image: new AssetImage(
                                  'assets/dubai_flag.png'),
                              fit: BoxFit.scaleDown),
                          borderRadius: new BorderRadius.all(
                              new Radius.circular(16.0)),
                          border: new Border.all(
                            color: Colors.white,
                            width: 2.0,
                          ),
                        )),
                    title: Text('UAE', style: new TextStyle(
                        fontSize: 18.0, fontStyle: FontStyle.italic)),
                    onTap: () {
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => NewsTabs(country: 'ae')));
                    },
                  ),
                  ListTile(
                    trailing: new Container(
                        height: 50.0,
                        width: 50.0,
                        decoration: new BoxDecoration(
                          image: new DecorationImage(
                              image: new AssetImage(
                                  'assets/french_flag.png'),
                              fit: BoxFit.scaleDown),
                          borderRadius: new BorderRadius.all(
                              new Radius.circular(16.0)),
                          border: new Border.all(
                            color: Colors.white,
                            width: 2.0,
                          ),
                        )),
                    title: Text('France', style: new TextStyle(
                        fontSize: 18.0, fontStyle: FontStyle.italic)),
                    onTap: () {
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => NewsTabs(country: 'fr')));
                    },
                  ),
                  ListTile(
                    trailing: new Container(
                        height: 50.0,
                        width: 50.0,
                        decoration: new BoxDecoration(
                          image: new DecorationImage(
                              image: new AssetImage(
                                  'assets/germany_flag.png'),
                              fit: BoxFit.scaleDown),
                          borderRadius: new BorderRadius.all(
                              new Radius.circular(16.0)),
                          border: new Border.all(
                            color: Colors.white,
                            width: 2.0,
                          ),
                        )),
                    title: Text('Germany', style: new TextStyle(
                        fontSize: 18.0, fontStyle: FontStyle.italic)),
                    onTap: () {
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => NewsTabs(country: 'de')));
                    },
                  ),
                  ListTile(
                    trailing: new Container(
                        height: 50.0,
                        width: 50.0,
                        decoration: new BoxDecoration(
                          image: new DecorationImage(
                              image: new AssetImage(
                                  'assets/singapore_flag.png'),
                              fit: BoxFit.scaleDown),
                          borderRadius: new BorderRadius.all(
                              new Radius.circular(16.0)),
                          border: new Border.all(
                            color: Colors.white,
                            width: 2.0,
                          ),
                        )),
                    title: Text('Singapore', style: new TextStyle(
                        fontSize: 18.0, fontStyle: FontStyle.italic)),
                    onTap: () {
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => NewsTabs(country: 'sg')));
                    },
                  ),
                  ListTile(
                    trailing: new Container(
                        height: 50.0,
                        width: 50.0,
                        decoration: new BoxDecoration(
                          image: new DecorationImage(
                              image: new AssetImage(
                                  'assets/rusia_flag.png'),
                              fit: BoxFit.scaleDown),
                          borderRadius: new BorderRadius.all(
                              new Radius.circular(16.0)),
                          border: new Border.all(
                            color: Colors.white,
                            width: 2.0,
                          ),
                        )),
                    title: Text('Russia', style: new TextStyle(
                        fontSize: 18.0, fontStyle: FontStyle.italic)),
                    onTap: () {
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => NewsTabs(country: 'ru')));
                    },
                  ),
                  ListTile(
                    trailing: new Container(
                        height: 50.0,
                        width: 50.0,
                        decoration: new BoxDecoration(
                          image: new DecorationImage(
                              image: new AssetImage(
                                  'assets/south_korea_flag.png'),
                              fit: BoxFit.scaleDown),
                          borderRadius: new BorderRadius.all(
                              new Radius.circular(16.0)),
                          border: new Border.all(
                            color: Colors.white,
                            width: 2.0,
                          ),
                        )),
                    title: Text('South Korea', style: new TextStyle(
                        fontSize: 18.0, fontStyle: FontStyle.italic)),
                    onTap: () {
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => NewsTabs(country: 'kr')));
                    },
                  ),
                  ListTile(
                    trailing: new Container(
                        height: 50.0,
                        width: 50.0,
                        decoration: new BoxDecoration(
                          image: new DecorationImage(
                              image: new AssetImage(
                                  'assets/malaysia_flag.png'),
                              fit: BoxFit.scaleDown),
                          borderRadius: new BorderRadius.all(
                              new Radius.circular(16.0)),
                          border: new Border.all(
                            color: Colors.white,
                            width: 2.0,
                          ),
                        )),
                    title: Text('Malaysia', style: new TextStyle(
                        fontSize: 18.0, fontStyle: FontStyle.italic)),
                    onTap: () {
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => NewsTabs(country: 'my')));
                    },
                  ),
                  ListTile(
                    trailing: new Container(
                        height: 50.0,
                        width: 50.0,
                        decoration: new BoxDecoration(
                          image: new DecorationImage(
                              image: new AssetImage(
                                  'assets/thailand_flag.png'),
                              fit: BoxFit.scaleDown),
                          borderRadius: new BorderRadius.all(
                              new Radius.circular(16.0)),
                          border: new Border.all(
                            color: Colors.white,
                            width: 2.0,
                          ),
                        )),
                    title: Text('Thailand', style: new TextStyle(
                        fontSize: 18.0, fontStyle: FontStyle.italic)),
                    onTap: () {
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => NewsTabs(country: 'th')));
                    },
                  ),
                ],
              ),
            ),

          ),
        )

    );
  }
}

String country(String country) {
  String _countryCode;
  switch (country) {
    case 'in':
      _countryCode = "India";
      break;
    case 'us':
      _countryCode = "USA";
      break;
    case 'cn':
      _countryCode = "China";
      break;
    case 'au':
      _countryCode = "Australia";
      break;
    case 'ie':
      _countryCode = "Ireland";
      break;
    case 'nl':
      _countryCode = "Netherland";
      break;
    case 'nz':
      _countryCode = "New Zealand";
      break;
    case 'gb':
      _countryCode = "United Kingdom";
      break;
    case 'jp':
      _countryCode = "Japan";
      break;
    case 'il':
      _countryCode = "Israel";
      break;
    case 'ca':
      _countryCode = "Canada";
      break;
    case 'ae':
      _countryCode = "UAE";
      break;
    case 'fr':
      _countryCode = "France";
      break;
    case 'de':
      _countryCode = "Germany";
      break;
    case 'sg':
      _countryCode = "Singapore";
      break;
    case 'ru':
      _countryCode = "Russia";
      break;
    case 'kr':
      _countryCode = "South Korea";
      break;
    case 'my':
      _countryCode = "Malaysia";
      break;
    case 'th':
      _countryCode = "Thaiand";
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
  const Choice(title: 'Israel'),
  const Choice(title: 'Canada'),
  const Choice(title: 'UAE'),
  const Choice(title: 'France'),
  const Choice(title: 'Germany'),
  const Choice(title: 'Singapore'),
  const Choice(title: 'Russia'),
  const Choice(title: 'South Korea'),
  const Choice(title: 'Malaysia'),
  const Choice(title: 'Thaiand'),
];




