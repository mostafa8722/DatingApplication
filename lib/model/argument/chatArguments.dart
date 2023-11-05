import 'dart:convert';

import 'package:Lover369/model/response/conversation.dart';
import 'package:Lover369/model/response/signlePeople.dart';

import '../response/onlineUser.dart';
import '../response/user.dart';

/// id : 1
/// name : ""
/// profile : ""

ChatArguments chatArgumentsFromJson(String str) => ChatArguments.fromJson(json.decode(str));
String chatArgumentsToJson(ChatArguments data) => json.encode(data.toJson());
class ChatArguments {
  ChatArguments({
      int? id,
      String? name, 
      String? profile,
      String? email,}){
    _id = id;
    _name = name;
    _profile = profile;
    _email = email;
}

  ChatArguments.fromJson(dynamic json) {
    _id = json['id'];
    _name = json['name'];
    _profile = json['profile'];
    _email = json['email'];
  }

  ChatArguments.fromUser(User user) {
    _id = user.id;
    _name = user.fullName;
    _profile = user.profile;
    _email = user.email;
  }

  ChatArguments.fromSinglePeople(SinglePeople singlePeople) {
    _id = singlePeople.target!.id;
    _name = singlePeople.target!.fullName;
    _profile = singlePeople.target!.profile;
    _email = singlePeople.target!.email;
  }

  ChatArguments.fromConversation(Conversation conversation) {
    _id = conversation.user?.target?.id;
    _name = conversation.user?.target?.fullName;
    _profile = conversation.user?.target?.profile;
    _email = conversation.user?.target?.email;
  }

  ChatArguments.fromOnlineUser(OnlineUser onlineUser) {
    _id = 0;//onlineUser.;
    _name = onlineUser.fullName;
    _profile = onlineUser.profileImage;
    _email = onlineUser.email;
  }

  int? _id;
  String? _name;
  String? _profile;
  String? _email;
ChatArguments copyWith({  int? id,
  String? name,
  String? profile,
  String? email,
}) => ChatArguments(  id: id ?? _id,
  name: name ?? _name,
  profile: profile ?? _profile,
  email: email ?? _email,
);
  int? get id => _id;
  String? get name => _name;
  String? get profile => _profile;
  String? get email => _email;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['id'] = _id;
    map['name'] = _name;
    map['profile'] = _profile;
    map['email'] = _email;
    return map;
  }

}