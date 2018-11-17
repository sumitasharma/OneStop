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
        data = decoded['feeds'];
      });
      return "Success!";
    }
    catch (e) {
      try {
        _scaffoldKey.currentState.showSnackBar(new SnackBar(
            content: new Text("Kindly Check the Internet Connection"),
            backgroundColor: Colors.blueGrey));
      }
      catch (e) {
        return "error";
      }
      return "No Internet";
    }
  }

  bool isInternetConnectivity() {
    var connectivityResult = new Connectivity()
        .checkConnectivity(); 
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
      body: data == null
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
                                      (data[index]['feed']['url']),
                                        appBar: new AppBar(title: new Text(
                                          data[index]["feed"]["title"],
                                          style: new TextStyle(
                                            fontWeight: FontWeight.bold,
                                            fontFamily: 'Raleway',
                                            fontSize: 22.0,
                                          ),),
                                            backgroundColor: Color.fromRGBO(
                                                128, 0, 128, 50.0)
                                        ),
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
                              new Row(
                                  mainAxisAlignment: MainAxisAlignment
                                      .spaceBetween,
                                  children: <Widget>[
                                    new Container(
                                      margin: const EdgeInsets.only(left: 30.0),
                                      child: new Center(
                                        child: new Text(
                                          data[index]['feed']["title"],
                                          style: new TextStyle(
                                            fontWeight: FontWeight.bold,
                                            fontFamily: 'DancingScriptOt',
                                            fontSize: 32.0,
                                          ),
                                          softWrap: true,),
                                      ),
                                      constraints: BoxConstraints(
                                          maxHeight: 200.0,
                                          minHeight: 200.0,
                                          maxWidth: 150.0
                                      ),
                                    ),
                                    (data[index]["feed"]["small_feed_image_url"] !=
                                        null &&
                                        data[index]["feed"]["small_feed_image_url"] !=
                                            "/assets/missing_small.png")
                                        ? new Container(
                                      decoration: new BoxDecoration(
                                        image: new DecorationImage(
                                          image: new NetworkImage(
                                              data[index]["feed"]["small_feed_image_url"]),
                                          fit: BoxFit.fill,
                                        ),
                                        borderRadius: new BorderRadius.all(
                                            new Radius.circular(16.0)),
                                      ),
                                      constraints: BoxConstraints(
                                          maxHeight: 200.0,
                                          minHeight: 150.0,
                                          minWidth: 150.0
                                      ),
                                    )
                                        : new Container(
                                      decoration: new BoxDecoration(
                                        image: new DecorationImage(
                                            image: new AssetImage(
                                                'assets/podcastImage.jpg'),
                                            fit: BoxFit.fill),
                                        borderRadius: new BorderRadius.all(
                                            new Radius.circular(16.0)),
                                      ),
                                      constraints: BoxConstraints(
                                          maxHeight: 200.0,
                                          minHeight: 150.0,
                                          minWidth: 150.0
                                      ),
                                    )

                                  ]
                              ),
                              new Container(
                                height: 50.0,
                              ),
                              new Divider(height: 20.0, color: Color.fromRGBO(
                                  128, 0, 128, 50.0)),
                              new Container(
                                height: 16.0,
                              ),
                              new Text(data[index]['feed']["description"],
                                style: new TextStyle(
                                    fontFamily: 'RobotoMono',
                                    fontSize: 20.0),),

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