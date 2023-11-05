import 'dart:convert';
/// id : 13
/// path : "http://dating.ultimatesoft.co/uploadsmedia/7//Screen Shot 2022-12-09 at 12.03.51 PM.png"
/// type : "IMAGE"

Gallery galleryFromJson(String str) => Gallery.fromJson(json.decode(str));
String galleryToJson(Gallery data) => json.encode(data.toJson());
class Gallery {
  Gallery({
      num? id, 
      String? path, 
      String? type,}){
    _id = id;
    _path = path;
    _type = type;
}

  Gallery.fromJson(dynamic json) {
    _id = json['id'];
    _path = json['path'];
    _type = json['type'];
  }
  num? _id;
  String? _path;
  String? _type;
Gallery copyWith({  num? id,
  String? path,
  String? type,
}) => Gallery(  id: id ?? _id,
  path: path ?? _path,
  type: type ?? _type,
);
  num? get id => _id;
  String? get path => _path;
  String? get type => _type;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['id'] = _id;
    map['path'] = _path;
    map['type'] = _type;
    return map;
  }

}