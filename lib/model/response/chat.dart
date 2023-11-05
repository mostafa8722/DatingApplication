import 'dart:convert';

import 'chatUser.dart';

/// id : 12
/// user_id : 40
/// target_id : 1
/// sender_user : {"id":40,"full_name":" ","profile":"http://dating.ultimatesoft.co/uploads/profiles/default/user.png","banner":"http://dating.ultimatesoft.co/fake_image/back.webp","age":null,"description":null,"created_at":"2023-01-10T19:08:41.000000Z"}
/// message : "Hello"
/// file : "http://dating.ultimatesoft.co/uploads/no_image.jpeg"
/// type : "CHAT"
/// seen : false
/// sent : false
/// date : "2023-01-10T20:41:36.000000Z"
/// reactions : []
/// send_or_receive : "SEND"

Chat chatFromJson(String str) => Chat.fromJson(json.decode(str));
String chatToJson(Chat data) => json.encode(data.toJson());
class Chat {
  Chat({
    int? id,
    int? userId,
    int? targetId,
      ChatUser? senderUser,
      dynamic message,
      String? file, 
      String? type, 
      bool? seen, 
      bool? sent, 
      String? date, 
      List<dynamic>? reactions, 
      String? sendOrReceive,}){
    _id = id;
    _userId = userId;
    _targetId = targetId;
    _senderUser = senderUser;
    _message = message;
    _file = file;
    _type = type;
    _seen = seen;
    _sent = sent;
    _date = date;
    _reactions = reactions;
    _sendOrReceive = sendOrReceive;
}

  Chat.fromJson(dynamic json) {
    _id = json['id'];
    _userId = json['user_id'];
    _targetId = json['target_id'];
    _senderUser = json['sender_user'] != null ? ChatUser.fromJson(json['sender_user']) : null;
    _message = json['message'];
    _file = json['file'];
    _type = json['type'];
    _seen = json['seen'];
    _sent = json['sent'];
    _date = json['date'];
    // if (json['reactions'] != null) {
    //   _reactions = [];
    //   json['reactions'].forEach((v) {
    //     _reactions?.add(Dynamic.fromJson(v));
    //   });
    // }
    _sendOrReceive = json['send_or_receive'];
  }

  Chat.fromJsonForSeen(dynamic json,String userEmail,String targetEmail,) {
    _id = json['id'];
    _userId = json['user_id'];
    _targetId = json['target_id'];
    _userEmail = userEmail;
    _targetEmail = targetEmail;
    _senderUser = json['sender_user'] != null ? ChatUser.fromJson(json['sender_user']) : null;
    _message = json['message'];
    _file = json['file'];
    _type = json['type'];
    _seen = json['seen'];
    _sent = json['sent'];
    _date = json['date'];
    // if (json['reactions'] != null) {
    //   _reactions = [];
    //   json['reactions'].forEach((v) {
    //     _reactions?.add(Dynamic.fromJson(v));
    //   });
    // }
    _sendOrReceive = json['send_or_receive'];
  }

  int? _id;
  int? _userId;
  int? _targetId;
  ChatUser? _senderUser;
  dynamic _message;
  dynamic _userEmail;
  dynamic _targetEmail;
  String? _file;
  String? _type;
  bool? _seen;
  bool? _sent;
  String? _date;
  List<dynamic>? _reactions;
  String? _sendOrReceive;
Chat copyWith({  int? id,
  int? userId,
  int? targetId,
  ChatUser? senderUser,
  dynamic message,
  String? file,
  String? type,
  bool? seen,
  bool? sent,
  String? date,
  List<dynamic>? reactions,
  String? sendOrReceive,
}) => Chat(  id: id ?? _id,
  userId: userId ?? _userId,
  targetId: targetId ?? _targetId,
  senderUser: senderUser ?? _senderUser,
  message: message ?? _message,
  file: file ?? _file,
  type: type ?? _type,
  seen: seen ?? _seen,
  sent: sent ?? _sent,
  date: date ?? _date,
  reactions: reactions ?? _reactions,
  sendOrReceive: sendOrReceive ?? _sendOrReceive,
);
  int? get id => _id;
  int? get userId => _userId;
  int? get targetId => _targetId;
  ChatUser? get senderUser => _senderUser;
  dynamic get message => _message;
  String? get file => _file;
  String? get type => _type;
  bool? get seen => _seen;
  bool? get sent => _sent;
  String? get date => _date;
  List<dynamic>? get reactions => _reactions;
  String? get sendOrReceive => _sendOrReceive;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['id'] = _id;
    map['user_id'] = _userId;
    map['target_id'] = _targetId;
    if (_senderUser != null) {
      map['sender_user'] = _senderUser?.toJson();
    }
    map['message'] = _message;
    map['user_email'] = _userEmail;
    map['target_email'] = _targetEmail;
    map['file'] = _file;
    map['type'] = _type;
    map['seen'] = _seen;
    map['sent'] = _sent;
    map['date'] = _date;
    if (_reactions != null) {
      map['reactions'] = _reactions?.map((v) => v.toJson()).toList();
    }
    map['send_or_receive'] = _sendOrReceive;
    return map;
  }

}