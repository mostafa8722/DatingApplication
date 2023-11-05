import 'package:flutter/foundation.dart';
void printLog(dynamic message){
  if(kDebugMode){
    print(message.toString());
  }
}