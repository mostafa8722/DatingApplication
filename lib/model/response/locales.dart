import 'dart:convert';

/// id : 1
/// name : "English"
/// iso_code : "en"
/// dir : "LTR"
/// deleted_at : null
/// created_at : "2022-12-06T15:56:02.000000Z"
/// updated_at : "2022-12-06T15:56:02.000000Z"

Locales localesFromJson(String str) => Locales.fromJson(json.decode(str));
String localesToJson(Locales data) => json.encode(data.toJson());
class Locales {
  Locales({
    num? id,
    String? name,
    String? isoCode,
    String? dir,
    dynamic deletedAt,
    String? createdAt,
    String? updatedAt,}){
    _id = id;
    _name = name;
    _isoCode = isoCode;
    _dir = dir;
    _deletedAt = deletedAt;
    _createdAt = createdAt;
    _updatedAt = updatedAt;
  }

  Locales.fromJson(dynamic json) {
    _id = json['id'];
    _name = json['name'];
    _isoCode = json['iso_code'];
    _dir = json['dir'];
    _deletedAt = json['deleted_at'];
    _createdAt = json['created_at'];
    _updatedAt = json['updated_at'];
  }
  num? _id;
  String? _name;
  String? _isoCode;
  String? _dir;
  dynamic _deletedAt;
  String? _createdAt;
  String? _updatedAt;
  Locales copyWith({  num? id,
    String? name,
    String? isoCode,
    String? dir,
    dynamic deletedAt,
    String? createdAt,
    String? updatedAt,
  }) => Locales(  id: id ?? _id,
    name: name ?? _name,
    isoCode: isoCode ?? _isoCode,
    dir: dir ?? _dir,
    deletedAt: deletedAt ?? _deletedAt,
    createdAt: createdAt ?? _createdAt,
    updatedAt: updatedAt ?? _updatedAt,
  );
  num? get id => _id;
  String? get name => _name;
  String? get isoCode => _isoCode;
  String? get dir => _dir;
  dynamic get deletedAt => _deletedAt;
  String? get createdAt => _createdAt;
  String? get updatedAt => _updatedAt;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['id'] = _id;
    map['name'] = _name;
    map['iso_code'] = _isoCode;
    map['dir'] = _dir;
    map['deleted_at'] = _deletedAt;
    map['created_at'] = _createdAt;
    map['updated_at'] = _updatedAt;
    return map;
  }

}