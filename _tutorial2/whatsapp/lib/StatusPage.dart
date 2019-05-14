import 'package:flutter/material.dart';

import 'StatusItemModel.dart';

import 'StatusListItem.dart';

var statues = [
  StatusItemModel("Jane", "Yesterday, 11:21 PM"), 
  StatusItemModel("Jack", "Yesterday, 10:22 PM")
];

class StatusPage extends StatelessWidget {
  const StatusPage({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemCount: statues.length,
      itemBuilder: (BuildContext context, int index) {
        if(index.isOdd){
          return Divider();
        }
        final int statusIndex = index ~/ 2;
        return StatusListItem(statues[statusIndex]);
      },
    );
  }
}