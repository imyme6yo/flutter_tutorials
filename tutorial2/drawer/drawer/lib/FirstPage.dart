import "package:flutter/material.dart";

import 'CustomDrawer.dart';

class FirstPage extends StatelessWidget{
  @override
  Widget build( BuildContext context ){
    return Scaffold(
      drawer: CustomDrawer(),
      appBar: AppBar(
        title: Text(
          'First Page'
        )
      ),
      body: Text(
        'I belong to First Page'
      )
    );
  }
}