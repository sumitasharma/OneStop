import 'package:flutter/material.dart';
import 'package:flutter_news_app/PodcastPage.dart';


class PodcastTabs extends StatefulWidget {
  @override
  PodcastPageState createState() => new PodcastPageState();
}

class PodcastPageState extends State<PodcastTabs> {

  String _podcastApi = "";
  String _urlStringPodcast = "http://api.digitalpodcast.com/v2r/search/?format=json&appid=";
  String _keyword = "&keywords=";
  String _search;


  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        debugShowCheckedModeBanner: false,
        home: DefaultTabController(
          length: 13,
          child: Scaffold(
            appBar: AppBar(
//              actions: <Widget>[
//                // overflow menu
//                PopupMenuButton<Choice>(
//                    itemBuilder: (BuildContext context) {
//                      return choices.map((Choice choice) {
//                        return PopupMenuItem<Choice>(
//                          value: choice,
//                          child: Text(choice.title),
//                        );
//                      }
//                      ).toList();
//                    },
//                    onSelected: (Choice result) {
//                      setState(() {
//                        //_search = result.title;
//                        _search = searchKeyword(result.title);
//                      });
//                    }
//                )
//              ],
              bottom: new TabBar(isScrollable: true,
                tabs: <Widget>[

                  new Tab(text: "Music"),
                  new Tab(text: "Business"),
                  new Tab(text: "Educational"),
                  new Tab(text: "Comedy"),
                  new Tab(text: "News & Politics",),
                  new Tab(text: "Science & Medicine"),
                  new Tab(text: "Sports"),
                  new Tab(text: "Technology & Gadgets",),
                  new Tab(text: "Television",),
                  new Tab(text: "Film & Entertainment",),
                  new Tab(text: "Charity & Causes",),
                  new Tab(text: "Religion & Spirituality",),
                  new Tab(text: "Arts",)
                ],
              ),
              // title: Text(_search),
            ),
            body: TabBarView(
              children: [
                new HomePage(
                    url: _urlStringPodcast + _podcastApi + _keyword + "music"),
                new HomePage(
                    url: _urlStringPodcast + _podcastApi + _keyword +
                        "business"),
                new HomePage(
                    url: _urlStringPodcast + _podcastApi + _keyword +
                        "educational"),
                new HomePage(
                    url: _urlStringPodcast + _podcastApi + _keyword + "comedy"),
                new HomePage(
                    url: _urlStringPodcast + _podcastApi + _keyword +
                        "news & politics"),
                new HomePage(
                    url: _urlStringPodcast + _podcastApi + _keyword +
                        "science & medicine"),
                new HomePage(
                    url: _urlStringPodcast + _podcastApi + _keyword + "sports"),
                new HomePage(
                    url: _urlStringPodcast + _podcastApi + _keyword +
                        "technology & gadgets"),
                new HomePage(
                    url: _urlStringPodcast + _podcastApi + _keyword +
                        "television"),
                new HomePage(
                    url: _urlStringPodcast + _podcastApi + _keyword +
                        "film & entertainment"),
                new HomePage(
                    url: _urlStringPodcast + _podcastApi + _keyword +
                        "charity & causes"),
                new HomePage(
                    url: _urlStringPodcast + _podcastApi + _keyword +
                        "religion & spirituality"),
                new HomePage(
                    url: _urlStringPodcast + _podcastApi + _keyword + "arts")
              ],
            ),

          ),
        )

    );
  }
}

String searchKeyword(String searchCode) {
  String _searchCode;
  switch (searchCode) {
    case 'Music':
      _searchCode = "music";
      break;
    case 'Business':
      _searchCode = "business";
      break;
    case 'Educational':
      _searchCode = "educational";
      break;
    case 'Comedy':
      _searchCode = "comedy";
      break;
    case 'News & Politics':
      _searchCode = "news & politics";
      break;
    case 'Science & Medicine':
      _searchCode = "science & medicine";
      break;
    case 'Sports':
      _searchCode = "sports";
      break;
    case 'Technology & Gadgets':
      _searchCode = "technology & gadgets";
      break;
    case 'Television':
      _searchCode = "television";
      break;
    case 'Film & Entertainment':
      _searchCode = "film & entertainment";
      break;
    case 'Charity & Causes':
      _searchCode = "charity & causes";
      break;
    case 'Religion & Spirituality':
      _searchCode = "religion & spirituality";
      break;
    case 'Arts':
      _searchCode = "arts";
      break;
  }
  return _searchCode;
}

//class Choice {
//  const Choice({this.title});
//
//  final String title;
//}
//
//const List<Choice> choices = const <Choice>[
//  const Choice(title: 'India'),
//  const Choice(title: 'USA'),
//  const Choice(title: 'China'),
//  const Choice(title: 'Australia'),
//  const Choice(title: 'Ireland'),
//  const Choice(title: 'Netherland'),
//  const Choice(title: 'Italy'),
//  const Choice(title: 'United Kingdom'),
//  const Choice(title: 'Japan'),
//  const Choice(title: 'Israel')
//];
//
//
//
//
//
