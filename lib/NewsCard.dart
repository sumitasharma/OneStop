import 'package:flutter/material.dart';
import 'package:flutter_news_app/Articles.dart';

class NewsCard extends StatefulWidget {

  Articles article;

  NewsCard(this.article);

  @override
  State<StatefulWidget> createState() {
    new Card(
      child: new Column(
        mainAxisSize: MainAxisSize.min,
        children: <Widget>[
          const ListTile(
            leading: const Icon(Icons.album),
            title: const Text('The Enchanted Nightingale'),
            subtitle: const Text(
                'Music by Julie Gable. Lyrics by Sidney Stein.'),
          ),
          new ButtonTheme
              .bar( // make buttons use the appropriate styles for cards
            child: new ButtonBar(
              children: <Widget>[
                new FlatButton(
                  child: const Text('BUY TICKETS'),
                  onPressed: () {
                    /* ... */
                  },
                ),
                new FlatButton(
                  child: const Text('LISTEN'),
                  onPressed: () {
                    /* ... */
                  },
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}