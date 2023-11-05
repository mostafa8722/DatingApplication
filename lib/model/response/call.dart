import 'dart:convert';
/// error : false
/// call_info : {"user_email":"khohkam92.itsu@gmail.com","user_full_name":"troll warlord","user_profile":"http://panel.lover369.com/uploads/profiles/default/user.png","user_active_connection":"Gu4Z8B2bMs41gAgpAXE8","user_uid":60692,"userToken":"006c10b1c0830af4ba99bf5d4ff77e6ad21IAA6QmRqL4sPoQaeeCo7UL4hHBpnZI8n8toSUw06IbYG5ohnzKqCB93+IgCtK9CZ2OnWYwQAAQDIn9VjAgDIn9VjAwDIn9VjBADIn9Vj","target_email":"khoshkam93.itsu@gmail.com","target_full_name":"mohammad khoshkam","target_profile":"http://panel.lover369.com/uploads/profiles/36/profile/36.jpg","target_active_connection":null,"targetToken":"006c10b1c0830af4ba99bf5d4ff77e6ad21IAA1EumYwm3sBpEKrSE+Tl/UL4dkruMmPj4GmZEejfH+ZYhnzKonAg0zIgCtK9CZ2OnWYwQAAQDIn9VjAgDIn9VjAwDIn9VjBADIn9Vj","target_uid":84636,"callChannelName":"7C0ojR00kX","appID":"c10b1c0830af4ba99bf5d4ff77e6ad21","status":"Cancelled","type":"VOICE","created_at":1674942552895,"started_at":null,"end_at":null}

Call callFromJson(String str) => Call.fromJson(json.decode(str));
String callToJson(Call data) => json.encode(data.toJson());
class Call {
  Call({
      bool? error, 
      CallInfo? callInfo,}){
    _error = error;
    _callInfo = callInfo;
}

  Call.fromJson(dynamic json) {
    _error = json['error'];
    _callInfo = json['call_info'] != null ? CallInfo.fromJson(json['call_info']) : null;
  }
  bool? _error;
  CallInfo? _callInfo;
Call copyWith({  bool? error,
  CallInfo? callInfo,
}) => Call(  error: error ?? _error,
  callInfo: callInfo ?? _callInfo,
);
  bool? get error => _error;
  CallInfo? get callInfo => _callInfo;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['error'] = _error;
    if (_callInfo != null) {
      map['call_info'] = _callInfo?.toJson();
    }
    return map;
  }

}

/// user_email : "khohkam92.itsu@gmail.com"
/// user_full_name : "troll warlord"
/// user_profile : "http://panel.lover369.com/uploads/profiles/default/user.png"
/// user_active_connection : "Gu4Z8B2bMs41gAgpAXE8"
/// user_uid : 60692
/// userToken : "006c10b1c0830af4ba99bf5d4ff77e6ad21IAA6QmRqL4sPoQaeeCo7UL4hHBpnZI8n8toSUw06IbYG5ohnzKqCB93+IgCtK9CZ2OnWYwQAAQDIn9VjAgDIn9VjAwDIn9VjBADIn9Vj"
/// target_email : "khoshkam93.itsu@gmail.com"
/// target_full_name : "mohammad khoshkam"
/// target_profile : "http://panel.lover369.com/uploads/profiles/36/profile/36.jpg"
/// target_active_connection : null
/// targetToken : "006c10b1c0830af4ba99bf5d4ff77e6ad21IAA1EumYwm3sBpEKrSE+Tl/UL4dkruMmPj4GmZEejfH+ZYhnzKonAg0zIgCtK9CZ2OnWYwQAAQDIn9VjAgDIn9VjAwDIn9VjBADIn9Vj"
/// target_uid : 84636
/// callChannelName : "7C0ojR00kX"
/// appID : "c10b1c0830af4ba99bf5d4ff77e6ad21"
/// status : "Cancelled"
/// type : "VOICE"
/// created_at : 1674942552895
/// started_at : null
/// end_at : null

CallInfo callInfoFromJson(String str) => CallInfo.fromJson(json.decode(str));
String callInfoToJson(CallInfo data) => json.encode(data.toJson());
class CallInfo {
  CallInfo({
      String? userEmail, 
      String? userFullName, 
      String? userProfile, 
      String? userActiveConnection, 
      int? userUid,
      String? userToken, 
      String? targetEmail, 
      String? targetFullName, 
      String? targetProfile, 
      dynamic targetActiveConnection, 
      String? targetToken,
    int? targetUid,
      String? callChannelName, 
      String? appID, 
      String? status, 
      String? type,
    int? createdAt,
      dynamic startedAt, 
      dynamic endAt,}){
    _userEmail = userEmail;
    _userFullName = userFullName;
    _userProfile = userProfile;
    _userActiveConnection = userActiveConnection;
    _userUid = userUid;
    _userToken = userToken;
    _targetEmail = targetEmail;
    _targetFullName = targetFullName;
    _targetProfile = targetProfile;
    _targetActiveConnection = targetActiveConnection;
    _targetToken = targetToken;
    _targetUid = targetUid;
    _callChannelName = callChannelName;
    _appID = appID;
    _status = status;
    _type = type;
    _createdAt = createdAt;
    _startedAt = startedAt;
    _endAt = endAt;
}

