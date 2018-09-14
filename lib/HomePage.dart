import 'dart:async';
import 'dart:convert' show json;

import 'package:flutter/material.dart';
import 'package:flutter_news_app/DetailNews.dart';
import 'package:http/http.dart' as http;

class HomePage extends StatefulWidget {

  final String url;

  const HomePage({Key key, this.url}) : super(key: key);

  @override
  HomePageState createState() => new HomePageState();
}

class HomePageState extends State<HomePage> {

  List data;

  Future<String> getData() async {
    var response = await http.get(widget.url);
    print("hello");

    print(response.body);
    this.setState(() {
      Map decoded = json.decode(response.body);

      String name = decoded['status'];
      print(name);
      data = decoded['articles'];
    });
    print(data[1]["urlToImage"]);
    return "Success!";
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
                elevation: 4.0,
                child: new InkWell(
                    onTap: () =>
                        Navigator.push(
                          context,
                          MaterialPageRoute(builder: (context) =>
                              DetailNews(data[index]["url"])),
                        ),
                    child: new Wrap(
                        spacing: 8.0,
                        // gap between adjacent chips
                        runSpacing: 4.0,
                        // gap between lines
                        direction: Axis.horizontal,
                        // main axis (rows or columns)

                        children: <Widget>[

                          data[index]["source"]["name"] == null
                              ? new Text("")
                              : new Text(data[index]["source"]["name"],
                              textAlign: TextAlign.center,
                              style: TextStyle(fontWeight: FontWeight.bold)),

                          data[index]["urlToImage"] == null
                              ? new Image.network(
                              " https://static01.nyt.com/images/2018/09/08/business/08dc-trade/08dc-trade-facebookJumbo.jpg")
                              : new Image.network(
                            data[index]["urlToImage"],),
                          new Column(
                            children: <Widget>[

                              data[index]["title"] == null
                                  ? new Text("Missing Title")
                                  : new Text(data[index]["title"],
                                textAlign: TextAlign.center,),

                              data[index]["description"] == null
                                  ? new Text("")
                                  : new Text(data[index]["description"],
                                textAlign: TextAlign.center,),
                            ],
                          )
                        ]
                    )
                ));
          },
        )
        )
    );
  }
}