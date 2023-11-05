
import 'package:dio/dio.dart';

import '../base/baseNetwork.dart';
import '../utils/header.dart';

class AppApi extends BaseNetwork {
  Future<Response> packages(Map<String, dynamic>? body) async=>
      dio.get('/packages', options: Options(headers: await getHeader()));

  Future<Response> initialize(Map<String, dynamic>? body) async=>
      dio.get('/init', options: Options(headers: await getHeader()));

  Future<Response> translation(Map<String, dynamic>? body,String language) async=>
      dio.get('/page_translates/main', options: Options(headers: await getLanguageHeader(language: language)));

}
