import 'dart:io';


import 'package:dio/dio.dart';

import '../base/baseRepository.dart';
import '../model/response/chat.dart';
import '../network/chatApi.dart';
import '../storage/userStorage.dart';

class ChatRepository extends BaseRepository {
  late ChatApi _chatApi;
  late UserStorage _userStorage;

  ChatRepository() {
    _chatApi = ChatApi();
    _userStorage = UserStorage();
  }

  void getConversation(
      {
        required int targetId,
        Function(dynamic)? success,
        Function(DioError)? failure}) {
    Map<String,dynamic> body = {"target_id":targetId};
    callApi(_chatApi.getConversation(body), success, failure);
  }

  void sendTextMessage(
      {required Chat chat,
      Function(dynamic)? success,
      Function(DioError)? failure}) {
    var body = chat.toJson();
    callApi(_chatApi.sendChat(body), success, failure);
  }

  void deleteMessage(
      {
        required int chatId,
        int deleteForEveryone = 0,
        Function(dynamic)? success,
        Function(DioError)? failure}) {
    Map<String,dynamic> body = {
      "chat_id":chatId,
      "delete_for_everyone":deleteForEveryone,
    };
    callApi(_chatApi.deleteChat(body), success, failure);
  }

  void sendFile(
      {required Chat chat,
        ProgressCallback? onSendProgress,
        Function(dynamic)? success,
        Function(DioError)? failure}) async{
    FormData formData = FormData.fromMap({
      "file": await MultipartFile.fromFile(chat.file!, filename:chat.file.toString()),
      "target_id":chat.targetId
    });
    callApi(_chatApi.sendFile(formData,onSendProgress), success, failure);
  }

}
