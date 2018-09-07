import 'package:flutter/material.dart';
import 'package:flutter_news_app/Articles.dart';

class NewsList extends StatelessWidget {

  final List<Articles> articles;

  NewsList({Key key, this.articles}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return _buildList(context);
  }

  ListView _buildList(context) {
    return new ListView.builder(
        itemCount: articles.length,
        itemBuilder: (context, int) {
          return new Text(articles[int].title);
          //return new NewsCard(articles[int]);
        }
    );
  }
}