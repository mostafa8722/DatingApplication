import 'dart:convert';
/// name : ""
/// status : ""
/// distance : ""

UserFakeModel userFakeModelFromJson(String str) => UserFakeModel.fromJson(json.decode(str));
String userFakeModelToJson(UserFakeModel data) => json.encode(data.toJson());
class UserFakeModel {
  UserFakeModel({
      String? name, 
      String? status, 
      String? distance,}){
    _name = name;
    _status = status;
    _distance = distance;
}

  UserFakeModel.fromJson(dynamic json) {
    _name = json['name'];
    _status = json['status'];
    _distance = json['distance'];
  }
  String? _name;
  String? _status;
  String? _distance;
UserFakeModel copyWith({  String? name,
  String? status,
  String? distance,
}) => UserFakeModel(  name: name ?? _name,
  status: status ?? _status,
  distance: distance ?? _distance,
);
  String? get name => _name;
  String? get status => _status;
  String? get distance => _distance;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['name'] = _name;
    map['status'] = _status;
    map['distance'] = _distance;
    return map;
  }

}