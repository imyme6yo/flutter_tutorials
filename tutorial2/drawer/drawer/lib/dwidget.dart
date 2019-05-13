import 'package:flutter/material.dart';

import 'FirstPage.dart';
import 'SecondPage.dart';

import 'CustomDrawer.dart';

class DWidget extends StatelessWidget{
  @override
  Widget build( BuildContext context ){
    return Scaffold(
      drawer: CustomDrawer(),
      appBar: AppBar(
        title: Text(
          'Drawer Demo'
        )
      ),
      body: Text('Drawer Body')
    );
  }
}