  CallInfo.fromJson(dynamic json) {
    _userEmail = json['user_email'];
    _userFullName = json['user_full_name'];
    _userProfile = json['user_profile'];
    _userActiveConnection = json['user_active_connection'];
    _userUid = json['user_uid'];
    _userToken = json['userToken'];
    _targetEmail = json['target_email'];
    _targetFullName = json['target_full_name'];
    _targetProfile = json['target_profile'];
    _targetActiveConnection = json['target_active_connection'];
    _targetToken = json['targetToken'];
    _targetUid = json['target_uid'];
    _callChannelName = json['callChannelName'];
    _appID = json['appID'];
    _status = json['status'];
    _type = json['type'];
    _createdAt = json['created_at'];
    _startedAt = json['started_at'];
    _endAt = json['end_at'];
  }
  String? _userEmail;
  String? _userFullName;
  String? _userProfile;
  String? _userActiveConnection;
  int? _userUid;
  String? _userToken;
  String? _targetEmail;
  String? _targetFullName;
  String? _targetProfile;
  dynamic _targetActiveConnection;
  String? _targetToken;
  int? _targetUid;
  String? _callChannelName;
  String? _appID;
  String? _status;
  String? _type;
  int? _createdAt;
  dynamic _startedAt;
  dynamic _endAt;
CallInfo copyWith({  String? userEmail,
  String? userFullName,
  String? userProfile,
  String? userActiveConnection,
  int? userUid,
  String? userToken,
  String? targetEmail,
  String? targetFullName,
  String? targetProfile,
  dynamic targetActiveConnection,
  String? targetToken,
  int? targetUid,
  String? callChannelName,
  String? appID,
  String? status,
  String? type,
  int? createdAt,
  dynamic startedAt,
  dynamic endAt,
}) => CallInfo(  userEmail: userEmail ?? _userEmail,
  userFullName: userFullName ?? _userFullName,
  userProfile: userProfile ?? _userProfile,
  userActiveConnection: userActiveConnection ?? _userActiveConnection,
  userUid: userUid ?? _userUid,
  userToken: userToken ?? _userToken,
  targetEmail: targetEmail ?? _targetEmail,
  targetFullName: targetFullName ?? _targetFullName,
  targetProfile: targetProfile ?? _targetProfile,
  targetActiveConnection: targetActiveConnection ?? _targetActiveConnection,
  targetToken: targetToken ?? _targetToken,
  targetUid: targetUid ?? _targetUid,
  callChannelName: callChannelName ?? _callChannelName,
  appID: appID ?? _appID,
  status: status ?? _status,
  type: type ?? _type,
  createdAt: createdAt ?? _createdAt,
  startedAt: startedAt ?? _startedAt,
  endAt: endAt ?? _endAt,
);
  String? get userEmail => _userEmail;
  String? get userFullName => _userFullName;
  String? get userProfile => _userProfile;
  String? get userActiveConnection => _userActiveConnection;
  int? get userUid => _userUid;
  String? get userToken => _userToken;
  String? get targetEmail => _targetEmail;
  String? get targetFullName => _targetFullName;
  String? get targetProfile => _targetProfile;
  dynamic get targetActiveConnection => _targetActiveConnection;
  String? get targetToken => _targetToken;
  int? get targetUid => _targetUid;
  String? get callChannelName => _callChannelName;
  String? get appID => _appID;
  String? get status => _status;
  String? get type => _type;
  int? get createdAt => _createdAt;
  dynamic get startedAt => _startedAt;
  dynamic get endAt => _endAt;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['user_email'] = _userEmail;
    map['user_full_name'] = _userFullName;
    map['user_profile'] = _userProfile;
    map['user_active_connection'] = _userActiveConnection;
    map['user_uid'] = _userUid;
    map['userToken'] = _userToken;
    map['target_email'] = _targetEmail;
    map['target_full_name'] = _targetFullName;
    map['target_profile'] = _targetProfile;
    map['target_active_connection'] = _targetActiveConnection;
    map['targetToken'] = _targetToken;
    map['target_uid'] = _targetUid;
    map['callChannelName'] = _callChannelName;
    map['appID'] = _appID;
    map['status'] = _status;
    map['type'] = _type;
    map['created_at'] = _createdAt;
    map['started_at'] = _startedAt;
    map['end_at'] = _endAt;
    return map;
  }

}