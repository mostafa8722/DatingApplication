import 'dart:convert';

import 'package:flutter/services.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';

class Storage{
  Future<Uint8List> getEncryptionKey() async{
    const FlutterSecureStorage secureStorage = FlutterSecureStorage();
    Uint8List encryptionKey = base64Url.decode((await secureStorage.read(key: 'encryptionKey')).toString());
    return encryptionKey;
  }
}