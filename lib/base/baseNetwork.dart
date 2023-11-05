import 'package:dio/dio.dart';
import 'package:get/get_connect/connect.dart';

import '../utils/log.dart';

class BaseNetwork{

  var dio = Dio(BaseOptions(
    baseUrl: "https://panel.lover369.com/api/v1",
    contentType: "application/json",
    responseType: ResponseType.json
  ));

}