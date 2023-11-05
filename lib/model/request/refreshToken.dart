class RefreshTokenRequestModel{
  String refreshToken;

  RefreshTokenRequestModel({
    required this.refreshToken,
  });

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['refresh_token'] = refreshToken;
    return map;
  }
}