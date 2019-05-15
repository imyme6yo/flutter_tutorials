import 'package:flutter/material.dart';

import 'package:flutter_app/models/RecordModel.dart';

import 'package:flutter_app/services/URLLauncher.dart';

class DetailPage extends StatelessWidget {
  final RecordModel record;

  DetailPage({this.record});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          record.name
        ),
      ),
      body: ListView(
        children: <Widget>[
          Hero(
            tag: "avatar_" + record.name,
            child: Image.network(record.photo)
          ),
          GestureDetector(
            onTap: (){
              URLLauncher().launchURL(record.url);
            },
            child: Container(
              padding: EdgeInsets.all(32.0),
              child: Row(
                children: <Widget>[
                  Expanded(
                    child: Column(
                    crossAxisAlignment:  CrossAxisAlignment.start,
                      children: <Widget>[
                        Container(
                          padding: EdgeInsets.only(
                            bottom: 8.0
                          ),
                          child: Text(
                            "Name: " + record.name,
                            style: TextStyle(
                              fontWeight: FontWeight.bold
                            )
                          )
                        ),
                        Text(
                          "Address: " + record.address,
                          style: TextStyle(
                            color: Colors.grey[500]
                          )
                        )
                      ],
                    )
                  ),
                  Icon(
                    Icons.phone,
                    color: Colors.red[500]
                  ),
                  Text(
                    ' ${record.contact}'
                  )
                ]
              )
            )
          )        
        ],
      )
    );
  }
}