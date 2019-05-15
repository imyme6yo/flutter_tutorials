import 'package:flutter/material.dart';

class CustomDrawer extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          Container(
            child: Padding(
              padding: EdgeInsets.only(
                left: 32.0,
                top: 64.0,
                right: 32.0,
                bottom: 16.0
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  Icon(
                    Icons.account_circle,
                    size: 90.0
                  ),
                  Padding(
                    padding: EdgeInsets.all(8.0),
                    child: Text(
                      "John Doe",
                      style: TextStyle(
                        fontSize: 20.0
                      )
                    )
                  ),
                  Padding(
                    padding: EdgeInsets.all(8.0),
                    child: Text(
                      "See profil",
                      style: TextStyle(
                        color: Colors.black45
                      )
                    )
                  )
                ]
              )
            )
          ),
          Expanded(
            child: Container(
              color: Colors.black12,
              child: Padding(
                padding: EdgeInsets.only(
                  left: 40.0, 
                  top: 16.0, 
                  right: 40.0, 
                  bottom: 40.0
                ),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: <Widget>[
                    Padding(
                      padding: EdgeInsets.all(8.0),
                      child: Text(
                        "Home",
                        style: TextStyle(
                          fontSize: 18.0                    
                        )
                      )
                    ),
                    Padding(
                      padding: EdgeInsets.all(8.0),
                      child: Text(
                        "Audio",
                        style: TextStyle(
                          fontSize: 18.0
                        )
                      )
                    ),
                    Padding(
                      padding: EdgeInsets.all(8.0),
                      child: Text(
                        "BookMarks",
                        style: TextStyle(
                          fontSize: 18.0
                        )
                      )
                    ),
                    Padding(
                      padding: EdgeInsets.all(8.0),
                      child: Text(
                        "Interests",
                        style: TextStyle(
                          fontSize: 18.0
                        )
                      )
                    ),
                    Divider(),
                    Padding(
                      padding: EdgeInsets.all(8.0),
                      child: Text(
                        "Become a member",
                        style: TextStyle(
                          fontSize: 18.0,
                          color: Colors.teal
                        )
                      )
                    ),
                    Divider(),
                    Padding(
                      padding: EdgeInsets.all(8.0),
                      child: Text(
                        "New Story",
                        style: TextStyle(
                          fontSize: 18.0
                        )
                      )
                    ),
                    Padding(
                      padding: EdgeInsets.all(8.0),
                      child: Text(
                        "Stats",
                        style: TextStyle(
                          fontSize: 18.0
                        )
                      )
                    ),
                    Padding(
                      padding: EdgeInsets.all(8.0),
                      child: Text(
                        "Drafts",
                        style: TextStyle(
                          fontSize: 18.0
                        )
                      )
                    )
                  ]
                )
              )
            )
          )
        ]
      )
    );
  }
}