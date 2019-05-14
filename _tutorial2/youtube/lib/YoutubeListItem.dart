import 'package:flutter/material.dart';

import 'HomePage.dart';

class YoutubeListItem extends StatelessWidget{
  final int index;

  YoutubeListItem(this.index);
  
  @override
  Widget build( BuildContext context ){
    return Column(
      children: <Widget>[
        Row(
          children: <Widget>[
            Expanded(
              child:  Image.asset(
                videos[index].imagePath,
                fit: BoxFit.cover
              ),
            ),
          ],
        ),
        Padding(
          padding: EdgeInsets.all(
            12.0
          ),
          child: Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              Expanded(
                child: Icon(
                  Icons.account_circle,
                  size: 40.0
                ),
                flex: 2
              ),
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: <Widget>[
                    Padding(
                      padding: EdgeInsets.only(
                        bottom: 4.0
                      ),
                      child: Text(
                        videos[index].title,
                        style: TextStyle(
                          fontSize: 18.0
                        ),
                      )
                    ),
                    Text(
                      videos[index].publisher,
                      style: TextStyle(
                        color: Colors.black54
                      )
                    )
                  ],
                ),
                flex: 9
              ),
              Expanded(
                child: Icon(
                  Icons.more_vert
                ),
                flex: 1
              )
            ],
          )
        )
      ],
    );
  }
}