import 'package:flutter/material.dart';

import 'package:flutter_app/pages/DetailPage.dart';

import 'package:flutter_app/helpers/Constants.dart';

import 'package:flutter_app/models/RecordModel.dart';
import 'package:flutter_app/models/RecordListModel.dart';

import 'package:flutter_app/services/RecordService.dart';

class HomePage extends StatefulWidget {
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final TextEditingController _filter = TextEditingController();

  RecordListModel _records = RecordListModel();
  RecordListModel _filteredRecords = RecordListModel();

  String _searchText = "";

  Icon _searchIcon = Icon(
    Icons.search
  );

  Widget _appBarTitle = Text(
    appTitle
  );

  _HomePageState(){
    _filter.addListener((){
      if(_filter.text.isEmpty){
        setState((){
          _searchText = "";
          _resetRecords();
        });
      }else{
        setState((){
          _searchText = _filter.text;
        });
      }
    });
  }

  void _resetRecords(){
    _filteredRecords.records = new List();
    for(RecordModel record in _records.records){
      this._filteredRecords.records.add(record);
    }
  }
  

  void _getRecords() async{
    RecordListModel records = await RecordService().loadRecords();
    setState((){
      for (RecordModel record in records.records){
        this._records.records.add(record);
        this._filteredRecords.records.add(record);
      }
    });
  }
  
  void _searchPressed(){
    setState((){
      if(this._searchIcon.icon == Icons.search){
        this._searchIcon = Icon(
          Icons.close
        );
        this._appBarTitle = TextField(
          controller: _filter,
          style: TextStyle(
            color: Colors.white
          ),
          decoration: InputDecoration(
            prefixIcon: Icon(
              Icons.search,
              color: Colors.white
            ),
            fillColor: Colors.white,
            hintText: 'Search by name',
            hintStyle: TextStyle(
              color: Colors.white
            )
          )
        );
      }else{
        this._searchIcon = Icon(
          Icons.search
        );
        this._appBarTitle = Text(
          appTitle
        );
        _filter.clear();
      }
    });
  }

  @override
  void initState() {
    // TODO: implement initState
    super.initState();

    _records.records = List<RecordModel>();
    _filteredRecords.records = List<RecordModel>();

    _getRecords();
  }

  AppBar _buildBar(BuildContext context){
    return AppBar(
      elevation: 0.1,
      backgroundColor: appDarkGreyColor,
      centerTitle: true,
      title: _appBarTitle,
      leading: IconButton(
        icon: _searchIcon,
        onPressed: _searchPressed
      )
    );
  }

  Widget _buildListItem(BuildContext context, RecordModel record){
    return Card(
      key: ValueKey(record.name),
      elevation: 8.0,
      margin: EdgeInsets.symmetric(
        horizontal: 10.0,
        vertical: 6.0
      ),
      child: Container(
        decoration: BoxDecoration(
          color: Color.fromRGBO(64, 75, 96, .9)
        ),
        child: ListTile(
          contentPadding: EdgeInsets.symmetric(
            horizontal: 20.0,
            vertical: 10.0
          ),
          leading: Container(
            padding: EdgeInsets.only(
              right: 12.0
            ),
            decoration: BoxDecoration(
              border: Border(
                right: BorderSide(
                  width: 1.0,
                  color: Colors.white24
                )
              )
            ),
            child: Hero(
              tag: "avata_" + record.name,
              child: CircleAvatar(
                radius: 32,
                backgroundImage: NetworkImage(record.photo)
              )
            )
          ),
          title: Text(
            record.name,
            style: TextStyle(
              color: Colors.white,
              fontWeight: FontWeight.bold
            )
          ),
          subtitle: Row(
            children: <Widget>[
              Flexible(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: <Widget>[
                    RichText(
                      text: TextSpan(
                        text: record.address,
                        style: TextStyle(
                          color: Colors.white
                        )
                      ),
                      maxLines: 3,
                      softWrap: true
                    )
                  ],
                )
              )
            ],
          ),
          trailing: Icon(
            Icons.keyboard_arrow_right,
            color: Colors.white,
            size: 30.0
          ),
          onTap: (){
            Navigator.push(context, MaterialPageRoute(builder: (context)=> DetailPage(record: record)));
          }
        )
      )
    );
  }

  Widget _buildList(BuildContext context){
    if(!(_searchText.isEmpty)){
      _filteredRecords.records = List<RecordModel>();
      for(int i=0; i<_records.records.length; i++){
        if(_records.records[i].name.toLowerCase().contains(_searchText.toLowerCase())
          || _records.records[i].address.toLowerCase().contains(_searchText.toLowerCase())){
            _filteredRecords.records.add(_records.records[i]);
        }
      }
    }

    return ListView(
      padding: EdgeInsets.only(
        top: 20.0
      ),
      children: this._filteredRecords.records.map((record)=>_buildListItem(context, record)).toList()
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: _buildBar(context),
      backgroundColor: appDarkGreyColor,
      body: _buildList(context),
      resizeToAvoidBottomPadding: false
    );
  }
}