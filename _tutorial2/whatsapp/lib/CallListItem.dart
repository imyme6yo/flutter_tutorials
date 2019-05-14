import 'package:flutter/material.dart';

import 'AppColor.dart';
import 'CallItemModel.dart';

class CallListItem extends StatelessWidget {

  final CallItemModel call;

  CallListItem(this.call);

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Row(
          children: <Widget>[
            Icon(
              Icons.account_circle,
              size: 64.0,
            ),
            Expanded(
              child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: <Widget>[
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: <Widget>[
                        Row(
                          mainAxisAlignment:
                          MainAxisAlignment.spaceBetween,
                          children: <Widget>[
                            Text(
                              call.name,
                              style: TextStyle(
                                  fontWeight: FontWeight.w500,
                                  fontSize: 20.0),
                            ),
                          ],
                        ),
                        Padding(
                          padding: const EdgeInsets.only(top: 2.0),
                          child: Text(
                            call.dateTime,
                            style: TextStyle(
                                color: Colors.black45, fontSize: 16.0),
                          ),
                        ),
                      ],
                    ),
                    Icon(Icons.call, color: whatsAppGreen,)
                  ],
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}