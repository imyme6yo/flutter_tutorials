import 'package:flutter/material.dart';

import 'chatmessage.dart';


class ChatScreenState extends State<ChatScreen>{
  final TextEditingController textController = TextEditingController();
  final List<ChatMessage> _messages = List<ChatMessage>();

  void _handleSubmit(String text){
    textController.clear();
    ChatMessage message = ChatMessage(
      text: text
    );
    setState(
      (){
        _messages.insert(0, message);
      }
    );
  }

  Widget _chatIconBuilder(){
    return IconTheme(
      data: IconThemeData(
        color: Colors.blue
      ),
      child: Container(
        margin: EdgeInsets.symmetric(horizontal: 8.0),
        child: Row(
          children: <Widget> [
            Flexible(
              child: TextField(
                decoration: InputDecoration.collapsed(
                  hintText: "Send a message",
                ),
                controller: textController,
                onSubmitted: _handleSubmit
              )
            ),
            Container(
              margin: EdgeInsets.symmetric(horizontal: 4.0),
              child: IconButton(
                icon: Icon(Icons.send),
                onPressed: ()=> _handleSubmit(textController.text)
              )
            )
          ]
        )
      )
    );
  }

  @override
  Widget build(BuildContext context){
    return Column(
      children: <Widget>[
        Flexible(
          child: ListView.builder(
            padding: EdgeInsets.all(8.0),
            reverse: true,
            itemBuilder: (_, int index) => _messages[index],
            itemCount: _messages.length
          )
        ),
        Divider(
          height: 1.0
        ),
        Container(
          decoration: BoxDecoration(
            color: Theme.of(context).cardColor
          ),
          child: _chatIconBuilder()
        )
      ]
    );
  }
}

class ChatScreen extends StatefulWidget{
  @override
  State createState() => ChatScreenState();
}