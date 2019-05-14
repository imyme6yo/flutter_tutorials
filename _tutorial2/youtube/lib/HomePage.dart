import 'package:flutter/material.dart';

// https://pub.dev/packages/font_awesome_flutter
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

import 'VideoItemModel.dart';
import 'YoutubeListItem.dart';

var videos = [
  VideoItemModel(
      "Gordon Ramsay Cooked For Vladimir Putin",
      "The Late Show with Stephen Colbert\n1.1M views.2 weeks ago",
      "assets/youtube_one.jpg"
  ),
  VideoItemModel(
    "Hailee Steinfeld, Alesso - Let Me Go",
    "Hailee Steinfeld\n57M views.8 months ago", 
    "assets/youtube_two.jpg"
  ),
  VideoItemModel(
    "Charlie Puth - Look At Me Now",
    "Lyricwood\n4.7M views.4 months ago", 
    "assets/youtube_three.jpg"
  )
];

class HomePageState extends State<HomePage> with TickerProviderStateMixin{

  AnimationController alignmentAnimationController;
  Animation alignmentAnimation;

  AnimationController videoViewController;
  Animation videoViewAnimation;

  var currentAlignment = Alignment.topCenter;

  var videoIndexSelected = -1;
  var maxVideoWidth = 250.0;
  var maxVideoHeight = 200.0;
  var minVideoWidth = 100.0;
  var minVideoHeight = 150.0;

  var currentVideoWidth = 200.0;
  var currentVideoHeight = 200.0;

  bool isInSmallMode = false;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();

    alignmentAnimationController = AnimationController(
      vsync: this,
      duration: Duration(
        seconds: 1
      ))
        ..addListener((){
          setState((){
            currentAlignment = alignmentAnimation.value;
          });
        });
    

    alignmentAnimation = AlignmentTween(
      begin: Alignment.topCenter,
      end: Alignment.bottomRight
    ).animate(
      CurvedAnimation(
        parent: alignmentAnimationController,
        curve: Curves.fastOutSlowIn
      )
    );

    videoViewController = AnimationController(
      vsync: this
    )
      ..addListener((){
        setState(() {
          currentVideoWidth = (maxVideoWidth * videoViewAnimation.value) + (minVideoWidth * (1.0 - videoViewAnimation.value));
          currentVideoHeight = (maxVideoHeight * videoViewAnimation.value) + (minVideoHeight * (1.0 - videoViewAnimation.value));
        });
      });

