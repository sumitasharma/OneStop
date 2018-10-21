import 'package:flutter/material.dart';
import 'package:flutter_news_app/EventsPage.dart';

class EventsTabsAddress extends StatefulWidget {

  final String add;
  const EventsTabsAddress({Key key, this.add}) : super(key: key);

  @override
  EventsPageAddressState createState() => new EventsPageAddressState();
}

class EventsPageAddressState extends State<EventsTabsAddress> {

  String _tokenKey = "";
  String _urlStringEvents = "https://www.eventbriteapi.com/v3/events/search/?";
  Icon actionIcon = new Icon(Icons.search);
  Widget appBarTitle;
  final TextEditingController _searchQuery = new TextEditingController();

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    this.appBarTitle = new Text("Events near " + widget.add);
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        debugShowCheckedModeBanner: false,
        home: DefaultTabController(
          length: 11,
          child: Scaffold(
            appBar: AppBar(
              centerTitle: true,
              title: appBarTitle,
              actions: <Widget>[
                new IconButton(icon: actionIcon, onPressed: () {
                  setState(() {
                    if (this.actionIcon.icon == Icons.search) {
                      this.actionIcon = new Icon(Icons.close);
                      this.appBarTitle = new TextField(
                        controller: _searchQuery,
                        style: new TextStyle(
                          color: Colors.white,
                        ),
                        decoration: new InputDecoration(
                            prefixIcon: new Icon(
                                Icons.search, color: Colors.white),
                            hintText: "Search...",
                            hintStyle: new TextStyle(color: Colors.white)
                        ),
                        onSubmitted: (String str) {
                          setState(() {
                            Navigator.push(
                                context,
                                MaterialPageRoute(builder: (context) =>
                                new EventsTabsAddress(add: str))
                            );
                          }
                          );
                        },
                      );
                    }
                    else {
                      this.actionIcon = new Icon(Icons.search);
                      this.appBarTitle = new Text("Events near " + widget.add);
                    }
                  });
                },),
              ],
              leading: new IconButton(
                  icon: new Icon(Icons.arrow_back),
                  onPressed: () {
                    Navigator.pop(context, true);
                  }),
              bottom: new TabBar(isScrollable: true,
                tabs: <Widget>[

                  new Tab(text: "Free Events"),
                  new Tab(text: "Music"),
                  new Tab(text: "Family & Education"),
                  new Tab(text: "Business & Professional"),
                  new Tab(text: "Science & Technology"),
                  new Tab(text: "Sports & Fitness"),
                  new Tab(text: "Health & Wellness",),
                  new Tab(text: "Travel & Outdoor",),
                  new Tab(text: "Film, Media & Entertainment",),
                  new Tab(text: "Charity & Causes",),
                  new Tab(text: "School Activities",)
                ],
              ),
            ),
            body: TabBarView(
              children: [
                new HomePage(
                    url: _urlStringEvents + "q=free&location.address=" +
                      widget.add + "&token=" +
                        _tokenKey),
                new HomePage(
                    url: _urlStringEvents + "q=music&location.address=" +
                        widget.add + "&token=" +
                        _tokenKey),
                new HomePage(
                    url: _urlStringEvents +
                        "q=family education&location.address=" + widget.add +
                        "&token=" +
                        _tokenKey),
                new HomePage(
                    url: _urlStringEvents +
                        "q=business&location.address=" + widget.add +
                        "&token=" +
                        _tokenKey),
                new HomePage(
                    url: _urlStringEvents +
                        "q=science+technology&location.address=" + widget.add +
                        "&token=" +
                        _tokenKey),
                new HomePage(
                    url: _urlStringEvents +
                        "q=sports&location.address=" + widget.add + "&token=" +
                        _tokenKey),
                new HomePage(
                    url: _urlStringEvents +
                        "q=health&location.address=" + widget.add + "&token=" +
                        _tokenKey),
                new HomePage(
                    url: _urlStringEvents +
                        "q=travel&location.address=" + widget.add + "&token=" +
                        _tokenKey),
                new HomePage(
                    url: _urlStringEvents +
                        "q=film+media+entertainment&location.address=" +
                        widget.add + "&token=" +
                        _tokenKey),
                new HomePage(
                    url: _urlStringEvents +
                        "q=charity+causes&location.address=" + widget.add +
                        "&token=" +
                        _tokenKey),
                new HomePage(
                    url: _urlStringEvents +
                        "q=school+activities&location.address=" + widget.add +
                        "&token=" +
                        _tokenKey)
              ],
            ),

          ),
        )

    );
  }
}





