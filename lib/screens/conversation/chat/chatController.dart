import 'dart:io';
import 'dart:async';

import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'package:web_socket_channel/io.dart';
import 'package:web_socket_channel/status.dart' as status;
import '../../../appControler.dart';
import '../../../base/baseController.dart';
import '../../../base/baseSocket.dart';
import '../../../model/argument/chatArguments.dart';
import '../../../model/response/chat.dart';
import '../../../model/response/onlineUser.dart';
import '../../../model/response/response.dart';
import '../../../network/streamSocket.dart';
import '../../../repositories/chatRepository.dart';
import '../../../utils/enums.dart';
import '../../../utils/log.dart';
import '../../../utils/route.dart';
import 'interface/chatControllerInterface.dart';


class ChatController extends BaseController implements ChatControllerInterface {
  final AppController appController = Get.find<AppController>();
  late ChatArguments chatArguments;
  final ChatRepository _chatRepository = ChatRepository();
  final ScrollController scrollController = ScrollController();
  StreamSocket streamSocket = StreamSocket();

  final TextEditingController messageController = TextEditingController();
  var messages = <Chat>[].obs;
  Rx<String> status = "offline".obs;
  Rx<String> targetName = "".obs;
  Rx<String> targetProfile = "".obs;
  int targetId = 0;
  String targetEmail = "";
  BaseSocket baseSocket = BaseSocket();
  var loading = false.obs;


  @override
  void onInit() {
    // printLog("value00000000000000000");
    // baseSocket.connect();
    initializeSocket();
    initUserStatus();
    initTypingStatus();
    initializePeople();
    getMessages();
    super.onInit();
  }

  @override
  void dispose() {
    scrollController.dispose();
    messageController.dispose();
    super.dispose();
  }

  @override
  void initializePeople() {
    chatArguments = Get.arguments["data"];
    targetName.value = chatArguments.name.toString();
    targetProfile.value = chatArguments.profile.toString();
    targetId = chatArguments.id!;
    targetEmail = chatArguments.email!;
  }

  @override
  void getMessages() {
    loading.value = true;
    _chatRepository.getConversation(
      targetId: targetId,
      success: (data) {
        loading.value = false;
        var responseModel = responseFromJson(data.toString());
        messages.value = (responseModel.data as List)
            .map((item) => Chat.fromJson(item))
            .toList()
            .reversed
            .toList();
        printLog("2222222");
      },
      failure: (error) {
        loading.value = false;
        printLog("#cm0-e");
        printLog(error.response?.data);
      },
    );
  }

  @override
  void sendTextMessage() {
   initializeSocket();
    var newMessage = messageController.text;
    if (newMessage.isEmpty) {
      return;
    }
    Chat chat = Chat(
        id: DateTime
            .now()
            .millisecond,
        targetId: chatArguments.id!,
        message: newMessage,
        date: DateTime.now().toString(),
        sendOrReceive: "SEND",
        type: MessageType.chat.name.toUpperCase(),
        seen: false,
        sent: false);
    messages.add(chat);
    messageController.clear();
    scrollController.animateTo(0,
        duration: const Duration(milliseconds: 10), curve: Curves.linear);

    _chatRepository.sendTextMessage(
      chat: chat,
      success: (data) {
        var responseModel = responseFromJson(data.toString());
        var sentChat = Chat.fromJson(responseModel.data);
        messages[messages.indexOf(chat)] = sentChat;
        printLog("2222222");
      },
      failure: (error) {
        printLog("#cr1-e");
        printLog(error.response?.data);
        try {
          var responseModel = ResponseModel.fromJson(error.response!.data!);
          var errorChat = Chat.fromJson(responseModel.data);
          printLog("000000");
          messages[messages.indexOf(chat)] = errorChat;
          printLog("111111111111");
        } catch (_) {
          printLog("333333333");
          printLog(_);
        }
      },
    );
  }


