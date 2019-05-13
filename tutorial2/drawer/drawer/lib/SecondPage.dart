import "package:flutter/material.dart";

import 'CustomDrawer.dart';

class SecondPage extends StatelessWidget{
  @override
  Widget build( BuildContext context ){
    return Scaffold(
      drawer: CustomDrawer(),
      appBar: AppBar(
        title: Text(
          'Second Page'
        )
      ),
      body: Text(
        'I belong to Second Page'
      )
    );
  }
}