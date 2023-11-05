class Languages {
  Languages({
    required this.key,
    required this.type,
    required this.locale,
    required this.sections,});

  Languages.fromJson(dynamic json) {
    key = json['key'];
    type = json['type'];
    locale = json['locale'] != null ? Locale.fromJson(json['locale']) : null;
    sections =
    json['sections'] != null ? Sections.fromJson(json['sections']) : null;
  }

  String? key;
  String? type;
  Locale? locale;
  Sections? sections;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['key'] = key;
    map['type'] = type;
    if (locale != null) {
      map['locale'] = locale?.toJson();
    }
    if (sections != null) {
      map['sections'] = sections?.toJson();
    }
    return map;
  }

}

class Locale {
  Locale({
    required this.name,
    required this.isoCode,
    required this.dir,
    required this.title,
    required this.slug,});

  Locale.fromJson(dynamic json) {
    name = json['name'];
    isoCode = json['iso_code'];
    dir = json['dir'];
    title = json['title'];
    slug = json['slug'];
  }

  String? name;
  String? isoCode;
  String? dir;
  String? title;
  dynamic slug;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['name'] = name;
    map['iso_code'] = isoCode;
    map['dir'] = dir;
    map['title'] = title;
    map['slug'] = slug;
    return map;
  }

}

class Sections {
  Sections({
    required this.appNavMaps,
    required this.appNavActions,
    required this.appNavChats,
    required this.appNavHome,
    required this.appNavProfile,
    required this.appActionsLikes,
    required this.appActionsFavorites,
    required this.appActionsContacts,
    required this.appActionsBlock,
    required this.appActionsSeen,
    required this.appActionsLikeMe,
    required this.appChatOnlineUser,
    required this.appProfileSetting,
    required this.appProfileHelpCenter,
    required this.appProfileInviteFriends,
    required this.appProfileLogout,
    required this.appSettingPersonalNformation,
    required this.appSettingDiscovery,
    required this.appSettingNotification,
    required this.appSettingSecurity,
    required this.appSettingLanguage,
    required this.appSettingFaceId,
    required this.appSettingBiometricId,
    required this.appSettingGoogleAuth,
    required this.appSettingBlockedList,
    required this.appSettingChangePin,
    required this.appSettingChangePassword,
    required this.appSettingMale,
    required this.appSettingFemale,
    required this.appSettingEmail,
    required this.appSettingPhone,
    required this.appSettingFirstName,
    required this.appSettingLastName,
    required this.appSettingBirthdate,
    required this.appSettingLocation,
    required this.appSettingAge,
    required this.appSettingDistance,
    required this.appSettingSearchArea,
    required this.appSettingShowMe,
    required this.appSettingWomenOnly,
    required this.appSettingHideLastSeen,});