  @override
  void sendFileMessage(String filePath) {
    File file = File(filePath);
    printLog("file.absolute.path");
    printLog(file.absolute.path.toString());
    printLog(filePath);
    Chat chat = Chat(
        id: DateTime
            .now()
            .millisecond,
        targetId: chatArguments.id!,
        date: DateTime.now().toString(),
        sendOrReceive: "SEND",
        type: MessageType.file.name.toUpperCase(),
        file: filePath,
        seen: false,
        sent: false);
    messages.add(chat);
    scrollController.animateTo(0,
        duration: const Duration(milliseconds: 10), curve: Curves.linear);

    _chatRepository.sendFile(
      chat: chat,
      success: (data) {
        var responseModel = responseFromJson(data.toString());
        var sentChat = Chat.fromJson(responseModel.data);
        messages[messages.indexOf(chat)] = sentChat;
        printLog("2222222");
      },
      failure: (error) {
        printLog("#cr1-e");
        printLog(error.response?.data);
        try {
          var responseModel = ResponseModel.fromJson(error.response!.data!);
          var errorChat = Chat.fromJson(responseModel.data);
          printLog("000000");
          messages[messages.indexOf(chat)] = errorChat;
          printLog("111111111111");
        } catch (_) {
          printLog("333333333");
          printLog(_);
        }
      },
      onSendProgress: (count, total) {
        printLog("$count/$total");
      },
    );
  }


  @override
  void sendAudioMessage(String filePath) {
    // TODO: implement sendAudioMessage
  }

  @override
  void sendMultimediaMessage(String filePath) {
    // TODO: implement sendMultimediaMessage
  }


  @override
  void deleteChat(Chat chat, {bool deleteForEveryOne = false}) {
    messages.remove(chat);
    _chatRepository.deleteMessage(
      chatId: chat.id!,
      deleteForEveryone: deleteForEveryOne ? 1:0,
      success: (data) {
        var responseModel = responseFromJson(data.toString());
        printLog("#dmr");
        printLog(data);
      },
      failure: (error) {
        printLog("#dm0-e");
        printLog(error.response?.data);
      },
    );
  }

  @override
  void initializeSocket() async {
    appController.socket.on(BaseSocket.messageChannel.updateMessage, (updatedMessage) {
      var message = Chat.fromJson(updatedMessage);

      Chat? foundMessage;
      for (var element in messages) {
        if(element.id == message.id){
          foundMessage = element;
        }
      }

      try{
        var index=messages.indexOf(foundMessage);
        messages[index] = message;
      }catch(_){}

    });
    appController.socket.on(BaseSocket.messageChannel.message, (message) {

      var newMessage = Chat.fromJsonForSeen(message,appController.user.value!.email.toString(),targetEmail);
      if(messages.where((element) => element.id == newMessage.id).isEmpty) {
        messages.add(newMessage);
        printLog("seen");
        printLog(newMessage.toJson());
        appController.socket.emitWithAck(BaseSocket.messageChannel.seenMessage,newMessage.toJson());
      }
    });
  }

  @override
  void initUserStatus() {
    appController.socket.on(BaseSocket.userChannel.onlineUsers, (data) {
      var onlines = OnlineUsers.fromJson(data);
      var _status = "offline";
      for (var element in onlines.users!) {
        printLog("user status");
        if(element.profileImage == targetProfile.value){
          _status = "online";
        }
      }
      status.value = _status;
    });
  }

  @override
  void initTypingStatus() {
    appController.socket.on(BaseSocket.messageChannel.typing, (data) {
      printLog("status type");

      try{
        var onlines = OnlineUsers.fromJson(data);
        for (var element in onlines.users!) {
          printLog("status type");
          printLog(element.fullName);
          if(element.profileImage == targetProfile.value){
            status.value = "typing...";
          }
        }
      }catch(e){}
    });
  }

  @override
  void call() {
    Get.toNamed(MyRoute.callRoute,arguments: {"data":chatArguments,"type":'voice'});
  }

  @override
  void videoCall() {
    Get.toNamed(MyRoute.callRoute,arguments: {"data":chatArguments,"type":'video'});
  }

}


