import 'package:flutter/material.dart';

import 'SecondPage.dart';

class FirstPage extends StatelessWidget{
  @override
  Widget build( BuildContext context ){
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'First Page'
        )
      ),
      body: Checkbox(
        value: false,
        onChanged: (bool checked){
          // ($value) = checked;
          Navigator.push(context, MaterialPageRoute(builder: (context)=> SecondPage()));
        }
      )
    );
  }
}