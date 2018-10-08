import 'dart:async';
import 'dart:convert' show json;

import 'package:connectivity/connectivity.dart';
import 'package:flutter/material.dart';
import 'package:flutter_news_app/NewsTabs.dart';
import 'package:flutter_webview_plugin/flutter_webview_plugin.dart';
import 'package:http/http.dart' as http;

import 'PodcastTabs.dart';



class HomePage extends StatefulWidget {

  final String url;

  const HomePage({Key key, this.url}) : super(key: key);

  @override
  HomePageState createState() => new HomePageState();
}

class HomePageState extends State<HomePage> {

  List data;
  int _currentIndex = 0;

  //Map<int, List> _saved = new Map();

  Future<String> getData() async {
    try {
      var response = await http.get(widget.url);
      this.setState(() {
        print(widget.url);
        Map decoded = json.decode(response.body);
        data = decoded['events'];
      });
      return "Success!";
    }
    catch (e) {
      return "No Internet";
      //return new SnackBar(content: new Text("No Internet Connectivity"),duration: ,new Duration(seconds: 5));
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
    return new Scaffold(
      body: new Container(child: new ListView.builder(
          padding: EdgeInsets.all(8.0),
          itemCount: data == null ? 0 : data.length,
          itemBuilder: (BuildContext context, int index) {
            return new Card(
                margin: EdgeInsets.only(left: 8.0, right: 8.0, bottom: 16.0),
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
                              Navigator.push(
                                  context,
                                  MaterialPageRoute(builder: (context) =>
                                  new WebviewScaffold(url:
                                  (data[index]['url']),
                                    appBar: new AppBar(title: new Text(
                                        data[index]["name"]["text"])),
                                  ))
                              ),
                          child: new Wrap(
                            spacing: 8.0,
                            // gap between adjacent chips
                            runSpacing: 4.0,
                            // gap between lines
                            direction: Axis.horizontal,
                            // main axis (rows or columns)

                            children: <Widget>[
                              new Container(
                                  height: 16.0),

                              new Text(data[index]["name"]["text"],
                                style: new TextStyle(
                                    fontWeight: FontWeight.bold),),

                              data[index]["logo"]["url"] == null
                                  ? new Container(
                                  height: 250.0,
                                  decoration: new BoxDecoration(
                                    image: new DecorationImage(
                                        image: new AssetImage(
                                            'assets/events.jpg'),
                                        fit: BoxFit.fitWidth),
                                    borderRadius: new BorderRadius.all(
                                        new Radius.circular(16.0)),
                                    border: new Border.all(
                                      color: Colors.pinkAccent,
                                      width: 2.0,
                                    ),
                                  ))

                                  : new Container(
//                                    height: 250.0,
                                decoration: new BoxDecoration(
                                  image: new DecorationImage(
                                    image: new NetworkImage(
                                        data[index]["logo"]["url"]),
                                    fit: BoxFit.fill,
                                  ),
                                  borderRadius: new BorderRadius.all(
                                      new Radius.circular(16.0)),
                                ),
                                constraints: BoxConstraints(
                                    maxHeight: 250.0,
                                    minHeight: 100.0,
                                    minWidth: 300.0
                                ),
                              ),

                              new Container(
                                height: 16.0,
                              ),

                              data[index]["start"]["local"] == null
                                  ? new Text("Start Date : ")
                                  : new Container(
                                // height: 300.0,
                                  child: new Text("Start Date : " +
                                      DateTime
                                          .parse(data[index]["start"]["local"])
                                          .day
                                          .toString() + " " +
                                      DateTime
                                          .parse(data[index]["start"]["local"])
                                          .month
                                          .toString() + "/" +
                                      DateTime
                                          .parse(data[index]["start"]["local"])
                                          .year
                                          .toString() + "   Time : " +
                                      DateTime
                                          .parse(data[index]["start"]["local"])
                                          .hour
                                          .toString() + ":" +
                                      DateTime
                                          .parse(data[index]["start"]["local"])
                                          .minute
                                          .toString() + " to " +
                                      DateTime
                                          .parse(data[index]["end"]["local"])
                                          .hour
                                          .toString() + ":" +
                                      DateTime
                                          .parse(data[index]["end"]["local"])
                                          .minute
                                          .toString(),
                                      style: TextStyle(
                                          fontWeight: FontWeight.bold,
                                          fontStyle: FontStyle.normal,
                                      ),
                                      textAlign: TextAlign.left)),
//                              data[index]["end"]["local"] == null
//                                  ? new Text("End Date : ")
//                                  : new Container(
//                                // height: 300.0,
//                                  child: new Text("End Date   : " +
//                                      DateTime
//                                          .parse(data[index]["end"]["local"])
//                                          .day
//                                          .toString() + "/" +
//                                      DateTime
//                                          .parse(data[index]["end"]["local"])
//                                          .month
//                                          .toString() + "/" +
//                                      DateTime
//                                          .parse(data[index]["end"]["local"])
//                                          .year
//                                          .toString() + "   Time : " +
//                                      DateTime
//                                          .parse(data[index]["end"]["local"])
//                                          .hour
//                                          .toString() + ":" +
//                                      DateTime
//                                          .parse(data[index]["end"]["local"])
//                                          .minute
//                                          .toString(),
//                                      style: TextStyle(
//                                        fontWeight: FontWeight.bold,
//                                        fontStyle: FontStyle.normal,
//                                      ),
//                                      textAlign: TextAlign.left)),

                              data[index]["venue"] == null
                                  ? new Text("")
                                  : new Container(
                                  height: 100.0,
                                  child: new Text(data[index]["venue"],
                                      style: TextStyle(
                                          fontStyle: FontStyle.normal))
                              ),

                              data[index]["status"] == null
                                  ? new Text("")
                                  : new Container(
                                  height: 20.0,
                                  child: new Text(
                                      data[index]["status"],
                                      style
                                          : TextStyle(
                                        fontWeight: FontWeight.bold,
                                        fontStyle: FontStyle.italic,
                                        color: Colors.lightGreen,
                                      ),
                                      textAlign: TextAlign.end)),

                            ],

                          ),

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
                  null;
                  break;
                case 1:
                  print("In the newstabs");
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => NewsTabs()),
                  );
                  break;
                case 2:
                  print("In the newstabs");
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => PodcastTabs()),
                  );
                  break;
              }
              print(_currentIndex);
            }),
        items: [
          BottomNavigationBarItem(
              icon: new Icon(Icons.search),
              title: new Text('Search'),
              backgroundColor: Colors.blue

          ),

          BottomNavigationBarItem(
              icon: new Icon(Icons.book),
              title: new Text('News'),
              backgroundColor: Colors.blue
          ),
          BottomNavigationBarItem(
              icon: Icon(Icons.headset),
              title: Text('Podcast'),
              backgroundColor: Colors.blue

          ),
        ],
      ),

    );
  }

  void _navigatePage(context, index) {

  }
}