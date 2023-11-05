

import '../model/response/token.dart';
import '../repositories/userRepository.dart';
import 'log.dart';

Future<Map<String,dynamic>?> getHeader() async{
  UserRepository _userRepository = UserRepository();
  Token? token = (await _userRepository.getToken()) as Token?;
  printLog("Bearer ${token?.original?.accessToken}");
  return <String,dynamic>{
    "Authorization":"Bearer ${token?.original?.accessToken}",
    "Accept":"application/json"
  };
}

Future<Map<String,dynamic>?> getSocketHeader() async{
  UserRepository _userRepository = UserRepository();
  Token? token = (await _userRepository.getToken()) as Token?;
  printLog("Bearer ${token?.original?.accessToken}");
  return <String,dynamic>{
    "token":"Bearer ${token?.original?.accessToken}",
    "transports":"websocket",
  };
}

Future<Map<String,dynamic>?> getLanguageHeader({String language='en'}) async{
  return <String,dynamic>{
    "locale":language,
    "Accept":"application/json",
  };
}