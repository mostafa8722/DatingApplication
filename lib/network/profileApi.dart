
import 'package:dio/dio.dart';

import '../base/baseNetwork.dart';
import '../utils/header.dart';

class ProfileApi extends BaseNetwork {
  //update-send verification sms-send verification email
  Future<Response> update(FormData body) async=>
      dio.post('/profile/update', data: body, options: Options(headers: await getHeader()));

  Future<Response> verifyPhone(Map<String, dynamic>? body) async=>
      dio.post('/profile/verify/phone', data: body, options: Options(headers: await getHeader()));

  Future<Response> verifyHuman(
      Map<String, dynamic>? body, ProgressCallback? onSendProgress) async=>
      dio.post('/profile/verify/human',
          data: body, onSendProgress: onSendProgress, options: Options(headers: await getHeader()));

  Future<Response> uploadGallery(
          Map<String, dynamic>? body, ProgressCallback? onSendProgress) async=>
      dio.post('/profile/gallery/upload',
          data: body, onSendProgress: onSendProgress, options: Options(headers: await getHeader()));
}
