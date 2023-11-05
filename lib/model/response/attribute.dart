import 'Title.dart';

class Attribute {
  Attribute({
      required this.id,
      required this.type,
      required this.title,
      required this.required,
      required this.options,});

  Attribute.fromJson(dynamic json) {
    id = json['id'];
    type = json['type'];
    if (json['title'] != null) {
      title = [];
      json['title'].forEach((v) {
        title.add(Title.fromJson(v));
      });
    }
    required = json['required'];
    if (json['options'] != null) {
      options = [];
      json['options'].forEach((v) {
        // options.add(Dynamic.fromJson(v));//todo
      });
    }
  }
  late int id;
  late String type;
  late List<Title> title;
  late bool required;
  late List<dynamic> options;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['id'] = id;
    map['type'] = type;
    if (title != null) {
      map['title'] = title.map((v) => v.toJson()).toList();
    }
    map['required'] = required;
    if (options != null) {
      map['options'] = options.map((v) => v.toJson()).toList();
    }
    return map;
  }

}