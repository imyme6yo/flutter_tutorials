import 'package:flutter/material.dart';

const String _name = "Anonymous";

class ChatMessage extends StatelessWidget {
  final String text;

  ChatMessage({this.text});

  @override
  Widget build(BuildContext context){
    return Container(
      margin: EdgeInsets.symmetric(vertical: 10.0),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget> [
          Container(
            margin: EdgeInsets.only(right: 16.0),
            child: CircleAvatar(
              child: Image.network("http://res.cloudinary.com/kennyy/image/upload/v1531317427/avatar_z1rc6f.png")
            )
          ),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget> [
              Text(
                _name,
                style: Theme.of(context).textTheme.subhead
              ),
              Container(
                margin: EdgeInsets.only(top: 5.0),
                child: Text(text)
              )
            ]
          )
        ]
      )
    );
  }

}