import 'dart:convert';

import 'meta.dart';


/// status : true
/// message : "Login success"
/// data : {}
/// errors : {}
/// links : {}
/// meta : {}

ResponseModel responseFromJson(String str) => ResponseModel.fromJson(json.decode(str));
String responseToJson(ResponseModel data) => json.encode(data.toJson());
class ResponseModel {
  ResponseModel({
      bool? status,
      String? message,
      dynamic data,
      Map<String, dynamic>? errors,
      // Links? links,
      Meta? meta}){
    _status = status;
    _message = message;
    _data = data;
    _errors = errors;
}

  ResponseModel.fromJson(dynamic json) {
    _status = json['status'];
    _message = json['message'];
    _data = json['data'];
    _errors = json['errors'];
    // _links = json['links'];
    _meta = json['meta'] != null ? Meta.fromJson(json['meta']):null;
  }
  bool? _status;
  String? _message;
  dynamic _data;
  Map<String, dynamic>? _errors;
  // Links? _links;
  Meta? _meta;

ResponseModel copyWith({  bool? status,
  String? message,
  dynamic data,
  Map<String, List<String>>? errors,
  Links? links,
  Meta? meta
}) => ResponseModel(  status: status ?? _status,
  message: message ?? _message,
  data: data ?? _data,
  errors: errors ?? _errors,
   // links : links ?? _links,
    meta: meta ?? _meta
);
  bool? get status => _status;
  String? get message => _message;
  dynamic get data => _data;
  Map<String, dynamic>? get errors => _errors;
  // Links? links;
  Meta? meta;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['status'] = _status;
    map['message'] = _message;
    map['data'] = _data;
    map['errors'] = _errors;
    // map['links'] = _links;
    map['meta'] = _meta;
    return map;
  }

}