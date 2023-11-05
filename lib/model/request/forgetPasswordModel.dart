class ForgetPasswordRequestModel{
  String email;

  ForgetPasswordRequestModel({
    required this.email,
  });

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['email'] = email;
    return map;
  }
}