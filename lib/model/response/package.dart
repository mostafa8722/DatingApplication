import 'dart:convert';
/// id : 3
/// name : [{"en":""},{"fa":""}]
/// image : "http://panel.lover369.com/uploads/coin.svg"
/// has_discount : false
/// discount_percentage : null
/// discount_amount : 0
/// price_before_discount : 50
/// price : 50
/// tokens : 500

Package packageFromJson(String str) => Package.fromJson(json.decode(str));
String packageToJson(Package data) => json.encode(data.toJson());
class Package {
  Package({
      num? id, 
      List<Name>? name, 
      String? image, 
      bool? hasDiscount, 
      dynamic discountPercentage, 
      num? discountAmount, 
      num? priceBeforeDiscount, 
      num? price, 
      num? tokens,}){
    _id = id;
    _name = name;
    _image = image;
    _hasDiscount = hasDiscount;
    _discountPercentage = discountPercentage;
    _discountAmount = discountAmount;
    _priceBeforeDiscount = priceBeforeDiscount;
    _price = price;
    _tokens = tokens;
}

  Package.fromJson(dynamic json) {
    _id = json['id'];
    if (json['name'] != null) {
      _name = [];
      json['name'].forEach((v) {
        _name?.add(Name.fromJson(v));
      });
    }
    _image = json['image'];
    _hasDiscount = json['has_discount'];
    _discountPercentage = json['discount_percentage'];
    _discountAmount = json['discount_amount'];
    _priceBeforeDiscount = json['price_before_discount'];
    _price = json['price'];
    _tokens = json['tokens'];
  }
  num? _id;
  List<Name>? _name;
  String? _image;
  bool? _hasDiscount;
  dynamic _discountPercentage;
  num? _discountAmount;
  num? _priceBeforeDiscount;
  num? _price;
  num? _tokens;
Package copyWith({  num? id,
  List<Name>? name,
  String? image,
  bool? hasDiscount,
  dynamic discountPercentage,
  num? discountAmount,
  num? priceBeforeDiscount,
  num? price,
  num? tokens,
}) => Package(  id: id ?? _id,
  name: name ?? _name,
  image: image ?? _image,
  hasDiscount: hasDiscount ?? _hasDiscount,
  discountPercentage: discountPercentage ?? _discountPercentage,
  discountAmount: discountAmount ?? _discountAmount,
  priceBeforeDiscount: priceBeforeDiscount ?? _priceBeforeDiscount,
  price: price ?? _price,
  tokens: tokens ?? _tokens,
);
  num? get id => _id;
  List<Name>? get name => _name;
  String? get image => _image;
  bool? get hasDiscount => _hasDiscount;
  dynamic get discountPercentage => _discountPercentage;
  num? get discountAmount => _discountAmount;
  num? get priceBeforeDiscount => _priceBeforeDiscount;
  num? get price => _price;
  num? get tokens => _tokens;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['id'] = _id;
    if (_name != null) {
      map['name'] = _name?.map((v) => v.toJson()).toList();
    }
    map['image'] = _image;
    map['has_discount'] = _hasDiscount;
    map['discount_percentage'] = _discountPercentage;
    map['discount_amount'] = _discountAmount;
    map['price_before_discount'] = _priceBeforeDiscount;
    map['price'] = _price;
    map['tokens'] = _tokens;
    return map;
  }

}

/// en : ""

Name nameFromJson(String str) => Name.fromJson(json.decode(str));
String nameToJson(Name data) => json.encode(data.toJson());
class Name {
  Name({
      String? en,}){
    _en = en;
}

  Name.fromJson(dynamic json) {
    _en = json['en'];
  }
  String? _en;
Name copyWith({  String? en,
}) => Name(  en: en ?? _en,
);
  String? get en => _en;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['en'] = _en;
    return map;
  }

}