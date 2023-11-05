

import 'token.dart';
import 'user.dart';

class LoginModel {
  LoginModel({
      this.user, 
      this.token,});

  LoginModel.fromJson(dynamic json) {
    user = json['user'] != null ? User.fromJson(json['user']) : null;
    token = json['token'] != null ? Token.fromJson(json['token']) : null;
  }
  User? user;
  Token? token;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    if (user != null) {
      map['user'] = user?.toJson();
    }
    if (token != null) {
      map['token'] = token?.toJson();
    }
    return map;
  }

}