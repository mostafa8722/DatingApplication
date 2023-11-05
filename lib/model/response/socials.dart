import 'dart:convert';

/// facebook : "#"
/// youtube : "#"
/// instagram : "#"
/// linkedin : "#"
/// whatsapp : "#"
/// phone : "+1 123 456 7892"

Socials socialsFromJson(String str) => Socials.fromJson(json.decode(str));
String socialsToJson(Socials data) => json.encode(data.toJson());
class Socials {
  Socials({
    String? facebook,
    String? youtube,
    String? instagram,
    String? linkedin,
    String? whatsapp,
    String? phone,}){
    _facebook = facebook;
    _youtube = youtube;
    _instagram = instagram;
    _linkedin = linkedin;
    _whatsapp = whatsapp;
    _phone = phone;
  }

  Socials.fromJson(dynamic json) {
    _facebook = json['facebook'];
    _youtube = json['youtube'];
    _instagram = json['instagram'];
    _linkedin = json['linkedin'];
    _whatsapp = json['whatsapp'];
    _phone = json['phone'];
  }
  String? _facebook;
  String? _youtube;
  String? _instagram;
  String? _linkedin;
  String? _whatsapp;
  String? _phone;
  Socials copyWith({  String? facebook,
    String? youtube,
    String? instagram,
    String? linkedin,
    String? whatsapp,
    String? phone,
  }) => Socials(  facebook: facebook ?? _facebook,
    youtube: youtube ?? _youtube,
    instagram: instagram ?? _instagram,
    linkedin: linkedin ?? _linkedin,
    whatsapp: whatsapp ?? _whatsapp,
    phone: phone ?? _phone,
  );
  String? get facebook => _facebook;
  String? get youtube => _youtube;
  String? get instagram => _instagram;
  String? get linkedin => _linkedin;
  String? get whatsapp => _whatsapp;
  String? get phone => _phone;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['facebook'] = _facebook;
    map['youtube'] = _youtube;
    map['instagram'] = _instagram;
    map['linkedin'] = _linkedin;
    map['whatsapp'] = _whatsapp;
    map['phone'] = _phone;
    return map;
  }

}
