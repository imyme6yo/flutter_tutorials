import 'package:flutter/material.dart';

import 'ChatItemModel.dart';
import 'ChatListItem.dart';

var chats = [
  ChatItemModel("Alice", "Lunch in the evening", "16/07/2018"),
  ChatItemModel("Jack", "Sure", "16/07/2018"),
  ChatItemModel("Jane", "Meet this week?", "16/07/2018"),
  ChatItemModel("Ned", "Received!", "16/07/2018"),
  ChatItemModel("Steve", "I'll come too!", "16/07/2018"),
  ChatItemModel("Steve", "I'll come too!", "16/07/2018"),
  ChatItemModel("Steve", "I'll come too!", "16/07/2018"),
];


class ChatsPage extends StatelessWidget {
  const ChatsPage({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      child: ListView.builder(
        itemCount: chats.length,
        itemBuilder: (BuildContext context, int index) {

          if (index.isOdd){
            return Divider();
          }

          final itemIndex = index ~/ 2;

          return ChatListItem(chats[itemIndex]);
        }
      )
    );
  }
}