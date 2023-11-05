
import 'user.dart';

/// target_blocked_me : false
/// target_is_blocked : false
/// target_is_contact : false
/// already_request_sent : false
/// user_favored_target : false
/// target_favored_user : false
/// user_liked_target : false
/// target_liked_user : false
/// target : {"id":10,"first_name":"Bettye Jakubowski","last_name":"Goodwin","full_name":"Bettye Jakubowski Goodwin","description":null,"profile":"http://panel.lover369.com/fake_image/5.jpeg","banner":"http://panel.lover369.com/fake_image/back.webp","phone":null,"email":"bertrand95@example.com","referral_code":"1505871088","referral_id":null,"wallet":"0","locale":null,"gender":"FEMALE","suspended_at":null,"lat":"-35.205797","lng":"-17.479978","interests":[],"view":0,"latest_searches":[],"gallery":[],"attribute_values":[{"attribute":{"id":1,"type":"text","title":[{"en":"Smoke?"},{"far":"اهل سیگار هستید؟"}],"required":false,"options":[]},"value":null},{"attribute":{"id":2,"type":"text","title":[{"en":"You favorite hair color?"},{"far":"رنگ موی مورد علاقه شما؟"}],"required":false,"options":[]},"value":null},{"attribute":{"id":3,"type":"text","title":[{"en":"Favorite food?"},{"far":"غذای مورد علاقه؟"}],"required":false,"options":[]},"value":null},{"attribute":{"id":4,"type":"text","title":[{"en":"Alcohol"},{"far":"الکل"}],"required":false,"options":[]},"value":null},{"attribute":{"id":13,"type":"text","title":[{"en":"Kids"},{"far":"Kids"},{"fr":"Kids"},{"es":"Kids"},{"it":"Kids"},{"ar":"Kids"},{"ro":"Kids"},{"ru":"Kids"},{"bg":"Kids"},{"zh":"Kids"},{"nl":"Kids"},{"de":"Kid"}],"required":false,"options":[]},"value":null}],"birth_day":null,"looking_for_description":null,"looking_for_gender":null,"looking_for_age_gte":null,"looking_for_age_lte":null,"age":null,"created_at":"2023-01-14T19:10:23.000000Z","phone_verified_at":false,"human_verified_at":false,"email_verified_at":false,"voice_call_sec":0,"video_call_sec":0,"last_seen_at":null,"country":null}

class ChatUser {
  ChatUser({
      bool? targetBlockedMe, 
      bool? targetIsBlocked, 
      bool? targetIsContact, 
      bool? alreadyRequestSent, 
      bool? userFavoredTarget, 
      bool? targetFavoredUser, 
      bool? userLikedTarget, 
      bool? targetLikedUser,
    User? target,}){
    _targetBlockedMe = targetBlockedMe;
    _targetIsBlocked = targetIsBlocked;
    _targetIsContact = targetIsContact;
    _alreadyRequestSent = alreadyRequestSent;
    _userFavoredTarget = userFavoredTarget;
    _targetFavoredUser = targetFavoredUser;
    _userLikedTarget = userLikedTarget;
    _targetLikedUser = targetLikedUser;
    _target = target;
}

