import 'Attribute.dart';

class AttributeValues {
  AttributeValues({
      this.attribute, 
      this.value,});

  AttributeValues.fromJson(dynamic json) {
    attribute = json['attribute'] != null ? Attribute.fromJson(json['attribute']) : null;
    value = json['value'];
  }
  Attribute? attribute;
  dynamic value;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    if (attribute != null) {
      map['attribute'] = attribute?.toJson();
    }
    map['value'] = value;
    return map;
  }

}