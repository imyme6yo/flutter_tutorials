import 'package:flutter/material.dart';

import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class NotificationsPage extends StatefulWidget {
  NotificationsPage({Key key}) : super(key: key);

  _NotificationsPageState createState() => _NotificationsPageState();
}

class _NotificationsPageState extends State<NotificationsPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        leading: Icon(
          Icons.account_circle,
          size: 35.0,
          color: Colors.grey
        ),
        title: Text(
          'Notifications',
          style: TextStyle(
            color: Colors.black
          )
        ),
        actions: <Widget>[
          Padding(
            padding: EdgeInsets.only(
              right: 8.0
            ),
            child: Icon(
              Icons.settings,
              color: Colors.blue
            )
          )
        ],
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: (){},
        child: Icon(
          FontAwesomeIcons.bell
        )
      ),
    );
  }
}