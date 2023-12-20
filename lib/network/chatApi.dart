
import 'package:dio/dio.dart';

import '../base/baseNetwork.dart';
import '../utils/header.dart';

class ChatApi extends BaseNetwork {

  Future<Response> getConversation(Map<String, dynamic>? body) async =>
      dio.post('/chat/conversation', data: body, options: Options(headers: await getHeader()));

  Future<Response> getGiftList(Map<String, dynamic>? body) async =>
      dio.post('/chat/gift_list', data: body, options: Options(headers: await getHeader()));

  Future<Response> sendGift(Map<String, dynamic>? body) async =>
      dio.post('/chat/send_gift', data: body, options: Options(headers: await getHeader()));
  Future<Response> sendKiss(Map<String, dynamic>? body) async =>
      dio.post('/chat/send_kiss', data: body, options: Options(headers: await getHeader()));
  Future<Response> sendChat(Map<String, dynamic>? body) async =>
      dio.post('/chat/send', data: body, options: Options(headers: await getHeader()));

  Future<Response> sendReaction(Map<String, dynamic>? body) async =>
      dio.post('/chat/send_reaction', data: body, options: Options(headers: await getHeader()));


  Future<Response> deleteChat(Map<String, dynamic>? body) async =>
      dio.post('/chat/delete', data: body, options: Options(headers: await getHeader()));


  Future<Response> sendFile(
          FormData formData, ProgressCallback? onSendProgress) async =>
      dio.post('/chat/send_file',
          data: formData, onSendProgress: onSendProgress, options: Options(headers: await getHeader()));

  Future<Response> sendGif(
          Map<String, dynamic>? body, ProgressCallback? onSendProgress) async =>
      dio.post('/chat/send_gif',
          data: body, onSendProgress: onSendProgress, options: Options(headers: await getHeader()));
}

// Future<String> uploadImage(File file) async {
//   String fileName = file.path.split('/').last;
//   FormData formData = FormData.fromMap({
//     "file":
//     await MultipartFile.fromFile(file.path, filename:fileName),
//   });
//   response = await dio.post("/info", data: formData);
//   return response.data['id'];
// }