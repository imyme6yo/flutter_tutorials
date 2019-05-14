import 'package:flutter/material.dart';

import 'CallItemModel.dart';
import 'CallListItem.dart';

var calls = [
  CallItemModel("Alice", "Today, 3:39 PM"), 
  CallItemModel("John", "Today, 4:41 PM")
];

class CallsPage extends StatelessWidget {
  const CallsPage({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemCount: calls.length,
      itemBuilder: (BuildContext context, int index) {
        if (index.isOdd){
          return Divider();
        }

        final callIndex = index ~/ 2;

        return CallListItem(calls[callIndex]);
      },
    );
  }
}