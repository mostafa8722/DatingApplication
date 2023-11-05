class UserActionRequestModel{
  String targetId;

  UserActionRequestModel({
    required this.targetId,
  });

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['target_id'] = targetId;
    return map;
  }
}