  ChatUser.fromJson(dynamic json) {
    _targetBlockedMe = json['target_blocked_me'];
    _targetIsBlocked = json['target_is_blocked'];
    _targetIsContact = json['target_is_contact'];
    _alreadyRequestSent = json['already_request_sent'];
    _userFavoredTarget = json['user_favored_target'];
    _targetFavoredUser = json['target_favored_user'];
    _userLikedTarget = json['user_liked_target'];
    _targetLikedUser = json['target_liked_user'];
    _target = json['target'] != null ? User.fromJson(json['target']) : null;
  }
  bool? _targetBlockedMe;
  bool? _targetIsBlocked;
  bool? _targetIsContact;
  bool? _alreadyRequestSent;
  bool? _userFavoredTarget;
  bool? _targetFavoredUser;
  bool? _userLikedTarget;
  bool? _targetLikedUser;
  User? _target;
ChatUser copyWith({  bool? targetBlockedMe,
  bool? targetIsBlocked,
  bool? targetIsContact,
  bool? alreadyRequestSent,
  bool? userFavoredTarget,
  bool? targetFavoredUser,
  bool? userLikedTarget,
  bool? targetLikedUser,
  User? target,
}) => ChatUser(  targetBlockedMe: targetBlockedMe ?? _targetBlockedMe,
  targetIsBlocked: targetIsBlocked ?? _targetIsBlocked,
  targetIsContact: targetIsContact ?? _targetIsContact,
  alreadyRequestSent: alreadyRequestSent ?? _alreadyRequestSent,
  userFavoredTarget: userFavoredTarget ?? _userFavoredTarget,
  targetFavoredUser: targetFavoredUser ?? _targetFavoredUser,
  userLikedTarget: userLikedTarget ?? _userLikedTarget,
  targetLikedUser: targetLikedUser ?? _targetLikedUser,
  target: target ?? _target,
);
  bool? get targetBlockedMe => _targetBlockedMe;
  bool? get targetIsBlocked => _targetIsBlocked;
  bool? get targetIsContact => _targetIsContact;
  bool? get alreadyRequestSent => _alreadyRequestSent;
  bool? get userFavoredTarget => _userFavoredTarget;
  bool? get targetFavoredUser => _targetFavoredUser;
  bool? get userLikedTarget => _userLikedTarget;
  bool? get targetLikedUser => _targetLikedUser;
  User? get target => _target;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['target_blocked_me'] = _targetBlockedMe;
    map['target_is_blocked'] = _targetIsBlocked;
    map['target_is_contact'] = _targetIsContact;
    map['already_request_sent'] = _alreadyRequestSent;
    map['user_favored_target'] = _userFavoredTarget;
    map['target_favored_user'] = _targetFavoredUser;
    map['user_liked_target'] = _userLikedTarget;
    map['target_liked_user'] = _targetLikedUser;
    if (_target != null) {
      map['target'] = _target?.toJson();
    }
    return map;
  }

}

/// attribute : {"id":1,"type":"text","title":[{"en":"Smoke?"},{"far":"اهل سیگار هستید؟"}],"required":false,"options":[]}
/// value : null

class AttributeValues {
  AttributeValues({
      Attribute? attribute, 
      dynamic value,}){
    _attribute = attribute;
    _value = value;
}

  AttributeValues.fromJson(dynamic json) {
    _attribute = json['attribute'] != null ? Attribute.fromJson(json['attribute']) : null;
    _value = json['value'];
  }
  Attribute? _attribute;
  dynamic _value;
AttributeValues copyWith({  Attribute? attribute,
  dynamic value,
}) => AttributeValues(  attribute: attribute ?? _attribute,
  value: value ?? _value,
);
  Attribute? get attribute => _attribute;
  dynamic get value => _value;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    if (_attribute != null) {
      map['attribute'] = _attribute?.toJson();
    }
    map['value'] = _value;
    return map;
  }

}

/// id : 1
/// type : "text"
/// title : [{"en":"Smoke?"},{"far":"اهل سیگار هستید؟"}]
/// required : false
/// options : []

class Attribute {
  Attribute({
      num? id, 
      String? type, 
      List<Title>? title, 
      bool? required, 
      List<dynamic>? options,}){
    _id = id;
    _type = type;
    _title = title;
    _required = required;
    _options = options;
}

  Attribute.fromJson(dynamic json) {
    _id = json['id'];
    _type = json['type'];
    if (json['title'] != null) {
      _title = [];
      json['title'].forEach((v) {
        _title?.add(Title.fromJson(v));
      });
    }
    _required = json['required'];
    if (json['options'] != null) {
      _options = [];
      json['options'].forEach((v) {
        // _options?.add(Dynamic.fromJson(v));
      });
    }
  }
  num? _id;
  String? _type;
  List<Title>? _title;
  bool? _required;
  List<dynamic>? _options;
Attribute copyWith({  num? id,
  String? type,
  List<Title>? title,
  bool? required,
  List<dynamic>? options,
}) => Attribute(  id: id ?? _id,
  type: type ?? _type,
  title: title ?? _title,
  required: required ?? _required,
  options: options ?? _options,
);
  num? get id => _id;
  String? get type => _type;
  List<Title>? get title => _title;
  bool? get required => _required;
  List<dynamic>? get options => _options;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['id'] = _id;
    map['type'] = _type;
    if (_title != null) {
      map['title'] = _title?.map((v) => v.toJson()).toList();
    }
    map['required'] = _required;
    if (_options != null) {
      map['options'] = _options?.map((v) => v.toJson()).toList();
    }
    return map;
  }

}

/// en : "Smoke?"

class Title {
  Title({
      String? en,}){
    _en = en;
}

  Title.fromJson(dynamic json) {
    _en = json['en'];
  }
  String? _en;
Title copyWith({  String? en,
}) => Title(  en: en ?? _en,
);
  String? get en => _en;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['en'] = _en;
    return map;
  }

}