    videoViewAnimation = Tween<double>(
      begin: 1.0,
      end: 0.0
    ).animate(
      videoViewController
    );
  }

  @override
  Widget build( BuildContext context ){
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        title: Row(
          mainAxisSize:  MainAxisSize.min,
          children: <Widget>[
            Icon(
              FontAwesomeIcons.youtube,
              color: Colors.red,
            ),
            Padding(
              padding: EdgeInsets.only(
                left: 8.0
              ),
              child: Text(
                "YouTube",
                style: TextStyle(
                  color: Colors.black,
                  letterSpacing: -1.0,
                  fontWeight: FontWeight.w700
                ),
              )
            )
          ],
        ),
        actions: <Widget>[
          Padding(
            padding: EdgeInsets.symmetric(
              horizontal: 12.0
            ),
            child: Icon(
              Icons.videocam,
              color: Colors.black54,
            )
          ),
          Padding(
            padding: EdgeInsets.symmetric(
              horizontal: 12.0
            ),
            child: Icon(
              Icons.search,
              color: Colors.black54
            )
          ),
          Padding(
            padding: EdgeInsets.symmetric(
              horizontal: 12.0
            ),
            child: Icon(
              Icons.account_circle,
              color: Colors.black54
            )
          )
        ],
      ),
      body: Stack(
        children: [
          Center(
            child: ListView.builder(
              itemCount: videos.length,
              itemBuilder: (context, index){
                return GestureDetector(
                  onTap: (){
                    setState((){
                      videoIndexSelected = index;
                    });
                  },
                  child:YoutubeListItem(index)
                );
              }
            )
          ),
          (videoIndexSelected > -1)
            ? LayoutBuilder(
              builder: (context, constraints){
                maxVideoWidth = constraints.biggest.width;
                
                if( !isInSmallMode ){
                  currentVideoWidth = maxVideoWidth;
                }

                return Column(
                  crossAxisAlignment: CrossAxisAlignment.end,
                  children: <Widget>[
                    Expanded(
                      child: Align(
                        child: Padding(
                          padding: EdgeInsets.all(
                            isInSmallMode? 8.0: 0.0
                          ),
                          child: GestureDetector(
                            onVerticalDragEnd: (details){
                              if(details.velocity.pixelsPerSecond.dy > 0){
                                setState((){
                                  isInSmallMode = true;
                                  alignmentAnimationController.forward();
                                  videoViewController.forward();
                                });
                              }else if(details.velocity.pixelsPerSecond.dy < 0){
                                setState((){
                                  alignmentAnimationController.reverse();
                                  videoViewController.reverse().then(
                                    (value){
                                      setState(() {
                                        isInSmallMode = false;
                                      });
                                    }
                                  );
                                });
                              }
                            },
                            child: Container(
                              width: currentVideoWidth,
                              height: currentVideoHeight,
                              child: Image.asset(
                                videos[videoIndexSelected].imagePath,
                                fit: BoxFit.cover
                              ),
                              color: Colors.blue
                            )
                          )
                        ),
                        alignment: currentAlignment,
                      ),
                      flex: 3
                    ),
                    (currentAlignment == Alignment.topCenter)
                      ? Expanded(
                          flex: 6,
                          child: Container(
                            child: Column(
                              children: <Widget>[
                                Row(),
                                Padding(
                                  padding: EdgeInsets.all(
                                    8.0
                                  ),
                                  child: Card(
                                    child: Padding(
                                      padding: EdgeInsets.all(
                                        8.0
                                      ),
                                      child: Text(
                                        'Video Recommendation'
                                      )
                                    )
                                  )
                                ),
                                Padding(
                                  padding: EdgeInsets.all(
                                    8.0
                                  ),
                                  child: Card(
                                    child: Padding(
                                      padding: EdgeInsets.all(
                                        8.0
                                      ),
                                      child: Text(
                                        'Video Recommendation'
                                      )
                                    )
                                  )
                                ),
                                Padding(
                                  padding: EdgeInsets.all(
                                    8.0
                                  ),
                                  child: Card(
                                    child: Padding(
                                      padding: EdgeInsets.all(
                                        8.0
                                      ),
                                      child: Text(
                                        'Video Recommendation'
                                      )
                                    )
                                  )
                                )
                              ]
                            ),
                            color: Colors.white
                          )
                      )
                      : Container(),
                    Row()
                  ]
                );
              }
            )
            : Container(),
          Row(),
        ]
      ),
      bottomNavigationBar: BottomNavigationBar(
        items: [
          BottomNavigationBarItem(
            icon: Icon(
              Icons.home,
              color: Colors.black54,
            ),
            title: Text(
              'Home',
              style: TextStyle(
                color: Colors.black54
              ),
            )
          ),
          BottomNavigationBarItem(
            icon: Icon(
              FontAwesomeIcons.fire,
              color: Colors.black54,
            ),
            title: Text(
              'Home',
              style: TextStyle(
                color: Colors.black54
              ),
            )
          ),
          BottomNavigationBarItem(
            icon: Icon(
              Icons.subscriptions,
              color: Colors.black54,
            ),
            title: Text(
              'Home',
              style: TextStyle(
                color: Colors.black54
              ),
            )
          ),
          BottomNavigationBarItem(
            icon: Icon(
              Icons.email,
              color: Colors.black54,
            ),
            title: Text(
              'Home',
              style: TextStyle(
                color: Colors.black54
              ),
            )
          ),
          BottomNavigationBarItem(
            icon: Icon(
              Icons.folder,
              color: Colors.black54,
            ),
            title: Text(
              'Home',
              style: TextStyle(
                color: Colors.black54
              ),
            )
          ),
        ],
        type: BottomNavigationBarType.fixed
      ),
    );
  }
}

class HomePage extends StatefulWidget{
  @override
  State createState() => HomePageState();
}