import 'package:flutter_app/models/RecordListModel.dart';

import 'package:flutter/services.dart' show rootBundle;

import 'dart:convert';

class RecordService {

  Future<String> _loadRecordsAsset() async{
    return await rootBundle.loadString('assets/data/records.json');
  }

  Future<RecordListModel> loadRecords() async{
    String records_string = await _loadRecordsAsset();
    final records_json = json.decode(records_string);

    RecordListModel records = RecordListModel.fromJson(records_json);
    return records;
  }
}