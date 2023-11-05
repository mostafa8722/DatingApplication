import 'dart:convert';
/// count : 2
/// users : [{"id":"b_xQF97Q3HZf2HFuADwU","full_name":"mohammad khoshkam","profile_image":"http://panel.lover369.com/uploads/profiles/36/profile/36.jpg","email":"khoshkam93.itsu@gmail.com","token":"Bearer eyJ0eXAiOiJKV1QiLCJhbGciOiJIUzI1NiJ9.eyJpc3MiOiJodHRwOi8vcGFuZWwubG92ZXIzNjkuY29tL2FwaS92MS9hdXRoL2xvZ2luIiwiaWF0IjoxNjc1MzI0NjgxLCJleHAiOjE2NzUzMjgyODEsIm5iZiI6MTY3NTMyNDY4MSwianRpIjoiZ0FpU3Bwa3l0c2hPc3o3MSIsInN1YiI6IjM2IiwicHJ2IjoiMjNiZDVjODk0OWY2MDBhZGIzOWU3MDFjNDAwODcyZGI3YTU5NzZmNyJ9.u8Tz2-93rxAEKGYgOYKfLXIU1kAlLA89OXtFc139Now","room":"global","permission":true,"wallet":9999760,"on_call":false,"voice_call_sec":2499940,"can_voice_call":true,"video_call_sec":1666626,"can_video_call":true,"active_call":null,"active_call_connection":null,"connections":["b_xQF97Q3HZf2HFuADwU"]}]

OnlineUsers onlineUserFromJson(String str) => OnlineUsers.fromJson(json.decode(str));
String onlineUserToJson(OnlineUsers data) => json.encode(data.toJson());
class OnlineUsers {
  OnlineUsers({
      int? count,
      List<OnlineUser>? users,}){
    _count = count;
    _users = users;
}

  OnlineUsers.fromJson(dynamic json) {
    _count = json['count'];
    if (json['users'] != null) {
      _users = [];
      json['users'].forEach((v) {
        _users?.add(OnlineUser.fromJson(v));
      });
    }
  }
  int? _count;
  List<OnlineUser>? _users;
OnlineUsers copyWith({  int? count,
  List<OnlineUser>? users,
}) => OnlineUsers(  count: count ?? _count,
  users: users ?? _users,
);
  int? get count => _count;
  List<OnlineUser>? get users => _users;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['count'] = _count;
    if (_users != null) {
      map['users'] = _users?.map((v) => v.toJson()).toList();
    }
    return map;
  }

}

/// id : "b_xQF97Q3HZf2HFuADwU"
/// full_name : "mohammad khoshkam"
/// profile_image : "http://panel.lover369.com/uploads/profiles/36/profile/36.jpg"
/// email : "khoshkam93.itsu@gmail.com"
/// token : "Bearer eyJ0eXAiOiJKV1QiLCJhbGciOiJIUzI1NiJ9.eyJpc3MiOiJodHRwOi8vcGFuZWwubG92ZXIzNjkuY29tL2FwaS92MS9hdXRoL2xvZ2luIiwiaWF0IjoxNjc1MzI0NjgxLCJleHAiOjE2NzUzMjgyODEsIm5iZiI6MTY3NTMyNDY4MSwianRpIjoiZ0FpU3Bwa3l0c2hPc3o3MSIsInN1YiI6IjM2IiwicHJ2IjoiMjNiZDVjODk0OWY2MDBhZGIzOWU3MDFjNDAwODcyZGI3YTU5NzZmNyJ9.u8Tz2-93rxAEKGYgOYKfLXIU1kAlLA89OXtFc139Now"
/// room : "global"
/// permission : true
/// wallet : 9999760
/// on_call : false
/// voice_call_sec : 2499940
/// can_voice_call : true
/// video_call_sec : 1666626
/// can_video_call : true
/// active_call : null
/// active_call_connection : null
/// connections : ["b_xQF97Q3HZf2HFuADwU"]

