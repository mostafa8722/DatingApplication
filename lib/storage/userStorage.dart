

import 'package:hive/hive.dart';

import 'storage.dart';

class UserStorage extends Storage{
  final String _storageKey = 'user-storage';

  final String tokenKey = 'token';
  final String informationKey = 'information';


  saveData(String key,dynamic token) async{
    var encryptionKey = await getEncryptionKey();
    var box = await Hive.openBox(_storageKey,encryptionCipher: HiveAesCipher(encryptionKey));
    box.put(key, token);
  }

  Future<dynamic> getData(String key) async{
    var encryptionKey = await getEncryptionKey();
    var box = await Hive.openBox(_storageKey,encryptionCipher: HiveAesCipher(encryptionKey));
    var token = box.get(key,defaultValue: null);
    return token;
  }

}