import 'package:flutter/material.dart';

import 'package:font_awesome_flutter/font_awesome_flutter.dart';

import 'HomePage.dart';
import 'SearchPage.dart';
import 'NotificationsPage.dart';
import 'MessagesPage.dart';

void main() => runApp(MyApp());

class _TwitterMainState extends State<TwitterMain> {
  int _selectedPageIndex = 0;
  var _pages = [
    HomePage(),
    SearchPage(),
    NotificationsPage(),
    MessagesPage()
  ];
  @override
  Widget build(BuildContext context) {
    return Container(
      child: Scaffold(
        body: _pages[_selectedPageIndex],
        bottomNavigationBar: BottomNavigationBar(
          currentIndex: _selectedPageIndex,
          onTap: (index){
            setState((){
              _selectedPageIndex = index;
            });
          },
          items: [
            BottomNavigationBarItem(
              title: Text(
                ''
              ),
              icon: Icon(
                FontAwesomeIcons.home,
                color: _selectedPageIndex == 0? Colors.blue : Colors.blueGrey
              )
            ),
            BottomNavigationBarItem(
              title: Text(
                ''
              ),
              icon: Icon(
                FontAwesomeIcons.search,
                color: _selectedPageIndex == 1? Colors.blue : Colors.blueGrey
              )
            ),
            BottomNavigationBarItem(
              title: Text(
                ''
              ),
              icon: Icon(
                FontAwesomeIcons.bell,
                color: _selectedPageIndex == 2? Colors.blue : Colors.blueGrey
              )
            ),
            BottomNavigationBarItem(
              title: Text(
                ''
              ),
              icon: Icon(
                FontAwesomeIcons.envelope,
                color: _selectedPageIndex == 3? Colors.blue : Colors.blueGrey
              )
            )
          ]
        )
      ),
    );
  }
}

class TwitterMain extends StatefulWidget {
  TwitterMain({Key key}) : super(key: key);

  _TwitterMainState createState() => _TwitterMainState();
}


class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Twitter App',
      theme: ThemeData(
        primarySwatch: Colors.blue
      ),
      home: TwitterMain(),
    );
  }
}
