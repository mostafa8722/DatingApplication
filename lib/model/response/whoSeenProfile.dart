import 'dart:convert';
/// count : 1
/// data : null

ActionCount whoSeenProfileFromJson(String str) => ActionCount.fromJson(json.decode(str));
String whoSeenProfileToJson(ActionCount data) => json.encode(data.toJson());
class ActionCount {
  ActionCount({
      num? count, 
      dynamic data,}){
    _count = count;
    _data = data;
}

  ActionCount.fromJson(dynamic json) {
    _count = json['count'];
    _data = json['data'];
  }
  num? _count;
  dynamic _data;
ActionCount copyWith({  num? count,
  dynamic data,
}) => ActionCount(  count: count ?? _count,
  data: data ?? _data,
);
  num? get count => _count;
  dynamic get data => _data;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['count'] = _count;
    map['data'] = _data;
    return map;
  }

}