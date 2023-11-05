class RegisterRequestModel{
  String email;
  String password;
  String passwordConfirmation;
  String gender;

  RegisterRequestModel({
    required this.email,
    required this.password,
    required this.passwordConfirmation,
    required this.gender
  });

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['email'] = email;
    map['password'] = password;
    map['password_confirmation'] = passwordConfirmation;
    map['gender'] = gender;
    return map;
  }
}