import 'package:flutter/material.dart';

import 'NewsArticle.dart';

class NewsArticleListItem  extends StatelessWidget{
  final NewsArticle article;

  NewsArticleListItem(this.article);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(
        left: 0.0,
        top: 0.5,
        right: 0.0,
        bottom: 0.5
      ),
      child: Card(
        child: Padding(
          padding: EdgeInsets.all(16.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                article.categoryTitle,
                style: TextStyle(
                  color: Colors.black38,
                  fontWeight: FontWeight.w500,
                  fontSize: 16.0
                )
              ),
              Padding(
                padding: EdgeInsets.only(
                  left: 0.0,
                  top: 12.0,
                  right: 0.0,
                  bottom: 12.0
                ),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: <Widget>[
                    Flexible(
                      flex: 3,
                      child: Text(
                        article.title,
                        style: TextStyle(
                          fontWeight: FontWeight.bold,
                          fontSize: 22.0
                        )
                      )
                    ),
                    Flexible(
                      flex: 1,
                      child: Container(
                        height: 80.0,
                        width: 80.0,
                        child: Image.asset(
                          "assets/" + article.imageAssetName, 
                          fit: BoxFit.cover
                        )
                      )
                    )
                  ]
                )
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: <Widget>[
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: <Widget>[
                      Text(
                        article.author,
                        style: TextStyle(
                          fontSize: 18.0
                        )
                      ),
                      Text(
                        article.date + " . " + article.readTime,
                        style: TextStyle(
                          color: Colors.black45,
                          fontWeight: FontWeight.w500
                        )
                      )
                    ]
                  ),
                  Icon(
                    Icons.bookmark_border
                  )
                ]
              )
            ]
          )
        )
      )
    );
  }
}