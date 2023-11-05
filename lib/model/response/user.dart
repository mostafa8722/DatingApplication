import 'dart:convert';


import 'AttributeValues.dart';
import 'interests.dart';
import 'gallery.dart';
import 'latestSearch.dart';
/// id : 6
/// first_name : "gril"
/// last_name : "test"
/// full_name : "gril test"
/// description : null
/// profile : "http://dating.ultimatesoft.co/uploads/profiles/6/profile/6.jpg"
/// banner : "http://dating.ultimatesoft.co/uploads/profiles/6/banner/6.jpg"
/// phone : null
/// email : "silverman2006@gmail.com"
/// referral_code : "2010506227"
/// referral_id : null
/// wallet : 97895
/// locale : null
/// gender : "MALE"
/// suspended_at : null
/// lat : null
/// lng : null
/// interests : []
/// view : 5
/// latest_searches : [{"key":"j"},{"key":"v"},{"key":"b"}]
/// gallery : [{"id":10,"path":"http://dating.ultimatesoft.co/uploadsmedia/6//2.PNG","type":"IMAGE"},{"id":11,"path":"http://dating.ultimatesoft.co/uploadsmedia/6//movie.mp4","type":"VIDEO"},{"id":12,"path":"http://dating.ultimatesoft.co/uploadsmedia/6//Capture.PNG","type":"IMAGE"}]
/// attribute_values : [{"attribute":{"id":52,"type":"text","title":[{"en":"Live in"},{"fa":"مکان زندگی"}],"required":true,"options":[]},"value":null},{"attribute":{"id":53,"type":"text","title":[{"en":"Work as"},{"fa":"شغل"}],"required":false,"options":[]},"value":null},{"attribute":{"id":54,"type":"text","title":[{"en":"languages know"},{"fa":"زبان های مکالمه"}],"required":false,"options":[]},"value":null},{"attribute":{"id":55,"type":"text","title":[{"en":"Relationship"},{"fa":"وضعیت رابطه"}],"required":false,"options":[]},"value":null},{"attribute":{"id":56,"type":"number","title":[{"en":"Have kids"},{"fa":"تعداد فرزند"}],"required":false,"options":[]},"value":null},{"attribute":{"id":57,"type":"text","title":[{"en":"Smoke"},{"fa":"سیگار"}],"required":false,"options":[]},"value":null},{"attribute":{"id":58,"type":"text","title":[{"en":"Drink"},{"fa":"اهل مشروب"}],"required":false,"options":[]},"value":null},{"attribute":{"id":59,"type":"number","title":[{"en":"Height"},{"fa":"قد"}],"required":false,"options":[]},"value":null},{"attribute":{"id":60,"type":"text","title":[{"en":"Body type"},{"fa":"فرم بدن"}],"required":false,"options":[]},"value":null},{"attribute":{"id":61,"type":"text","title":[{"en":"Eyes"},{"fa":"رنگ چشم"}],"required":false,"options":[]},"value":null},{"attribute":{"id":62,"type":"text","title":[{"en":"Hair"},{"fa":"رنگ مو"}],"required":false,"options":[]},"value":null}]
/// birth_day : "1998-02-07"
/// looking_for_description : null
/// looking_for_gender : null
/// looking_for_age_gte : null
/// looking_for_age_lte : null
/// age : 24
/// created_at : "2022-12-06T18:13:06.000000Z"
/// phone_verified_at : false
/// human_verified_at : false
/// email_verified_at : false
/// voice_call_sec : 19579
/// video_call_sec : 13985

User userFromJson(String str) => User.fromJson(json.decode(str));
String userToJson(User data) => json.encode(data.toJson());
class User {
  User({
    int? id,
      String? firstName, 
      String? lastName, 
      String? fullName,
    String? description,
      String? profile, 
      String? banner,
    String? phone,
      String? email, 
      String? referralCode, 
      dynamic referralId,
    String? wallet,
      dynamic locale, 
      String? gender, 
      dynamic suspendedAt, 
      dynamic lat, 
      dynamic lng, 
      List<Interests>? interests,
    int? view,
      List<LatestSearches>? latestSearches, 
      List<Gallery>? gallery, 
      List<AttributeValues>? attributeValues, 
      String? birthDay, 
      dynamic lookingForDescription, 
      dynamic lookingForGender, 
      dynamic lookingForAgeGte, 
      dynamic lookingForAgeLte,
    int? age,
      String? createdAt, 
      bool? phoneVerifiedAt, 
      bool? humanVerifiedAt, 
      bool? emailVerifiedAt,
    int? voiceCallSec,
    int? videoCallSec,}){
    _id = id;
    _firstName = firstName;
    _lastName = lastName;
    _fullName = fullName;
    _description = description;
    _profile = profile;
    _banner = banner;
    _phone = phone;
    _email = email;
    _referralCode = referralCode;
    _referralId = referralId;
    _wallet = wallet;
    _locale = locale;
    _gender = gender;
    _suspendedAt = suspendedAt;
    _lat = lat;
    _lng = lng;
    _interests = interests;
    _view = view;
    _latestSearches = latestSearches;
    _gallery = gallery;
    _attributeValues = attributeValues;
    _birthDay = birthDay;
    _lookingForDescription = lookingForDescription;
    _lookingForGender = lookingForGender;
    _lookingForAgeGte = lookingForAgeGte;
    _lookingForAgeLte = lookingForAgeLte;
    _age = age;
    _createdAt = createdAt;
    _phoneVerifiedAt = phoneVerifiedAt;
    _humanVerifiedAt = humanVerifiedAt;
    _emailVerifiedAt = emailVerifiedAt;
    _voiceCallSec = voiceCallSec;
    _videoCallSec = videoCallSec;
}

