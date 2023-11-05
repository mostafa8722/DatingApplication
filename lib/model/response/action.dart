import 'dart:convert';
/// id : 20
/// full_name : "Ariu Sls"
/// profile : "http://dating.ultimatesoft.co/uploads/profiles/default/user.png"
/// banner : "http://dating.ultimatesoft.co/uploads/profiles/default/user.png"
/// age : 25
/// description : null
/// created_at : "2023-01-03T04:31:22.000000Z"

Action actionFromJson(String str) => Action.fromJson(json.decode(str));
String actionToJson(Action data) => json.encode(data.toJson());
class Action {
  Action({
      int? id,
      String? fullName, 
      String? profile, 
      String? banner, 
      int? age,
      String? description,
      String? createdAt,}){
    _id = id;
    _fullName = fullName;
    _profile = profile;
    _banner = banner;
    _age = age;
    _description = description;
    _createdAt = createdAt;
}

  Action.fromJson(dynamic json) {
    _id = json['id'];
    _fullName = json['full_name'];
    _profile = json['profile'];
    _banner = json['banner'];
    _age = json['age'];
    _description = json['description'];
    _createdAt = json['created_at'];
  }
  int? _id;
  String? _fullName;
  String? _profile;
  String? _banner;
  int? _age;
  String? _description;
  String? _createdAt;
Action copyWith({
  int? id,
  String? fullName,
  String? profile,
  String? banner,
  int? age,
  String? description,
  String? createdAt,
}) => Action(
  id: id ?? _id,
  fullName: fullName ?? _fullName,
  profile: profile ?? _profile,
  banner: banner ?? _banner,
  age: age ?? _age,
  description: description ?? _description,
  createdAt: createdAt ?? _createdAt,
);
  int? get id => _id;
  String? get fullName => _fullName;
  String? get profile => _profile;
  String? get banner => _banner;
  int? get age => _age;
  String? get description => _description;
  String? get createdAt => _createdAt;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['id'] = _id;
    map['full_name'] = _fullName;
    map['profile'] = _profile;
    map['banner'] = _banner;
    map['age'] = _age;
    map['description'] = _description;
    map['created_at'] = _createdAt;
    return map;
  }

}