import 'package:flutter/material.dart';

import 'ChatItemModel.dart';

class ChatListItem extends StatelessWidget {
  
  final ChatItemModel chatItem;

  ChatListItem(this.chatItem);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.all(
        8.0
      ),
      child: Row(
        children: <Widget>[
          Icon(
            Icons.account_circle,
            size: 64.0
          ),
          Expanded(
            child: Padding(
              padding: EdgeInsets.all(
                8.0
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: <Widget>[
                      Text(
                        chatItem.name,
                        style: TextStyle(
                          fontWeight: FontWeight.w500,
                          fontSize: 20.0
                        )
                      ),
                      Text(
                        chatItem.messageDate,
                        style: TextStyle(
                          color: Colors.black45
                        )
                      )
                    ],
                  ),
                  Padding(
                    padding: EdgeInsets.only(
                      top: 2.0
                    ),
                    child: Text(
                      chatItem.mostRecentMessage,
                      style: TextStyle(
                        color: Colors.black45,
                        fontSize: 16.0
                      )
                    )
                  )
                ]
              )
            )
          )
        ]
      )
    );
  }
}