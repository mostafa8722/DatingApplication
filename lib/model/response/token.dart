import 'Original.dart';

class Token {
  Token({
    this.headers,
    this.original,
    this.exception,});

  Token.fromJson(dynamic json) {
    headers = json['headers'];
    original = json['original'] != null ? Original.fromJson(json['original']) : null;
    exception = json['exception'];
  }
  dynamic headers;
  Original? original;
  dynamic exception;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['headers'] = headers;
    if (original != null) {
      map['original'] = original?.toJson();
    }
    map['exception'] = exception;
    return map;
  }

}