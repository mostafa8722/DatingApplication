import 'dart:convert';

import 'user.dart';

/// target_blocked_me : false
/// target_is_blocked : false
/// target_is_contact : false
/// already_request_sent : true
/// user_favored_target : false
/// target_favored_user : false
/// user_liked_target : false
/// target_liked_user : false
/// target : {"id":1,"first_name":"Super Admin","last_name":"","full_name":"Super Admin ","description":null,"profile":"http://dating.ultimatesoft.co/uploads/profiles/default/user.png","banner":"http://dating.ultimatesoft.co/uploads/profiles/default/user.png","phone":null,"email":"superadmin@site.com","referral_code":"1918457851","referral_id":null,"wallet":0,"locale":null,"gender":null,"suspended_at":null,"lat":null,"lng":null,"interests":[],"view":3,"latest_searches":[],"gallery":[],"attribute_values":[{"attribute":{"id":1,"type":"password","title":[{"en":"nulla"}],"required":true,"options":[]},"value":null},{"attribute":{"id":2,"type":"number","title":[{"en":"ratione"}],"required":false,"options":[]},"value":null},{"attribute":{"id":3,"type":"password","title":[{"en":"assumenda"}],"required":false,"options":[]},"value":null},{"attribute":{"id":4,"type":"file","title":[{"en":"modi"}],"required":false,"options":[]},"value":null},{"attribute":{"id":5,"type":"number","title":[{"en":"doloribus"}],"required":false,"options":[]},"value":null},{"attribute":{"id":6,"type":"text","title":[{"en":"sint"}],"required":false,"options":[]},"value":null},{"attribute":{"id":7,"type":"number","title":[{"en":"dolorem"}],"required":false,"options":[]},"value":null},{"attribute":{"id":8,"type":"date","title":[{"en":"quaerat"}],"required":false,"options":[]},"value":null},{"attribute":{"id":9,"type":"datetime-local","title":[{"en":"molestiae"}],"required":false,"options":[]},"value":null},{"attribute":{"id":10,"type":"email","title":[{"en":"ut"}],"required":true,"options":[]},"value":null},{"attribute":{"id":11,"type":"checkbox","title":[{"en":"et"}],"required":false,"options":[]},"value":null},{"attribute":{"id":12,"type":"checkbox","title":[{"en":"alias"}],"required":false,"options":[]},"value":null},{"attribute":{"id":13,"type":"radio","title":[{"en":"sunt"}],"required":false,"options":[]},"value":null},{"attribute":{"id":14,"type":"text","title":[{"en":"quos"}],"required":true,"options":[]},"value":null},{"attribute":{"id":15,"type":"radio","title":[{"en":"et"}],"required":true,"options":[]},"value":null},{"attribute":{"id":16,"type":"file","title":[{"en":"qui"}],"required":false,"options":[]},"value":null},{"attribute":{"id":17,"type":"password","title":[{"en":"dolorum"}],"required":false,"options":[]},"value":null},{"attribute":{"id":18,"type":"radio","title":[{"en":"mollitia"}],"required":true,"options":[]},"value":null},{"attribute":{"id":19,"type":"datetime-local","title":[{"en":"quisquam"}],"required":false,"options":[]},"value":null},{"attribute":{"id":20,"type":"number","title":[{"en":"nesciunt"}],"required":true,"options":[]},"value":null},{"attribute":{"id":21,"type":"email","title":[{"en":"enim"}],"required":true,"options":[]},"value":null},{"attribute":{"id":22,"type":"datetime-local","title":[{"en":"repellendus"}],"required":true,"options":[]},"value":null},{"attribute":{"id":23,"type":"password","title":[{"en":"eius"}],"required":false,"options":[]},"value":null},{"attribute":{"id":24,"type":"time","title":[{"en":"voluptas"}],"required":false,"options":[]},"value":null},{"attribute":{"id":25,"type":"datetime-local","title":[{"en":"dolorum"}],"required":false,"options":[]},"value":null},{"attribute":{"id":26,"type":"file","title":[{"en":"voluptatem"}],"required":true,"options":[]},"value":null},{"attribute":{"id":27,"type":"date","title":[{"en":"accusantium"}],"required":true,"options":[]},"value":null},{"attribute":{"id":28,"type":"radio","title":[{"en":"ea"}],"required":false,"options":[]},"value":null},{"attribute":{"id":29,"type":"time","title":[{"en":"velit"}],"required":false,"options":[]},"value":null},{"attribute":{"id":30,"type":"checkbox","title":[{"en":"aut"}],"required":false,"options":[]},"value":null},{"attribute":{"id":31,"type":"radio","title":[{"en":"totam"}],"required":true,"options":[]},"value":null},{"attribute":{"id":32,"type":"radio","title":[{"en":"voluptas"}],"required":false,"options":[]},"value":null},{"attribute":{"id":33,"type":"checkbox","title":[{"en":"aperiam"}],"required":false,"options":[]},"value":null},{"attribute":{"id":34,"type":"email","title":[{"en":"rem"}],"required":true,"options":[]},"value":null},{"attribute":{"id":35,"type":"radio","title":[{"en":"exercitationem"}],"required":false,"options":[]},"value":null},{"attribute":{"id":36,"type":"file","title":[{"en":"quos"}],"required":true,"options":[]},"value":null},{"attribute":{"id":37,"type":"file","title":[{"en":"et"}],"required":true,"options":[]},"value":null},{"attribute":{"id":38,"type":"file","title":[{"en":"nesciunt"}],"required":true,"options":[]},"value":null},{"attribute":{"id":39,"type":"radio","title":[{"en":"doloremque"}],"required":true,"options":[]},"value":null},{"attribute":{"id":40,"type":"email","title":[{"en":"illum"}],"required":true,"options":[]},"value":null},{"attribute":{"id":41,"type":"date","title":[{"en":"officia"}],"required":false,"options":[]},"value":null},{"attribute":{"id":42,"type":"text","title":[{"en":"fugit"}],"required":false,"options":[]},"value":null},{"attribute":{"id":43,"type":"email","title":[{"en":"rerum"}],"required":true,"options":[]},"value":null},{"attribute":{"id":44,"type":"text","title":[{"en":"labore"}],"required":false,"options":[]},"value":null},{"attribute":{"id":45,"type":"date","title":[{"en":"consequatur"}],"required":false,"options":[]},"value":null},{"attribute":{"id":46,"type":"datetime-local","title":[{"en":"quae"}],"required":false,"options":[]},"value":null},{"attribute":{"id":47,"type":"text","title":[{"en":"nostrum"}],"required":true,"options":[]},"value":null},{"attribute":{"id":48,"type":"radio","title":[{"en":"natus"}],"required":true,"options":[]},"value":null},{"attribute":{"id":49,"type":"file","title":[{"en":"vero"}],"required":true,"options":[]},"value":null},{"attribute":{"id":50,"type":"email","title":[{"en":"sequi"}],"required":false,"options":[]},"value":null}],"birth_day":null,"looking_for_description":null,"looking_for_gender":null,"looking_for_age_gte":null,"looking_for_age_lte":null,"age":null,"created_at":"2022-12-06T15:56:01.000000Z"}

SinglePeople singlePeopleFromJson(String str) => SinglePeople.fromJson(json.decode(str));
String singlePeopleToJson(SinglePeople data) => json.encode(data.toJson());
class SinglePeople {
  SinglePeople({
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

  SinglePeople.fromJson(dynamic json) {
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
SinglePeople copyWith({  bool? targetBlockedMe,
  bool? targetIsBlocked,
  bool? targetIsContact,
  bool? alreadyRequestSent,
  bool? userFavoredTarget,
  bool? targetFavoredUser,
  bool? userLikedTarget,
  bool? targetLikedUser,
  User? target,
}) => SinglePeople(  targetBlockedMe: targetBlockedMe ?? _targetBlockedMe,
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