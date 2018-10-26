import 'package:flutter/material.dart';
import 'package:flutter_news_app/NewsPage.dart';
import 'package:flutter_news_app/SearchNews.dart';

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
                            Navigator.push(
                                context,
                                MaterialPageRoute(builder: (context) =>
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
            drawer: Drawer(
              child: ListView(
                padding: EdgeInsets.zero,
                children: <Widget>[
                  Container(
                    height: 120.0,
                    child: DrawerHeader(
                      child: Text("Country's News",
                        style: new TextStyle(
                            fontSize: 24.0, fontStyle: FontStyle.italic),),
                      decoration: BoxDecoration(
                        shape: BoxShape.rectangle,
                        color: Colors.blue,
                      ),
                    ),
                  ),
                  ListTile(
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
                    title: Text('Israel', style: new TextStyle(
                        fontSize: 18.0, fontStyle: FontStyle.italic)),
                    onTap: () {
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => NewsTabs(country: 'il')));
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




