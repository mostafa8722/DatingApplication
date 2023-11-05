class VerifyPhoneRequestModel{
  String code;

  VerifyPhoneRequestModel({
    required this.code,
  });

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['code'] = code;
    return map;
  }
}