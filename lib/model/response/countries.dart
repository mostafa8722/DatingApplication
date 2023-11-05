import 'dart:convert';

/// id : 1
/// name : "Afghanistan"
/// phone_prefix : 93

Countries countriesFromJson(String str) => Countries.fromJson(json.decode(str));
String countriesToJson(Countries data) => json.encode(data.toJson());
class Countries {
  Countries({
    num? id,
    String? name,
    num? phonePrefix,}){
    _id = id;
    _name = name;
    _phonePrefix = phonePrefix;
  }

  Countries.fromJson(dynamic json) {
    _id = json['id'];
    _name = json['name'];
    _phonePrefix = json['phone_prefix'];
  }
  num? _id;
  String? _name;
  num? _phonePrefix;
  Countries copyWith({  num? id,
    String? name,
    num? phonePrefix,
  }) => Countries(  id: id ?? _id,
    name: name ?? _name,
    phonePrefix: phonePrefix ?? _phonePrefix,
  );
  num? get id => _id;
  String? get name => _name;
  num? get phonePrefix => _phonePrefix;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['id'] = _id;
    map['name'] = _name;
    map['phone_prefix'] = _phonePrefix;
    return map;
  }

}