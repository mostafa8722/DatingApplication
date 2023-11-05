import 'dart:convert';

LatestSearches latestSearchesFromJson(String str) => LatestSearches.fromJson(json.decode(str));
String latestSearchesToJson(LatestSearches data) => json.encode(data.toJson());
class LatestSearches {
  LatestSearches({
    String? key,}){
    _key = key;
  }

  LatestSearches.fromJson(dynamic json) {
    _key = json['key'];
  }
  String? _key;
  LatestSearches copyWith({  String? key,
  }) => LatestSearches(  key: key ?? _key,
  );
  String? get key => _key;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['key'] = _key;
    return map;
  }

}