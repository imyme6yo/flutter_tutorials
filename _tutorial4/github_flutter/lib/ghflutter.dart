import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

import 'member.dart';
import 'strings.dart';

class GHFlutterState extends State<GHFlutter>{
  var _members = <Member>[];

  final _biggerFont = TextStyle(
    fontSize: 18.0
  );

  Widget _buildRow(int i){
    return Padding(
      padding: EdgeInsets.all(16.0),
      child: ListTile(
        leading: CircleAvatar(
          backgroundColor: Colors.green,
          backgroundImage: NetworkImage(_members[i].avatarUrl)
        ),
        title: Text(
          // "hello",
          "${_members[i].login}",
          style: _biggerFont
        )
      )
    );
    // return ListTile(
    //   title: Text(
    //     "${_members[i]["login"]}",
    //     style: _biggerFont
    //   ),
    // );
  }

  _loadData() async{
    String dataURL = "https://api.github.com/orgs/raywenderlich/members";
    http.Response response = await http.get(dataURL);
    setState(
      (){
        final _members_json = json.decode(response.body);
        for (var m in _members_json){
          final member = new Member(m["login"], m["avatar_url"]);
          _members.add(member);
        }
      }
    );
  }

  @override
  void initState(){
    super.initState();
    _loadData();
  }

  @override
  Widget build(BuildContext context){
    return Scaffold(
      appBar: AppBar(
        title: Text(Strings.appTitle)
      ),
      body: ListView.builder(
        padding: new EdgeInsets.all(16.0),
        itemCount: _members.length,
        itemBuilder: (BuildContext context, int index){

          if (index.isOdd){
            return Divider();
          }

          final tileIndex = index ~/ 2;

          return _buildRow(tileIndex);
        }
      )
    );
  }
}

class GHFlutter extends StatefulWidget{
  @override
  createState() => new GHFlutterState();
}