OnlineUser usersFromJson(String str) => OnlineUser.fromJson(json.decode(str));
String usersToJson(OnlineUser data) => json.encode(data.toJson());
class OnlineUser {
  OnlineUser({
      String? id, 
      String? fullName, 
      String? profileImage, 
      String? email, 
      String? token, 
      String? room, 
      bool? permission,
    dynamic? wallet,
      bool? onCall,
    int? voiceCallSec,
      bool? canVoiceCall,
    int? videoCallSec,
      bool? canVideoCall, 
      dynamic activeCall, 
      dynamic activeCallConnection, 
      List<String>? connections,}){
    _id = id;
    _fullName = fullName;
    _profileImage = profileImage;
    _email = email;
    _token = token;
    _room = room;
    _permission = permission;
    _wallet = wallet;
    _onCall = onCall;
    _voiceCallSec = voiceCallSec;
    _canVoiceCall = canVoiceCall;
    _videoCallSec = videoCallSec;
    _canVideoCall = canVideoCall;
    _activeCall = activeCall;
    _activeCallConnection = activeCallConnection;
    _connections = connections;
}

  OnlineUser.fromJson(dynamic json) {
    _id = json['id'];
    _fullName = json['full_name'];
    _profileImage = json['profile_image'];
    _email = json['email'];
    _token = json['token'];
    _room = json['room'];
    _permission = json['permission'];
    _wallet = json['wallet'];
    _onCall = json['on_call'];
    _voiceCallSec = json['voice_call_sec'];
    _canVoiceCall = json['can_voice_call'];
    _videoCallSec = json['video_call_sec'];
    _canVideoCall = json['can_video_call'];
    _activeCall = json['active_call'];
    _activeCallConnection = json['active_call_connection'];
    _connections = json['connections'] != null ? json['connections'].cast<String>() : [];
  }
  String? _id;
  String? _fullName;
  String? _profileImage;
  String? _email;
  String? _token;
  String? _room;
  bool? _permission;
  dynamic? _wallet;
  bool? _onCall;
  int? _voiceCallSec;
  bool? _canVoiceCall;
  int? _videoCallSec;
  bool? _canVideoCall;
  dynamic _activeCall;
  dynamic _activeCallConnection;
  List<String>? _connections;
OnlineUser copyWith({  String? id,
  String? fullName,
  String? profileImage,
  String? email,
  String? token,
  String? room,
  bool? permission,
  int? wallet,
  bool? onCall,
  int? voiceCallSec,
  bool? canVoiceCall,
  int? videoCallSec,
  bool? canVideoCall,
  dynamic activeCall,
  dynamic activeCallConnection,
  List<String>? connections,
}) => OnlineUser(  id: id ?? _id,
  fullName: fullName ?? _fullName,
  profileImage: profileImage ?? _profileImage,
  email: email ?? _email,
  token: token ?? _token,
  room: room ?? _room,
  permission: permission ?? _permission,
  wallet: wallet ?? _wallet,
  onCall: onCall ?? _onCall,
  voiceCallSec: voiceCallSec ?? _voiceCallSec,
  canVoiceCall: canVoiceCall ?? _canVoiceCall,
  videoCallSec: videoCallSec ?? _videoCallSec,
  canVideoCall: canVideoCall ?? _canVideoCall,
  activeCall: activeCall ?? _activeCall,
  activeCallConnection: activeCallConnection ?? _activeCallConnection,
  connections: connections ?? _connections,
);
  String? get id => _id;
  String? get fullName => _fullName;
  String? get profileImage => _profileImage;
  String? get email => _email;
  String? get token => _token;
  String? get room => _room;
  bool? get permission => _permission;
  dynamic? get wallet => _wallet;
  bool? get onCall => _onCall;
  int? get voiceCallSec => _voiceCallSec;
  bool? get canVoiceCall => _canVoiceCall;
  int? get videoCallSec => _videoCallSec;
  bool? get canVideoCall => _canVideoCall;
  dynamic get activeCall => _activeCall;
  dynamic get activeCallConnection => _activeCallConnection;
  List<String>? get connections => _connections;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['id'] = _id;
    map['full_name'] = _fullName;
    map['profile_image'] = _profileImage;
    map['email'] = _email;
    map['token'] = _token;
    map['room'] = _room;
    map['permission'] = _permission;
    map['wallet'] = _wallet;
    map['on_call'] = _onCall;
    map['voice_call_sec'] = _voiceCallSec;
    map['can_voice_call'] = _canVoiceCall;
    map['video_call_sec'] = _videoCallSec;
    map['can_video_call'] = _canVideoCall;
    map['active_call'] = _activeCall;
    map['active_call_connection'] = _activeCallConnection;
    map['connections'] = _connections;
    return map;
  }

}