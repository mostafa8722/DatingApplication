import 'dart:convert';




Gift giftFromJson(String str) => Gift.fromJson(json.decode(str));
String giftToJson(Gift data) => json.encode(data.toJson());
class Gift {
  Gift({
    int? id,
    String? image,
    int? token,
      }) {
    _id = id;
    _image = image;
    _token = token;
  }


  Gift.fromJson(dynamic json) {
    _id = json['id'];
    _image = json['image'];
    _token = json['token'];


  }



  int? _id;
  int? _token;
  String? _image;
  Gift copyWith({  int? id,
  String? image,
  int? token,
}) => Gift(  id: id ?? _id, image: image?? _image ,token: token??_token

);


  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['id'] = _id;
    map['image'] = _image;
    map['token'] = _token;

    return map;
  }

}