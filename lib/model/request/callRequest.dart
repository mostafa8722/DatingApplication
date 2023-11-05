import 'dart:convert';
/// to_mail : "targetEmail"
/// type : "VOICE"

CallRequest callRequestFromJson(String str) => CallRequest.fromJson(json.decode(str));
String callRequestToJson(CallRequest data) => json.encode(data.toJson());
class CallRequest {
  CallRequest({
      String? toMail, 
      String? type,}){
    _toMail = toMail;
    _type = type;
}

  CallRequest.fromJson(dynamic json) {
    _toMail = json['to_email'];
    _type = json['type'];
  }
  String? _toMail;
  String? _type;
CallRequest copyWith({  String? toMail,
  String? type,
}) => CallRequest(  toMail: toMail ?? _toMail,
  type: type ?? _type,
);
  String? get toMail => _toMail;
  String? get type => _type;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['to_email'] = _toMail;
    map['type'] = _type;
    return map;
  }

}