  Sections.fromJson(dynamic json) {
    appNavHome =
    json['app_nav_home'] != null ? json['app_nav_home'].cast<String>() : [];
    appNavMaps =
    json['app_nav_maps'] != null ? json['app_nav_maps'].cast<String>() : [];
    appNavActions =
    json['app_nav_actions'] != null ? json['app_nav_actions'].cast<String>() : [
    ];
    appNavChats =
    json['app_nav_chats'] != null ? json['app_nav_chats'].cast<String>() : [];
    appNavProfile =
    json['app_nav_profile'] != null ? json['app_nav_profile'].cast<String>() : [
    ];
    appActionsLikes = json['app_actions_likes'] != null
        ? json['app_actions_likes'].cast<String>()
        : [];
    appActionsFavorites =
    json['app_actions_favorites'] != null ? json['app_actions_favorites'].cast<
        String>() : [];
    appActionsContacts =
    json['app_actions_contacts'] != null ? json['app_actions_contacts'].cast<
        String>() : [];
    appActionsBlock = json['app_actions_block'] != null
        ? json['app_actions_block'].cast<String>()
        : [];
    appActionsSeen = json['app_actions_seen'] != null
        ? json['app_actions_seen'].cast<String>()
        : [];
    appActionsLikeMe =
    json['app_actions_like_me'] != null ? json['app_actions_like_me'].cast<
        String>() : [];
    appChatOnlineUser =
    json['app_chat_online_user'] != null ? json['app_chat_online_user'].cast<
        String>() : [];
    appProfileSetting =
    json['app_profile_setting'] != null ? json['app_profile_setting'].cast<
        String>() : [];
    appProfileHelpCenter =
    json['app_profile_help_center'] != null ? json['app_profile_help_center']
        .cast<String>() : [];
    appProfileInviteFriends = json['app_profile_invite_friends'] != null
        ? json['app_profile_invite_friends'].cast<String>()
        : [];
    appProfileLogout =
    json['app_profile_logout'] != null ? json['app_profile_logout'].cast<
        String>() : [];
    appSettingPersonalNformation =
    json['app_setting_personal_nformation'] != null
        ? json['app_setting_personal_nformation'].cast<String>()
        : [];
    appSettingDiscovery =
    json['app_setting_discovery'] != null ? json['app_setting_discovery'].cast<
        String>() : [];
    appSettingNotification =
    json['app_setting_notification'] != null ? json['app_setting_notification']
        .cast<String>() : [];
    appSettingSecurity =
    json['app_setting_security'] != null ? json['app_setting_security'].cast<
        String>() : [];
    appSettingLanguage =
    json['app_setting_language'] != null ? json['app_setting_language'].cast<
        String>() : [];
    appSettingFaceId =
    json['app_setting_face_id'] != null ? json['app_setting_face_id'].cast<
        String>() : [];
    appSettingBiometricId =
    json['app_setting_biometric_id'] != null ? json['app_setting_biometric_id']
        .cast<String>() : [];
    appSettingGoogleAuth =
    json['app_setting_google_auth'] != null ? json['app_setting_google_auth']
        .cast<String>() : [];
    appSettingBlockedList =
    json['app_setting_blocked_list'] != null ? json['app_setting_blocked_list']
        .cast<String>() : [];
    appSettingChangePin =
    json['app_setting_change_pin'] != null ? json['app_setting_change_pin']
        .cast<String>() : [];
    appSettingChangePassword = json['app_setting_change_password'] != null
        ? json['app_setting_change_password'].cast<String>()
        : [];
    appSettingMale = json['app_setting_male'] != null
        ? json['app_setting_male'].cast<String>()
        : [];
    appSettingFemale =
    json['app_setting_female'] != null ? json['app_setting_female'].cast<
        String>() : [];
    appSettingEmail = json['app_setting_email'] != null
        ? json['app_setting_email'].cast<String>()
        : [];
    appSettingPhone = json['app_setting_phone'] != null
        ? json['app_setting_phone'].cast<String>()
        : [];
    appSettingFirstName =
    json['app_setting_first_name'] != null ? json['app_setting_first_name']
        .cast<String>() : [];
    appSettingLastName =
    json['app_setting_last_name'] != null ? json['app_setting_last_name'].cast<
        String>() : [];
    appSettingBirthdate =
    json['app_setting_birthdate'] != null ? json['app_setting_birthdate'].cast<
        String>() : [];
    appSettingLocation =
    json['app_setting_location'] != null ? json['app_setting_location'].cast<
        String>() : [];
    appSettingAge =
    json['app_setting_age'] != null ? json['app_setting_age'].cast<String>() : [
    ];
    appSettingDistance =
    json['app_setting_distance'] != null ? json['app_setting_distance'].cast<
        String>() : [];
    appSettingSearchArea =
    json['app_setting_search_area'] != null ? json['app_setting_search_area']
        .cast<String>() : [];
    appSettingShowMe =
    json['app_setting_show_me'] != null ? json['app_setting_show_me'].cast<
        String>() : [];
    appSettingWomenOnly =
    json['app_setting_women_only'] != null ? json['app_setting_women_only']
        .cast<String>() : [];
    appSettingHideLastSeen = json['app_setting_hide_last_seen'] != null
        ? json['app_setting_hide_last_seen'].cast<String>()
        : [];
  }

