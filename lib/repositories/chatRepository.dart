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
        required int page,
        Function(dynamic)? success,
        Function(DioError)? failure}) {
    Map<String,dynamic> body = {"target_id":targetId,"page":page};
    callApi(_chatApi.getConversation(body), success, failure);
  }
  void getGiftList(
      {

        Function(dynamic)? success,
        Function(DioError)? failure}) {
    Map<String,dynamic> body = {};
    callApi(_chatApi.getGiftList(body), success, failure);
  }
  void sendGift(
      {required int targetId,required int giftId,
        Function(dynamic)? success,
        Function(DioError)? failure}) {
    Map<String,dynamic> body = {"target_id":targetId,"gift_id":giftId,};
    callApi(_chatApi.sendGift(body), success, failure);
  }
  void sendKiss(
            {required int targetId,
  Function(dynamic)? success,
  Function(DioError)? failure}) {
Map<String,dynamic> body = {"target_id":targetId};
    callApi(_chatApi.sendKiss(body), success, failure);
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