  User.fromJson(dynamic json) {
    _id = json['id'];
    _firstName = json['first_name'];
    _lastName = json['last_name'];
    _fullName = json['full_name'];
    _description = json['description'];
    _profile = json['profile'];
    _banner = json['banner'];
    _phone = json['phone'];
    _email = json['email'];
    _referralCode = json['referral_code'];
    _referralId = json['referral_id'];
    _wallet = json['wallet'];
    _locale = json['locale'];
    _gender = json['gender'];
    _suspendedAt = json['suspended_at'];
    _lat = json['lat'];
    _lng = json['lng'];
    if (json['interests'] != null) {
      _interests = [];
      json['interests'].forEach((v) {
        _interests?.add(Interests.fromJson(v));
      });
    }
    _view = json['view'];
    if (json['latest_searches'] != null) {
      _latestSearches = [];
      json['latest_searches'].forEach((v) {
        _latestSearches?.add(LatestSearches.fromJson(v));
      });
    }
    if (json['gallery'] != null) {
      _gallery = [];
      json['gallery'].forEach((v) {
        _gallery?.add(Gallery.fromJson(v));
      });
    }
    if (json['attribute_values'] != null) {
      _attributeValues = [];
      json['attribute_values'].forEach((v) {
        _attributeValues?.add(AttributeValues.fromJson(v));
      });
    }
    _birthDay = json['birth_day'];
    _lookingForDescription = json['looking_for_description'];
    _lookingForGender = json['looking_for_gender'];
    _lookingForAgeGte = json['looking_for_age_gte'];
    _lookingForAgeLte = json['looking_for_age_lte'];
    _age = json['age'];
    _createdAt = json['created_at'];
    _phoneVerifiedAt = json['phone_verified_at'];
    _humanVerifiedAt = json['human_verified_at'];
    _emailVerifiedAt = json['email_verified_at'];
    _voiceCallSec = json['voice_call_sec'];
    _videoCallSec = json['video_call_sec'];
  }
  int? _id;
  String? _firstName;
  String? _lastName;
  String? _fullName;
  dynamic _description;
  String? _profile;
  String? _banner;
  dynamic _phone;
  String? _email;
  String? _referralCode;
  dynamic _referralId;
  String? _wallet;
  dynamic _locale;
  String? _gender;
  dynamic _suspendedAt;
  dynamic _lat;
  dynamic _lng;
  List<Interests>? _interests;
  int? _view;
  List<LatestSearches>? _latestSearches;
  List<Gallery>? _gallery;
  List<AttributeValues>? _attributeValues;
  String? _birthDay;
  dynamic _lookingForDescription;
  dynamic _lookingForGender;
  dynamic _lookingForAgeGte;
  dynamic _lookingForAgeLte;
  int? _age;
  String? _createdAt;
  bool? _phoneVerifiedAt;
  bool? _humanVerifiedAt;
  bool? _emailVerifiedAt;
  int? _voiceCallSec;
  int? _videoCallSec;
User copyWith({  int? id,
  String? firstName,
  String? lastName,
  String? fullName,
  String? description,
  String? profile,
  String? banner,
  String? phone,
  String? email,
  String? referralCode,
  dynamic referralId,
  String? wallet,
  dynamic locale,
  String? gender,
  dynamic suspendedAt,
  dynamic lat,
  dynamic lng,
  List<Interests>? interests,
  int? view,
  List<LatestSearches>? latestSearches,
  List<Gallery>? gallery,
  List<AttributeValues>? attributeValues,
  String? birthDay,
  dynamic lookingForDescription,
  dynamic lookingForGender,
  dynamic lookingForAgeGte,
  dynamic lookingForAgeLte,
  int? age,
  String? createdAt,
  bool? phoneVerifiedAt,
  bool? humanVerifiedAt,
  bool? emailVerifiedAt,
  int? voiceCallSec,
  int? videoCallSec,
}) => User(  id: id ?? _id,
  firstName: firstName ?? _firstName,
  lastName: lastName ?? _lastName,
  fullName: fullName ?? _fullName,
  description: description ?? _description,
  profile: profile ?? _profile,
  banner: banner ?? _banner,
  phone: phone ?? _phone,
  email: email ?? _email,
  referralCode: referralCode ?? _referralCode,
  referralId: referralId ?? _referralId,
  wallet: wallet ?? _wallet,
  locale: locale ?? _locale,
  gender: gender ?? _gender,
  suspendedAt: suspendedAt ?? _suspendedAt,
  lat: lat ?? _lat,
  lng: lng ?? _lng,
  interests: interests ?? _interests,
  view: view ?? _view,
  latestSearches: latestSearches ?? _latestSearches,
  gallery: gallery ?? _gallery,
  attributeValues: attributeValues ?? _attributeValues,
  birthDay: birthDay ?? _birthDay,
  lookingForDescription: lookingForDescription ?? _lookingForDescription,
  lookingForGender: lookingForGender ?? _lookingForGender,
  lookingForAgeGte: lookingForAgeGte ?? _lookingForAgeGte,
  lookingForAgeLte: lookingForAgeLte ?? _lookingForAgeLte,
  age: age ?? _age,
  createdAt: createdAt ?? _createdAt,
  phoneVerifiedAt: phoneVerifiedAt ?? _phoneVerifiedAt,
  humanVerifiedAt: humanVerifiedAt ?? _humanVerifiedAt,
  emailVerifiedAt: emailVerifiedAt ?? _emailVerifiedAt,
  voiceCallSec: voiceCallSec ?? _voiceCallSec,
  videoCallSec: videoCallSec ?? _videoCallSec,
);
  int? get id => _id;
  String? get firstName => _firstName;
  String? get lastName => _lastName;
  String? get fullName => _fullName;
  String? get description => _description;
  String? get profile => _profile;
  String? get banner => _banner;
  String? get phone => _phone;
  String? get email => _email;
  String? get referralCode => _referralCode;
  dynamic get referralId => _referralId;
  String? get wallet => _wallet;
  dynamic get locale => _locale;
  String? get gender => _gender;
  dynamic get suspendedAt => _suspendedAt;
  dynamic get lat => _lat;
  dynamic get lng => _lng;
  List<Interests>? get interests => _interests;
  int? get view => _view;
  List<LatestSearches>? get latestSearches => _latestSearches;
  List<Gallery>? get gallery => _gallery;
  List<AttributeValues>? get attributeValues => _attributeValues;
  String? get birthDay => _birthDay;
  dynamic get lookingForDescription => _lookingForDescription;
  dynamic get lookingForGender => _lookingForGender;
  dynamic get lookingForAgeGte => _lookingForAgeGte;
  dynamic get lookingForAgeLte => _lookingForAgeLte;
  int? get age => _age;
  String? get createdAt => _createdAt;
  bool? get phoneVerifiedAt => _phoneVerifiedAt;
  bool? get humanVerifiedAt => _humanVerifiedAt;
  bool? get emailVerifiedAt => _emailVerifiedAt;
  int? get voiceCallSec => _voiceCallSec;
  int? get videoCallSec => _videoCallSec;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['id'] = _id;
    map['first_name'] = _firstName;
    map['last_name'] = _lastName;
    map['full_name'] = _fullName;
    map['description'] = _description;
    map['profile'] = _profile;
    map['banner'] = _banner;
    map['phone'] = _phone;
    map['email'] = _email;
    map['referral_code'] = _referralCode;
    map['referral_id'] = _referralId;
    map['wallet'] = _wallet;
    map['locale'] = _locale;
    map['gender'] = _gender;
    map['suspended_at'] = _suspendedAt;
    map['lat'] = _lat;
    map['lng'] = _lng;
    if (_interests != null) {
      map['interests'] = _interests?.map((v) => v.toJson()).toList();
    }
    map['view'] = _view;
    if (_latestSearches != null) {
      map['latest_searches'] = _latestSearches?.map((v) => v.toJson()).toList();
    }
    if (_gallery != null) {
      map['gallery'] = _gallery?.map((v) => v.toJson()).toList();
    }
    if (_attributeValues != null) {
      map['attribute_values'] = _attributeValues?.map((v) => v.toJson()).toList();
    }
    map['birth_day'] = _birthDay;
    map['looking_for_description'] = _lookingForDescription;
    map['looking_for_gender'] = _lookingForGender;
    map['looking_for_age_gte'] = _lookingForAgeGte;
    map['looking_for_age_lte'] = _lookingForAgeLte;
    map['age'] = _age;
    map['created_at'] = _createdAt;
    map['phone_verified_at'] = _phoneVerifiedAt;
    map['human_verified_at'] = _humanVerifiedAt;
    map['email_verified_at'] = _emailVerifiedAt;
    map['voice_call_sec'] = _voiceCallSec;
    map['video_call_sec'] = _videoCallSec;
    return map;
  }

}

