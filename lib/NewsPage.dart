import 'dart:async';
import 'dart:convert' show json;

import 'package:connectivity/connectivity.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_webview_plugin/flutter_webview_plugin.dart';
import 'package:http/http.dart' as http;

class HomePage extends StatefulWidget {

  final String url;
  const HomePage({Key key, this.url}) : super(key: key);

  @override
  HomePageState createState() => new HomePageState();
}

class HomePageState extends State<HomePage> {

  final GlobalKey<ScaffoldState> _scaffoldKey = new GlobalKey<ScaffoldState>();
  List data;

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
      _scaffoldKey.currentState.showSnackBar(new SnackBar(
        content: new Text("Kindly Check the Internet Connection"),
        backgroundColor: Colors.red,));
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
      key: _scaffoldKey,
      body:
      data == null
          ? Center(child: CircularProgressIndicator())
          : new Container(child: new ListView.builder(
          padding: EdgeInsets.all(8.0),
          itemCount: data == null ? 0 : data.length,
          itemBuilder: (BuildContext context, int index) {
            return new Card(
                margin: EdgeInsets.only(left: 4.0, right: 4.0, bottom: 16.0),
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
                              Navigator.of(context, rootNavigator: true).push(
                                  new CupertinoPageRoute<bool>(
                                      fullscreenDialog: false,
                                      builder: (BuildContext context) =>
                                      new WebviewScaffold(url:
                                  (data[index]["url"]),
                                    appBar: new AppBar(title: new Text(
                                        data[index]["title"]),
                                        backgroundColor: Colors.blue
                                    ),
                                      ))
                              ),
                          child: new Wrap(
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
                                // height: 100.0,
                                  child: new Text(data[index]["title"],
                                      style: TextStyle(
                                          fontWeight: FontWeight.bold,
                                          fontStyle: FontStyle.normal,
                                          fontSize: 24.0
                                      ),
                                      textAlign: TextAlign.left)),

                              new Container(
                                height: 16.0,
                              ),

                              data[index]["description"] == null
                                  ? new Text("")
                                  : new Container(
                                // height: 100.0,
                                  child: new Text(data[index]["description"],
                                      style: TextStyle(
                                          fontStyle: FontStyle.normal,
                                          fontSize: 16.0))
                              ),
                              new Container(
                                height: 16.0,
                              ),
                              data[index]["source"]["name"] == null
                                  ? new Text("")
                                  : new Container(
                                  height: 20.0,
                                  child: new Text(
                                      data[index]["source"]["name"],
                                      style
                                          : TextStyle(
                                        fontWeight: FontWeight.bold,
                                        fontStyle: FontStyle.italic,
                                        color: Colors.lightGreen,
                                      ),
                                      textAlign: TextAlign.center)),

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
      )
      ),
    );
  }
}