  List<String>? appNavHome;
  List<String> ?appNavMaps;
  List<String> ?appNavActions;
  List<String> ?appNavChats;
  List<String> ?appNavProfile;
  List<String> ?appActionsLikes;
  List<String> ?appActionsFavorites;
  List<String> ?appActionsContacts;
  List<String> ?appActionsBlock;
  List<String> ?appActionsSeen;
  List<String> ?appActionsLikeMe;
  List<String> ?appChatOnlineUser;
  List<String> ?appProfileSetting;
  List<String> ?appProfileHelpCenter;
  List<String> ?appProfileInviteFriends;
  List<String> ?appProfileLogout;
  List<String> ?appSettingPersonalNformation;
  List<String> ?appSettingDiscovery;
  List<String> ?appSettingNotification;
  List<String> ?appSettingSecurity;
  List<String> ?appSettingLanguage;
  List<String> ?appSettingFaceId;
  List<String> ?appSettingBiometricId;
  List<String> ?appSettingGoogleAuth;
  List<String> ?appSettingBlockedList;
  List<String> ?appSettingChangePin;
  List<String> ?appSettingChangePassword;
  List<String> ?appSettingMale;
  List<String> ?appSettingFemale;
  List<String> ?appSettingEmail;
  List<String> ?appSettingPhone;
  List<String> ?appSettingFirstName;
  List<String> ?appSettingLastName;
  List<String> ?appSettingBirthdate;
  List<String> ?appSettingLocation;
  List<String> ?appSettingAge;
  List<String> ?appSettingDistance;
  List<String> ?appSettingSearchArea;
  List<String>? appSettingShowMe;
  List<String>? appSettingWomenOnly;
  List<String>? appSettingHideLastSeen;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['app_nav_home'] = appNavHome;
    map['app_nav_maps'] = appNavMaps;
    map['app_nav_actions'] = appNavActions;
    map['app_nav_chats'] = appNavChats;
    map['app_nav_profile'] = appNavProfile;
    map['app_actions_likes'] = appActionsLikes;
    map['app_actions_favorites'] = appActionsFavorites;
    map['app_actions_contacts'] = appActionsContacts;
    map['app_actions_block'] = appActionsBlock;
    map['app_actions_seen'] = appActionsSeen;
    map['app_actions_like_me'] = appActionsLikeMe;
    map['app_chat_online_user'] = appChatOnlineUser;
    map['app_profile_setting'] = appProfileSetting;
    map['app_profile_help_center'] = appProfileHelpCenter;
    map['app_profile_invite_friends'] = appProfileInviteFriends;
    map['app_profile_logout'] = appProfileLogout;
    map['app_setting_personal_nformation'] = appSettingPersonalNformation;
    map['app_setting_discovery'] = appSettingDiscovery;
    map['app_setting_notification'] = appSettingNotification;
    map['app_setting_security'] = appSettingSecurity;
    map['app_setting_language'] = appSettingLanguage;
    map['app_setting_face_id'] = appSettingFaceId;
    map['app_setting_biometric_id'] = appSettingBiometricId;
    map['app_setting_google_auth'] = appSettingGoogleAuth;
    map['app_setting_blocked_list'] = appSettingBlockedList;
    map['app_setting_change_pin'] = appSettingChangePin;
    map['app_setting_change_password'] = appSettingChangePassword;
    map['app_setting_male'] = appSettingMale;
    map['app_setting_female'] = appSettingFemale;
    map['app_setting_email'] = appSettingEmail;
    map['app_setting_phone'] = appSettingPhone;
    map['app_setting_first_name'] = appSettingFirstName;
    map['app_setting_last_name'] = appSettingLastName;
    map['app_setting_birthdate'] = appSettingBirthdate;
    map['app_setting_location'] = appSettingLocation;
    map['app_setting_age'] = appSettingAge;
    map['app_setting_distance'] = appSettingDistance;
    map['app_setting_search_area'] = appSettingSearchArea;
    map['app_setting_show_me'] = appSettingShowMe;
    map['app_setting_women_only'] = appSettingWomenOnly;
    map['app_setting_hide_last_seen'] = appSettingHideLastSeen;
    return map;
  }

}