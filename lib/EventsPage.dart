import 'dart:async';
import 'dart:convert' show json;

import 'package:connectivity/connectivity.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_webview_plugin/flutter_webview_plugin.dart';
import 'package:http/http.dart' as http;
import 'package:intl/intl.dart';

class HomePage extends StatefulWidget {

  final String url;

  const HomePage({Key key, this.url}) : super(key: key);

  @override
  HomePageState createState() => new HomePageState();
}

class HomePageState extends State<HomePage> {
  final GlobalKey<ScaffoldState> _scaffoldKey = new GlobalKey<ScaffoldState>();
  List data;
  DateFormat format = new DateFormat("EEE, dd MMM yyyy hh:mm a zzz");
  Future<String> getData() async {
    try {
      var response = await http.get(widget.url);
      this.setState(() {
        print(widget.url);
        Map decoded = json.decode(response.body);
        print('Response : ' + response.body);
        data = decoded["events"];
        print("Data :" + data[0]["name"]["text"]);
      });
      return "Success!";
    }
    catch (e) {
      try {
        Scaffold.of(context).showSnackBar(new SnackBar(
            content: new Text(
                "Check and allow the Internet connection / No events found here. Search another location."),
            backgroundColor: Colors.blueAccent));
      }
      catch (e) {
        return "No Internet";
      }


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
    return new Scaffold(
      key: _scaffoldKey,
      body:

      data == null
          ? Center(child: CircularProgressIndicator())
          : new Container(
          child: new ListView.builder(
              padding: EdgeInsets.all(8.0),
              itemCount: data == null ? 0 : data.length,
              itemBuilder: (BuildContext context, int index) {
                return new Card(
                    margin: EdgeInsets.only(
                        left: 4.0, right: 4.0, bottom: 16.0),
                    shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(15.0)),
                    elevation: 4.0,
                    child:
                    new Column(
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
                                          (data[index]['url']),
                                            appBar: new AppBar(title: new Text(
                                              data[index]["name"]["text"],
                                              style: new TextStyle(
                                                fontWeight: FontWeight.bold,
                                                fontFamily: 'Raleway',
                                                fontSize: 22.0,
                                              ),),
                                              backgroundColor: Color.fromRGBO(
                                                  205, 92, 92, 50.0),
                                            ),
                                          )
                                      )
                                  ),
                              child: new Column(
                                children: <Widget>[

                                  new Container(
                                    height: 20.0,
                                  ),

                                  (data[index]["logo"] != null)
                                      ? new Container(
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
                                        maxHeight: 200.0,
                                        minHeight: 100.0,
                                        maxWidth: 400.0
                                    ),
                                  )
                                      : new Container(
                                      height: 200.0,
                                      decoration: new BoxDecoration(
                                        image: new DecorationImage(
                                            image: new AssetImage(
                                                'assets/events.jpg'),
                                            fit: BoxFit.fitWidth),
                                        borderRadius: new BorderRadius.all(
                                            new Radius.circular(16.0)),
                                      ),
                                    constraints: BoxConstraints(
                                        maxHeight: 200.0,
                                        minHeight: 100.0,
                                        maxWidth: 400.0
                                    ),
                                  ),
                                  new Container(
                                      height: 30.0),

                                  new Text(data[index]["name"]["text"],
                                    style: new TextStyle(
                                        fontWeight: FontWeight.bold,
                                        fontFamily: 'Raleway',
                                        fontSize: 20.0),),

                                  new Container(
                                    height: 20.0,
                                  ),
                                  new Row(
                                    crossAxisAlignment: CrossAxisAlignment
                                        .start,
                                    children: <Widget>[
                                      new Icon(Icons.date_range),
                                      new Container(
                                          margin: const EdgeInsets.only(
                                              left: 30.0),
                                          child: new Column(
                                            crossAxisAlignment: CrossAxisAlignment
                                                .start,
                                            children: <Widget>[
                                              data[index]["start"]["local"] ==
                                                  null
                                                  ? new Text("Start Date : ")
                                                  : new Container(
                                                child: new Text(month(DateTime
                                                    .parse(
                                                  data[index]["start"]["local"],)
                                                    .month
                                                    .toString()) + " " +
                                                    DateTime
                                                        .parse(
                                                        data[index]["start"]["local"])
                                                        .day
                                                        .toString() + " " +
                                                    DateTime
                                                        .parse(
                                                        data[index]["start"]["local"])
                                                        .year
                                                        .toString(),
                                                  style: TextStyle(
                                                    fontFamily: 'RobotoMono',
                                                    fontSize: 20.0,
                                                  ),
                                                ),
                                              ),
                                              new Container(
                                                height: 8.0,
                                              ),
                                              data[index]["start"]["local"] ==
                                                  null
                                                  ? new Text("Start Date : ")
                                                  : new Container(
                                                child: new Text(
                                                  "Time : " +
                                                      DateTime
                                                          .parse(
                                                          data[index]["start"]["local"])
                                                          .hour
                                                          .toString() + ":" +
                                                      DateTime
                                                          .parse(
                                                          data[index]["start"]["local"])
                                                          .minute
                                                          .toString() + " to " +
                                                      DateTime
                                                          .parse(
                                                          data[index]["end"]["local"])
                                                          .hour
                                                          .toString() + ":" +
                                                      DateTime
                                                          .parse(
                                                          data[index]["end"]["local"])
                                                          .minute
                                                          .toString(),
                                                  style: TextStyle(
                                                    fontFamily: 'RobotoMono',
                                                    fontSize: 20.0,
                                                  ),
                                                ),
                                              ),
                                              new Container(
                                                height: 8.0,
                                              ),
                                              data[index]["venue"] == null
                                                  ? new Text("")
                                                  : new Container(
                                                  height: 100.0,
                                                  child: new Text(
                                                      data[index]["venue"],
                                                      style: TextStyle(
                                                          fontStyle: FontStyle
                                                              .normal,
                                                          fontSize: 16.0))
                                              ),
                                            ],
                                          )
                                      )
                                    ],

                                  ),
                                ],
                              ),

                            ),

                          ),
                        ]
                    )
                );
              }
          )
      ),

    );
  }

  String month(String month) {
    String _month;
    switch (month) {
      case '1':
        _month = "Januray";
        break;
      case '2':
        _month = "Febrary";
        break;
      case '3':
        _month = "March";
        break;
      case '4':
        _month = "April";
        break;
      case '5':
        _month = "May";
        break;
      case '6':
        _month = "June";
        break;
      case '7':
        _month = "July";
        break;
      case '8':
        _month = "August";
        break;
      case '9':
        _month = "September";
        break;
      case '10':
        _month = "October";
        break;
      case '11':
        _month = "November";
        break;
      case '12':
        _month = "December";
        break;
    }
    return _month;
  }
}
