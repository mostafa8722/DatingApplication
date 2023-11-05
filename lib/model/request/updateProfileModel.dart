import 'package:dio/dio.dart';

class UpdateProfileRequestModel{
  String? profileImage;
  String? bannerImage;
  String? firstName;
  String? lastName;
  String? password;
  String? passwordConfirmation;
  String? locale;
  String? gender;
  double? lat;
  double? lng;
  String? birthday;
  String? description;
  String? lookingForDescription;
  String? lookingForGender;
  String? lookingForAgeGte;
  String? lookingForAgeLte;
  String? interests0;
  String? interests1;
  String? dynamicAttributes0;
  String? dynamicAttributes1;
  String? phone;
  String? email;

  UpdateProfileRequestModel({
    this.profileImage,
    this.bannerImage,
    this.firstName,
    this.lastName,
    this.password,
    this.passwordConfirmation,
    this.locale,
    this.gender,
    this.lat,
    this.lng,
    this.birthday,
    this.description,
    this.lookingForDescription,
    this.lookingForGender,
    this.lookingForAgeGte,
    this.lookingForAgeLte,
    this.interests0,
    this.interests1,
    this.dynamicAttributes0,
    this.dynamicAttributes1,
    this.phone,
    this.email
  });

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    if(profileImage != null) map['profile_image'] = profileImage;
    if(bannerImage != null) map['banner_image'] = bannerImage ;
    if(firstName != null)map['first_name'] = firstName;
    if(lastName != null)map['last_name'] = lastName;
    if(password != null)map['password'] = password;
    if(passwordConfirmation != null)map['password_confirmation'] = passwordConfirmation;
    if(locale != null)map['locale'] = locale;
    if(gender != null && gender!.isNotEmpty)map['gender'] = gender;
    if(lat != null)map['lat'] = lat;
    if(lng != null)map['lng'] = lng;
    if(birthday != null)map['birth_day'] = birthday;
    if(description != null)map['description'] = description;
    if(lookingForDescription != null)map['looking_for_description'] = lookingForDescription;
    if(lookingForGender != null)map['looking_for_gender'] = lookingForGender;
    if(lookingForAgeGte != null)map['looking_for_age_gte'] = lookingForAgeGte;
    if(lookingForAgeLte != null)map['looking_for_age_lte'] = lookingForAgeLte;
    if(interests0 != null)map['interests[0]'] = interests0;
    if(interests1 != null)map['interests[1]'] = interests1;
    if(dynamicAttributes0 != null)map['dynamic_attributes[0]'] = dynamicAttributes0;
    if(dynamicAttributes1 != null)map['dynamic_attributes[1]'] = dynamicAttributes1;
    if(phone != null)map['phone'] = phone;
    if(email != null)map['email'] = email;
    return map;
  }

  Future<FormData> toFormData() async{
    final map = <String, dynamic>{};
    if(profileImage != null) map['profile_image'] = await MultipartFile.fromFile(profileImage!, filename:profileImage.toString());
    if(bannerImage != null) map['banner_image'] = await MultipartFile.fromFile(bannerImage!, filename:bannerImage.toString());
    if(firstName != null)map['first_name'] = firstName;
    if(lastName != null)map['last_name'] = lastName;
    if(password != null)map['password'] = password;
    if(passwordConfirmation != null)map['password_confirmation'] = passwordConfirmation;
    if(locale != null)map['locale'] = locale;
    if(gender != null && gender!.isNotEmpty)map['gender'] = gender;
    if(lat != null)map['lat'] = lat;
    if(lng != null)map['lng'] = lng;
    if(birthday != null)map['birth_day'] = birthday;
    if(description != null)map['description'] = description;
    if(lookingForDescription != null)map['looking_for_description'] = lookingForDescription;
    if(lookingForGender != null)map['looking_for_gender'] = lookingForGender;
    if(lookingForAgeGte != null)map['looking_for_age_gte'] = lookingForAgeGte;
    if(lookingForAgeLte != null)map['looking_for_age_lte'] = lookingForAgeLte;
    if(interests0 != null)map['interests[0]'] = interests0;
    if(interests1 != null)map['interests[1]'] = interests1;
    if(dynamicAttributes0 != null)map['dynamic_attributes[0]'] = dynamicAttributes0;
    if(dynamicAttributes1 != null)map['dynamic_attributes[1]'] = dynamicAttributes1;
    if(phone != null)map['phone'] = phone;
    if(email != null)map['email'] = email;

    return FormData.fromMap(map);
  }
}