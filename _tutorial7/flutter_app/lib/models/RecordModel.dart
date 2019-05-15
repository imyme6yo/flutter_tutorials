class RecordModel{
  String name;
  String address;
  String contact;
  String photo;
  String url;

  RecordModel({this.name, this.address, this.contact, this.photo, this.url});

  factory RecordModel.fromJson(Map<String, dynamic> json){
    return RecordModel(
      name: json['name'],
      address: json['address'],
      contact: json['contact'],
      photo: json['photo'],
      url: json['url']      
    );
  }
}