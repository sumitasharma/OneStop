import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';

class DetailNews extends StatelessWidget {
  final String _url;

  DetailNews([this._url]);

  @override
  Widget build(BuildContext context) {
    Navigator.pop(context, true);
    return Scaffold(
        appBar: AppBar(
          title: Text("News Deatils"),
        ),
        body: _launchURL(_url)
    );
  }

  _launchURL(url) async {
    if (await canLaunch(url)) {
      await launch(url);
    } else {
      throw 'Could not launch $url';
    }
  }

}