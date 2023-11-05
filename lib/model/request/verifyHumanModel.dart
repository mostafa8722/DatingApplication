import 'dart:io';

class VerifyHumanRequestModel{
  File file;

  VerifyHumanRequestModel({
    required this.file,
  });

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['file'] = file;
    return map;
  }
}