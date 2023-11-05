import 'dart:convert';

/// id : 1
/// name : "PayPal"
/// image : "http://dating.ultimatesoft.co/uploads/gateways/paypal.png"

Gateways gatewaysFromJson(String str) => Gateways.fromJson(json.decode(str));
String gatewaysToJson(Gateways data) => json.encode(data.toJson());
class Gateways {
  Gateways({
    num? id,
    String? name,
    String? image,}){
    _id = id;
    _name = name;
    _image = image;
  }

  Gateways.fromJson(dynamic json) {
    _id = json['id'];
    _name = json['name'];
    _image = json['image'];
  }
  num? _id;
  String? _name;
  String? _image;
  Gateways copyWith({  num? id,
    String? name,
    String? image,
  }) => Gateways(  id: id ?? _id,
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
