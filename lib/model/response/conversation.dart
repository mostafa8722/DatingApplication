
import 'chat.dart';
import 'chatUser.dart';

/// user : {"target_blocked_me":false,"target_is_blocked":false,"target_is_contact":false,"already_request_sent":false,"user_favored_target":true,"target_favored_user":false,"user_liked_target":false,"target_liked_user":false,"target":{"id":17,"first_name":"Bernita Mohr","last_name":"Schumm","full_name":"Bernita Mohr Schumm","description":null,"profile":"http://panel.lover369.com/fake_image/12.jpeg","banner":"http://panel.lover369.com/fake_image/back.webp","phone":null,"email":"kenyatta75@example.com","referral_code":"945731167","referral_id":null,"wallet":"0","locale":null,"gender":"FEMALE","suspended_at":null,"lat":"-54.591581","lng":"-45.154431","interests":[],"view":0,"latest_searches":[],"gallery":[],"attribute_values":[{"attribute":{"id":1,"type":"text","title":[{"en":"Smoke?"},{"far":"اهل سیگار هستید؟"}],"required":false,"options":[]},"value":null},{"attribute":{"id":2,"type":"text","title":[{"en":"You favorite hair color?"},{"far":"رنگ موی مورد علاقه شما؟"}],"required":false,"options":[]},"value":null},{"attribute":{"id":3,"type":"text","title":[{"en":"Favorite food?"},{"far":"غذای مورد علاقه؟"}],"required":false,"options":[]},"value":null},{"attribute":{"id":4,"type":"text","title":[{"en":"Alcohol"},{"far":"الکل"}],"required":false,"options":[]},"value":null},{"attribute":{"id":13,"type":"text","title":[{"en":"Kids"},{"far":"Kids"},{"fr":"Kids"},{"es":"Kids"},{"it":"Kids"},{"ar":"Kids"},{"ro":"Kids"},{"ru":"Kids"},{"bg":"Kids"},{"zh":"Kids"},{"nl":"Kids"},{"de":"Kid"}],"required":false,"options":[]},"value":null}],"birth_day":null,"looking_for_description":null,"looking_for_gender":null,"looking_for_age_gte":null,"looking_for_age_lte":null,"age":null,"created_at":"2023-01-14T19:10:23.000000Z","phone_verified_at":false,"human_verified_at":false,"email_verified_at":false,"voice_call_sec":0,"video_call_sec":0,"last_seen_at":null,"country":null}}
/// latest_message : {"id":407,"user_id":36,"target_id":17,"sender_user":{"id":36,"email":"khoshkam93.itsu@gmail.com","full_name":"m k","profile":"http://panel.lover369.com/uploads/profiles/36/profile/36.jpg","banner":"http://panel.lover369.com/fake_image/back.webp","age":26,"description":null,"created_at":"2023-01-14T19:17:08.000000Z","country":null},"message":null,"file":"http://panel.lover369.com/uploads/chats/407/image_picker_67DB15D2-628C-4298-B439-0606685675C9.jpg","type":"FILE","seen":false,"sent":true,"date":"2023-01-27T19:40:04.000000Z","reactions":[],"send_or_receive":"SEND","delete_for_every_one_maximum_time":"2023-01-27T19:40:24.000000Z"}
/// new_messages : 0

class Conversation {
  Conversation({
      ChatUser? user,
      Chat? latestMessage,
      int? newMessages,}){
    _user = user;
    _latestMessage = latestMessage;
    _newMessages = newMessages;
}

  Conversation.fromJson(dynamic json) {
    _user = json['user'] != null ? ChatUser.fromJson(json['user']) : null;
    _latestMessage = json['latest_message'] != null ? Chat.fromJson(json['latest_message']) : null;
    _newMessages = json['new_messages'];
  }
  ChatUser? _user;
  Chat? _latestMessage;
  int? _newMessages;
Conversation copyWith({  ChatUser? user,
  Chat? latestMessage,
  int? newMessages,
}) => Conversation(  user: user ?? _user,
  latestMessage: latestMessage ?? _latestMessage,
  newMessages: newMessages ?? _newMessages,
);
  ChatUser? get user => _user;
  Chat? get latestMessage => _latestMessage;
  int? get newMessages => _newMessages;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    if (_user != null) {
      map['user'] = _user?.toJson();
    }
    if (_latestMessage != null) {
      map['latest_message'] = _latestMessage?.toJson();
    }
    map['new_messages'] = _newMessages;
    return map;
  }

}
