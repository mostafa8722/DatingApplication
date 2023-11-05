import 'dart:convert';
/// title : ""
/// icon : ""

LabelFakeModel labelFakeModelFromJson(String str) => LabelFakeModel.fromJson(json.decode(str));
String labelFakeModelToJson(LabelFakeModel data) => json.encode(data.toJson());
class LabelFakeModel {
  LabelFakeModel({
      String? title, 
      String? icon,}){
    _title = title;
    _icon = icon;
}

  LabelFakeModel.fromJson(dynamic json) {
    _title = json['title'];
    _icon = json['icon'];
  }
  String? _title;
  String? _icon;
LabelFakeModel copyWith({  String? title,
  String? icon,
}) => LabelFakeModel(  title: title ?? _title,
  icon: icon ?? _icon,
);
  String? get title => _title;
  String? get icon => _icon;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['title'] = _title;
    map['icon'] = _icon;
    return map;
  }

}