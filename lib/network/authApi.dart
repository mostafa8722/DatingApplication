
import 'package:dio/dio.dart';

import '../base/baseNetwork.dart';
import '../utils/header.dart';

class AuthApi extends BaseNetwork {
  Future<Response> login(Map<String, dynamic>? body)
      {

        return  dio.post('/auth/login', data: body);
      }

  Future<Response> register(Map<String, dynamic>? body) =>
      dio.post('/auth/register', data: body);

  Future<Response> refreshToken(Map<String, dynamic>? body) =>
      dio.post('/auth/refresh_token', data: body);

  Future<Response> forgotPassword(Map<String, dynamic>? body) =>
      dio.post('/auth/reset_password', data: body);

  Future<Response> me() async =>
      dio.get('/auth/me', options: Options(headers: await getHeader()));

}
