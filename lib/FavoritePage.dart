//import 'package:flutter/material.dart';
//import 'package:flutter_webview_plugin/flutter_webview_plugin.dart';
//import 'package:http/http.dart' as http;
//
//
//class FavoritePage extends StatelessWidget {
//  final List saveFavorite;
//
//  FavoritePage({this.saveFavorite});
//
//
//  @override
//  Widget build(BuildContext context) {
//    return new Scaffold(
//        body: new Container(child: new ListView.builder(
//            padding: EdgeInsets.all(8.0),
//            itemCount: saveFavorite == null ? 0 : saveFavorite.length,
//            itemBuilder: (BuildContext context, int index) {
//              Navigator.of(context).push(
//                  new MaterialPageRoute<void>(
//                  builder: (BuildContext context)
//              {
//                return new Card(
//                    margin: EdgeInsets.only(
//                        left: 8.0, right: 8.0, bottom: 16.0),
//                    shape: RoundedRectangleBorder(
//                        borderRadius: BorderRadius.circular(15.0)),
//                    elevation: 4.0,
//                    child: new Column(
//                        children: <Widget>[
//                          new Container(
//                            padding: new EdgeInsets.only(
//                                left: 16.0, right: 16.0, bottom: 8.0),
//                            child: new InkWell(
//                              onTap: () =>
//                                  Navigator.push(
//                                      context,
//                                      MaterialPageRoute(builder: (context) =>
//                                      new WebviewScaffold(url:
//                                      (saveFavorite[index]["url"]),
//                                        appBar: new AppBar(title: new Text(
//                                            data[index]["title"])),
//                                      ))
//                                  ),
//                              child: new Wrap(
//                                spacing: 8.0,
//                                // gap between adjacent chips
//                                runSpacing: 4.0,
//                                // gap between lines
//                                direction: Axis.horizontal,
//                                // main axis (rows or columns)
//
//                                children: <Widget>[
//                                  new Container(
//                                      height: 16.0),
//
//                                  data[index]["urlToImage"] == null
//                                      ? new Container(
//                                      width: 400.0,
//                                      height: 300.0,
//                                      decoration: new BoxDecoration(
//                                        image: new DecorationImage(
//                                            image: new AssetImage(
//                                                'assets/news.jpg'),
//                                            fit: BoxFit.fitWidth),
//                                        borderRadius: new BorderRadius.all(
//                                            new Radius.circular(16.0)),
//                                        border: new Border.all(
//                                          color: Colors.pinkAccent,
//                                          width: 4.0,
//                                        ),
//                                      ))
//
//                                      : new Container(
//                                      width: 400.0,
//                                      height: 300.0,
//                                      decoration: new BoxDecoration(
//                                        image: new DecorationImage(
//                                          image: new NetworkImage(
//                                              data[index]["urlToImage"]),
//                                          fit: BoxFit.fill,
//                                        ),
//                                        borderRadius: new BorderRadius.all(
//                                            new Radius.circular(16.0)),
//                                      )),
//
//                                  new Container(
//                                    height: 20.0,
//                                  ),
//
//                                  data[index]["title"] == null
//                                      ? new Text("Missing Title")
//                                      : new Container(
//                                      height: 80.0,
//                                      child: new Text(data[index]["title"],
//                                          style: TextStyle(
//                                              fontWeight: FontWeight.bold,
//                                              fontStyle: FontStyle.normal,
//                                              fontSize: 16.0
//                                          ),
//                                          textAlign: TextAlign.left)),
//
//                                  data[index]["description"] == null
//                                      ? new Text("")
//                                      : new Container(
//                                      height: 100.0,
//                                      child: new Text(
//                                          data[index]["description"],
//                                          style: TextStyle(
//                                              fontStyle: FontStyle.normal))
//                                  ),
//                                  data[index]["source"]["name"] == null
//                                      ? new Text("")
//                                      : new Container(
//                                      height: 20.0,
//                                      child: new Text(
//                                          data[index]["source"]["name"],
//                                          style
//                                              : TextStyle(
//                                            fontWeight: FontWeight.bold,
//                                            fontStyle: FontStyle.italic,
//                                            color: Colors.lightGreen,
//                                          ),
//                                          textAlign: TextAlign.center)
//                                  ),
//                                ],
//                              ),
//                            ),
//                          ),
//                          new Container(
//                            height: 16.0,
//                          )
//                        ]
//                    )
//                );
//              }
//              )
//              ,
//              );
//            }
//        )
//        )
//    );
//  }
//}