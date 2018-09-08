import 'dart:async';
import 'dart:convert' show json;

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:url_launcher/url_launcher.dart';

void main() {
  runApp(new MaterialApp(
    home: new HomePage(),
  ));
}

class HomePage extends StatefulWidget {
  @override
  HomePageState createState() => new HomePageState();
}

class HomePageState extends State<HomePage> {

  List data;

  Future<String> getData() async {
    var response = await http.get(
        "https://newsapi.org/v2/top-headlines?country=us");
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
      appBar: new AppBar(
        title: new Text("Listviews"),
      ),
        body: new Container(child: new ListView.builder(
        itemCount: data == null ? 0 : data.length,
        itemBuilder: (BuildContext context, int index) {
          return new Card(
              child: new InkWell(
                  onTap: () =>
                  //_launchURL(data[index]["url"]),
                  Navigator.of(context).push(new MaterialPageRoute(
                      builder: (BuildContext context) => new SecondScreen(
                          data[index]["url"]))),
                  child: new Column(
                    children: <Widget>[
                      data[index]["source"]["name"] == null
                          ? new Text("")
                          : new Text(data[index]["source"]["name"]),
                      data[index]["title"] == null
                          ? new Text("Missing Title")
                          : new Text(data[index]["title"]),
                      data[index]["urlToImage"] == null
                          ? new Image.network(
                          " https://static01.nyt.com/images/2018/09/08/business/08dc-trade/08dc-trade-facebookJumbo.jpg")
                          : new Image.network(data[index]["urlToImage"]),
                      data[index]["description"] == null
                          ? new Text("")
                          : new Text(data[index]["description"]),
                      // new FlatButton(onPressed: null, child: null)

                    ],
                  )
              )
          );
        },
        )
        )
    );
  }
}


class SecondScreen extends StatelessWidget {
  final String _url;

  SecondScreen([this._url]);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text("Second Screen"),
        ),
        body: _launchURL(_url)
    );
  }

  _launchURL(url) async {
    //const url = url;
    if (await canLaunch(url)) {
      await launch(url);
    } else {
      throw 'Could not launch $url';
    }
  }

}

