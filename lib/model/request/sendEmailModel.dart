class SendEmailRequestModel{
  String email;

  SendEmailRequestModel({
    required this.email,
  });

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['email'] = email;
    return map;
  }
}