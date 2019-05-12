import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/foundation.dart';

const String _name = "JON";

void main(){
  runApp(
    new FriendlyChatApp()
  );
}

final ThemeData kIOTheme = new ThemeData(
  primarySwatch: Colors.orange,
  primaryColor: Colors.grey[100],
  primaryColorBrightness: Brightness.light
);

final ThemeData kDefaultTheme = new ThemeData(
  primarySwatch: Colors.purple,
  accentColor: Colors.orangeAccent[400]
);

class FriendlyChatApp extends StatelessWidget{
  @override
  Widget build(BuildContext context){
    return new MaterialApp(
      title: 'FriendlyChat',
      theme: (defaultTargetPlatform == TargetPlatform.iOS) ? kIOTheme : kDefaultTheme,
      home: new ChatScreen()
    );
  }
}

class ChatScreen extends StatefulWidget{
  @override
  State createState()=>new ChatScreenState();
}

class ChatScreenState extends State<ChatScreen> with TickerProviderStateMixin{
  final List<ChatMessageItem> _messages = <ChatMessageItem>[];
  final TextEditingController _textController = new TextEditingController();
  bool _isComposing = false;

  void _handleSumitted(String text){
    _textController.clear();
    setState(() {
        _isComposing = false;
    });
    ChatMessageItem message = new ChatMessageItem(
      text: text,
      animationController: new AnimationController(
        duration: new Duration(milliseconds: 700),
        vsync: this
      )
    );
    setState(
      (){
        _messages.insert(0, message);
      }
    );
    message.animationController.forward();
  }

  Widget _buildTextComposer(){
    // return new Container(
    //   margin: new EdgeInsets.symmetric(horizontal: 8),
    //   child: new Row(
    //     children: <Widget>[
    //       new Flexible(
    //         child: new TextField(
    //           controller: _textController,
    //           onSubmitted: _handleSumitted,
    //           decoration: new InputDecoration.collapsed(
    //             hintText: "Send a message"
    //           )
    //         )
    //       ),
    //       new Container(
    //         margin: new EdgeInsets.symmetric(horizontal: 4),
    //         child: new IconButton(
    //           icon: new Icon(Icons.send),
    //           onPressed: ()=> _handleSumitted(_textController.text)
    //         )
    //       )
    //     ]
    //   )
    // );

    return new IconTheme(
      data: new IconThemeData(
        color: Theme.of(context).accentColor
      ),
      child: new Container(
        margin: new EdgeInsets.symmetric(horizontal: 8.0),
        child: Row(
          children: <Widget> [
            new Flexible(
              child: new TextField(
                controller: _textController,
                onChanged: (String text) {
                  setState(
                    () {
                      _isComposing = text.length > 0;
                    }
                  );
                },
                onSubmitted: _handleSumitted,
                decoration: new InputDecoration.collapsed(hintText: "Send a message")
              )
            ),
            new Container(
              margin: new EdgeInsets.symmetric(horizontal: 4),
              child: 
                (Theme.of(context).platform == TargetPlatform.iOS)
                ? new CupertinoButton(
                  child: new Text("Send"),
                  onPressed: _isComposing ? ()=> _handleSumitted(_textController.text): null
                ) 
                : new IconButton(
                  icon: new Icon(Icons.send),
                  onPressed: _isComposing ? ()=> _handleSumitted(_textController.text): null
                )
            )
          ]
        )
      )
    );
  }

  @override
  Widget build(BuildContext context){
    return new Scaffold(
      appBar: AppBar(
        title: Text("FriendlyChat"),
        elevation: (Theme.of(context).platform == TargetPlatform.iOS) ? 0.0 : 4.0
      ),
      body: new Container(
        decoration: (Theme.of(context).platform == TargetPlatform.iOS) ? new BoxDecoration( border: new Border(top: new BorderSide(color: Colors.grey[200]))) : null,
        child: new Column(
          children: <Widget>[
            new Flexible(
              child: new ListView.builder(
                padding: new EdgeInsets.all(8.0),
                reverse: true,
                itemBuilder: (_, int index) => _messages[index],
                itemCount: _messages.length
              )
            ),
            new Divider(
              height: 1.0
            ),
            new Container(
              decoration: new BoxDecoration(
                color: Theme.of(context).cardColor
              ),
              child: _buildTextComposer()
            )
          ]
        )
      )
    );
  }
}


class ChatMessageItem extends StatelessWidget {
  ChatMessageItem({this.text, this.animationController});

  final String text;
  final AnimationController animationController;

  @override
  Widget build(BuildContext context){

    return new SizeTransition(
      sizeFactor: new CurvedAnimation(
        parent: animationController,
        curve: Curves.easeOut
      ),
      axisAlignment: 0.0,
      child: new Container(
        child: new Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            new Container(
              margin: EdgeInsets.only(right: 16.0),
              child: new CircleAvatar(
                child: new Text(_name[0])
              )
            ),
            new Expanded(
              child: new Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  new Text(
                    _name, 
                    style: Theme.of(context).textTheme.subhead
                  ),
                  new Container(
                    margin: EdgeInsets.only(top: 5.0),
                    child: new Text(text)
                  )
                ]
              )
            )
          ]
        )
      )
    );

    // return new Container(
    //   margin: new EdgeInsets.symmetric(vertical: 10.0),
    //   child: new Row(
    //     crossAxisAlignment: CrossAxisAlignment.start,
    //     children: <Widget>[
    //       new Container(
    //         margin: new EdgeInsets.only(right: 16.0),
    //         child: new CircleAvatar(
    //           child: new Text(_name[0])
    //         )
    //       ),
    //       new Column(
    //         crossAxisAlignment: CrossAxisAlignment.start,
    //         children: <Widget>[
    //           new Text(
    //             _name,
    //             style: Theme.of(context).textTheme.subhead
    //           ),
    //           new Container(
    //             margin: new EdgeInsets.only(top: 5.0),
    //             child: new Text(text)
    //           )
    //         ]
    //       )
    //     ]
    //   )
    // );
  }
}