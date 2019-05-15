import 'package:flutter/material.dart';

import 'RecordModel.dart';

class RecordListModel{

  List<RecordModel> records = new List<RecordModel>();

  RecordListModel({this.records});

  factory RecordListModel.fromJson(List<dynamic> parsedJson){
    List<RecordModel> records = new List<RecordModel>();

    records = parsedJson.map((record) => RecordModel.fromJson(record)).toList();

    return RecordListModel(
      records: records
    );
  }
}