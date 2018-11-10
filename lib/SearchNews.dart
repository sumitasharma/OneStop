import 'dart:async';
import 'dart:convert' show json;

import 'package:connectivity/connectivity.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_news_app/EventsTabs.dart';
import 'package:flutter_news_app/page_view.dart';
import 'package:flutter_webview_plugin/flutter_webview_plugin.dart';
import 'package:http/http.dart' as http;

import 'PodcastTabs.dart';

class SearchNews extends StatefulWidget {

  final String url;
  final String query;

  const SearchNews({Key key, this.url, this.query}) : super(key: key);

  @override
  SearchNewsState createState() => new SearchNewsState();
}

class SearchNewsState extends State<SearchNews> {

  List data;
  int _currentIndex = 1;
  Map<int, List> _saved = new Map();

  Future<String> getData() async {
    try {
      var response = await http.get(widget.url);
      this.setState(() {
        print(widget.url);
        Map decoded = json.decode(response.body);
        data = decoded['articles'];
        print(data[0]["url"]);
      });
      return "Success!";
    }
    catch (e) {
      return "No Internet";
    }
  }

  bool isInternetConnectivity() {
    var connectivityResult = new Connectivity()
        .checkConnectivity(); // User defined class
    if (connectivityResult == ConnectivityResult.mobile ||
        connectivityResult == ConnectivityResult.wifi) {
      return true;
    } else {
      return false;
    }
  }

  @override
  void initState() {
    super.initState();
    this.getData();
  }

  @override
  Widget build(BuildContext context) {
    return new MaterialApp(
        debugShowCheckedModeBanner: false,
        home: new Scaffold(
          appBar: new AppBar(
            leading: new IconButton(
                icon: new Icon(Icons.arrow_back),
                onPressed: () {
                  Navigator.pop(context, true);
                }),
            title: new Text('News on ' + widget.query,
              style: new TextStyle(
                fontWeight: FontWeight.bold,
                fontFamily: 'Raleway',
                fontSize: 22.0,
              ),),
          ),

          body: data == null
              ? Center(child: CircularProgressIndicator())
              : new Container(child: new ListView.builder(
              padding: EdgeInsets.all(8.0),
              itemCount: data == null ? 0 : data.length,
              itemBuilder: (BuildContext context, int index) {
                return new Card(
                    margin: EdgeInsets.only(
                        left: 4.0, right: 4.0, bottom: 16.0),
                    shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(15.0)),
                    elevation: 4.0,
                    child: new Column(
                        children: <Widget>[
                          new Container(
                            padding: new EdgeInsets.only(
                                left: 16.0, right: 16.0, bottom: 8.0),
                            child: new InkWell(
                              onTap: () =>
                                  Navigator.of(context, rootNavigator: true)
                                      .push(
                                      new CupertinoPageRoute<bool>(
                                          fullscreenDialog: false,
                                          builder: (BuildContext context) =>
                                          new WebviewScaffold(url:
                                          (data[index]["url"]),
                                            appBar: new AppBar(title: new Text(
                                              data[index]["title"],
                                              style: new TextStyle(
                                                fontWeight: FontWeight.bold,
                                                fontFamily: 'Raleway',
                                                fontSize: 22.0,
                                              ),),
                                                backgroundColor: Colors.blue
                                            ),
                                          ))
                                  ),
                                child: new Column(
                                  children: <Widget>[
                                    new Wrap(
                                      spacing: 4.0,
                                      // gap between adjacent chips
                                      runSpacing: 4.0,
                                      // gap between lines
                                      direction: Axis.horizontal,
                                      // main axis (rows or columns)

                                      children: <Widget>[
                                        new Container(
                                            height: 16.0),

                                        data[index]["urlToImage"] == null
                                            ? new Container(
                                            height: 200.0,
                                            decoration: new BoxDecoration(
                                              image: new DecorationImage(
                                                  image: new AssetImage(
                                                      'assets/news.jpg'),
                                                  fit: BoxFit.fitWidth),
                                              borderRadius: new BorderRadius
                                                  .all(
                                                  new Radius.circular(16.0)),
                                              border: new Border.all(
                                                color: Colors.pinkAccent,
                                                width: 2.0,
                                              ),
                                            )
                                        )

                                            : new Container(
                                          decoration: new BoxDecoration(
                                            image: new DecorationImage(
                                              image: new NetworkImage(
                                                  data[index]["urlToImage"]),
                                              fit: BoxFit.fill,
                                            ),
                                            borderRadius: new BorderRadius.all(
                                                new Radius.circular(16.0)),
                                          ),
                                          constraints: BoxConstraints(
                                              maxHeight: 200.0,
                                              minHeight: 100.0,
                                              minWidth: 300.0
                                          ),
                                        ),

                                        new Container(
                                          height: 20.0,
                                        ),

                                        data[index]["title"] == null
                                            ? new Text("Missing Title")
                                            : new Container(
                                            child: new Text(
                                                data[index]["title"],
                                                style: TextStyle(
                                                    fontWeight: FontWeight.bold,
                                                    fontStyle: FontStyle.normal,
                                                    fontFamily: 'Raleway',
                                                    fontSize: 24.0
                                                ),
                                                textAlign: TextAlign.left)),

                                        new Container(
                                          height: 16.0,
                                        ),

                                        data[index]["description"] == null
                                            ? new Text("")
                                            : new Container(
                                            child: new Text(
                                                data[index]["description"],
                                                style: TextStyle(
                                                    fontStyle: FontStyle.normal,
                                                    fontFamily: 'Raleway',
                                                    fontSize: 20.0))
                                        ),
                                        new Container(
                                          height: 16.0,
                                        ),
                                        new Divider(
                                          height: 20.0, color: Colors.blue,),
                                        new Container(
                                          height: 16.0,
                                        ),
                                      ],
                                    ),
                                    new Container(
                                      height: 50.0,
                                      child: data[index]["source"]["name"] ==
                                          null
                                          ? new Text("Anonymous")
                                          : new Container(
                                          child: new Text(
                                              data[index]["source"]["name"],
                                              style
                                                  : TextStyle(
                                                  fontStyle: FontStyle.italic,
                                                  fontSize: 18.0,
                                                  fontFamily: 'Raleway'
                                              ),
                                              textAlign: TextAlign.center)),
                                    ),
                                  ],
                                )

                            ),
                          ),
                          new Container(
                            height: 16.0,
                          ),

                        ]
                    )

                );
              }
          )),
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
                }
                ),
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

        )
    );
  }
}