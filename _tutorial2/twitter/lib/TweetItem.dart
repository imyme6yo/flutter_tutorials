import 'package:flutter/material.dart';

import 'package:font_awesome_flutter/font_awesome_flutter.dart';

import 'TweetModel.dart';

class TweetItem extends StatelessWidget {
  final TweetModel tweet;
  
  TweetItem(this.tweet);
  @override
  Widget build(BuildContext context) {
    return Container(
      child: Column(
        children: <Widget>[
          Padding(
            padding: EdgeInsets.all(
              4.0
            ),
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                Padding(
                  padding: EdgeInsets.all(
                    8.0
                  ),
                  child: Icon(
                    Icons.account_circle,
                    size: 60.0,
                    color: Colors.grey
                  )
                ),
                Expanded(
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: <Widget>[
                      Padding(
                        padding: EdgeInsets.only(
                          top: 4.0
                        ),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: <Widget>[
                            Expanded(
                              child: Container(
                                child: RichText(
                                  overflow: TextOverflow.ellipsis,
                                  text: TextSpan(
                                    children: [
                                      TextSpan(
                                        text: tweet.username,
                                        style: TextStyle(
                                          fontWeight: FontWeight.w600,
                                          fontSize: 18.0,
                                          color: Colors.black
                                        )
                                      ),
                                      TextSpan(
                                        text: " " + tweet.twitterHandle,
                                        style: TextStyle(
                                          fontSize: 16.0,
                                          color: Colors.grey
                                        )
                                      )
                                    ]
                                  )
                                )
                              )
                            ),
                            Expanded(
                              flex: 1,
                              child: Padding(
                                padding: EdgeInsets.only(
                                  right: 4.0
                                ),
                                child: Icon(
                                  Icons.expand_more,
                                  color: Colors.grey
                                )
                              )
                            )
                          ]
                        )
                      ),
                      Padding(
                        padding: EdgeInsets.symmetric(
                          vertical: 4.0
                        ),
                        child: Text(
                          tweet.tweet,
                          style: TextStyle(
                            fontSize: 18.0
                          )
                        )
                      ),
                      Padding(
                        padding: EdgeInsets.all(8.0),
                        child: Row(
                          mainAxisAlignment:  MainAxisAlignment.spaceEvenly,
                          children: <Widget>[
                            Icon(
                              FontAwesomeIcons.comment,
                              color: Colors.grey
                            ),
                            Icon(
                              FontAwesomeIcons.retweet,
                              color: Colors.grey
                            ),
                            Icon(
                              FontAwesomeIcons.heart,
                              color: Colors.grey
                            ),
                            Icon(
                              FontAwesomeIcons.comment,
                              color: Colors.grey
                            )
                          ],
                        )
                      )
                    ],
                  )
                ),
              ],
            )
          ),
          Divider()
        ],
      )
    );
  }
}