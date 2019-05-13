import 'package:flutter/material.dart';

import 'FirstPage.dart';
import 'SecondPage.dart';

class CustomDrawer extends StatelessWidget{
  @override
  Widget build( BuildContext context ){
    return Drawer(
      child: ListView(
        children: <Widget>[
          DrawerHeader(
            child: Text(
              'Drawer Header'
            ),
            decoration: BoxDecoration(
              color: Colors.orange
            )
          ),
          ListTile(
            title: Text(
              'First Page'
            ),
            onTap: (){
              Navigator.pop(context);
              Navigator.push(context, MaterialPageRoute(builder: (context)=> FirstPage()));
            }
          ),
          ListTile(
            title: Text(
              'Second Page'
            ),
            onTap: (){
              Navigator.pop(context);
              Navigator.push(context, MaterialPageRoute(builder: (context)=> SecondPage()));
            }
          )
        ]
      )
    );
  }
}
