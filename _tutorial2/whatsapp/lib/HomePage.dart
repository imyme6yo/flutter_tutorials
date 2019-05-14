import 'package:flutter/material.dart';

import 'AppColor.dart';

import 'ChatsPage.dart';
import 'StatusPage.dart';
import 'CallsPage.dart';

class HomePageState extends State<HomePage> with SingleTickerProviderStateMixin{

  TabController tabController;
  var fabIcon = Icons.message;

  @override
  void initState() { 
    super.initState();

    tabController = TabController(
      vsync: this,
      length: 4
    )
      ..addListener((){
        setState((){
          switch(tabController.index){
            case 0:
              break;
            case 1:
              fabIcon = Icons.message;
              break;
            case 2: 
              fabIcon = Icons.camera_enhance;
              break;
            case 3:
              fabIcon = Icons.call;
              break;
          }
        });
      });   
  }

  @override
  Widget build( BuildContext context ){
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'WhatsApp',
          style: TextStyle(
            color: Colors.white,
            fontSize: 22.0,
            fontWeight: FontWeight.w600
          )
        ),
        actions: <Widget>[
          Padding(
            padding: EdgeInsets.only(
              right: 20.0
            ),
            child: Icon(
              Icons.search
            )
          ),
          Padding(
            padding: EdgeInsets.only(
              right: 16.0
            ),
            child: Icon(
              Icons.more_vert
            )
          )
        ],
        backgroundColor: whatsAppGreen,
        bottom: TabBar(
          tabs: <Widget>[
            Tab(
              icon: Icon(
                Icons.camera_alt
              )
            ),
            Tab(
              child: Text(
                'CHATS'
              )
            ),
            Tab(
              child: Text(
                'STATUS'
              )
            ),
            Tab(
              child: Text(
                'CALLS'
              )
            )
          ],
          indicatorColor: Colors.white,
          controller: tabController,
        ),
      ),
      body: TabBarView(
        controller: tabController,
        children: [
          Icon(
            Icons.camera_alt
          ),
          ChatsPage(),
          StatusPage(),
          CallsPage()
        ]
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: (){},
        child: Icon(
          fabIcon
        ),
        backgroundColor: whatsAppGreenLight,
      ),
    );
  } 
}


class HomePage extends StatefulWidget{
  @override
  HomePageState createState() => HomePageState();
}