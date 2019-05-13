import 'package:flutter/material.dart';

class SecondPage extends StatelessWidget{
  @override
  Widget build( BuildContext context ){
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'Second Page'
        )
      ),
      body: Checkbox(
        value: true,
        onChanged: (bool checked){
          // ($value) = !(checked);
          Navigator.pop(context);
        }
      )
    );
  }
}