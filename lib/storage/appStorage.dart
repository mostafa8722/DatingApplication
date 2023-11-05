
import 'package:hive/hive.dart';

import 'storage.dart';

class AppStorage extends Storage{
  final String _storageKey = 'storage';

  final String seenIntroKey = 'seen-intro';
  final String loginRememberMeKey = 'login-remember_me';
  final String registerRememberMeKey = 'register-remember_me';
  final String loginUsernameKey = 'login-username';
  final String loginPasswordKey = 'login-password';
  final String languageKey = 'language';

  saveData(String key,dynamic token) async{
    var encryptionKey = await getEncryptionKey();
    var box = await Hive.openBox(_storageKey,encryptionCipher: HiveAesCipher(encryptionKey));
    box.put(key, token);
  }

  Future<dynamic> getData(String key) async{
    var encryptionKey = await getEncryptionKey();
    var box = await Hive.openBox(_storageKey,encryptionCipher: HiveAesCipher(encryptionKey));
    var token = box.get(key,defaultValue: false);
    return token;
  }
}