import 'package:dio/dio.dart';
import 'package:get/get_connect/connect.dart';

import '../utils/log.dart';

class BaseSocket{
  static MessageChannel messageChannel = MessageChannel();
  static CallChannel callChannel = CallChannel();
  static UserChannel userChannel = UserChannel();
  static const socketUrl = "https://socket.lover369.com";
}

class MessageChannel{
  final updateMessage = "update_message";
  final message = "message";
  final seenMessage = "seen_message";
  final typing = "type";
}

class CallChannel{
  final callRequest = "call_request";
  final incomingCall = "incomming_call";
  final acceptIncomingCall = "accept_incomming_call";
  final rejectIncomingCall = "reject_incomming_call";
  final endCall = "end_call";
}

class UserChannel{
  final onlineUsers = "online_users";
}