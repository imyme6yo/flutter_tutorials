import 'package:flutter/material.dart';

import 'TweetModel.dart';
import 'TweetItem.dart';

class HomePage extends StatefulWidget {
  HomePage({Key key}) : super(key: key);

  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  var tweets = [
    TweetModel("Google Devs", "@GoogleDevsIndia", "3m", "Inviting computer science students to register for the latest event in computer technology."),
    TweetModel("Java", "@java", "5m", "Developing a large, complex app that needs a microservice architecture? @crichardson. Read on to learn how to  decompose an application into services "),
    TweetModel("Android Authority", "@AndroidAuth", "30m", "The Samsung Galaxy S9 is in the record books now, but it's not likely that Samsung will be celebrating this particular milestone. https://www.androidauthority.com/samsung-galaxy-s9-history-887809/ … #samsung #samsunggalaxys9 by: C. Scott Brown"),
    TweetModel("Google Devs India", "@GoogleDevsIndia", "3m", "Inviting computer science students to register for the latest event in computer technology."),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor:  Colors.white,
        title: Text(
          'Home',
          style: TextStyle(
            color: Colors.black
          )
        ),
        leading: Icon(
          Icons.account_circle,
          color: Colors.grey,
          size: 35.0
        )
      ),
      body: ListView.builder(
        itemCount: tweets.length,
        itemBuilder: (BuildContext context, int index) {
          return TweetItem(tweets[index]);
        },
      ),
    );
  }
}