import 'dart:convert';
/// id : 1
/// name : "Mr. Darrick Leuschke"
/// image : "http://dating.ultimatesoft.co/uploads/no_image.jpeg"

Interests interestsFromJson(String str) => Interests.fromJson(json.decode(str));
String interestsToJson(Interests data) => json.encode(data.toJson());
class Interests {
  Interests({
    num? id,
    String? name,
    String? image,}){
    _id = id;
    _name = name;
    _image = image;
  }

  Interests.fromJson(dynamic json) {
    _id = json['id'];
    _name = json['name'];
    _image = json['image'];
  }
  num? _id;
  String? _name;
  String? _image;
  Interests copyWith({  num? id,
    String? name,
    String? image,
  }) => Interests(  id: id ?? _id,
    name: name ?? _name,
    image: image ?? _image,
  );
  num? get id => _id;
  String? get name => _name;
  String? get image => _image;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['id'] = _id;
    map['name'] = _name;
    map['image'] = _image;
    return map;
  }

}