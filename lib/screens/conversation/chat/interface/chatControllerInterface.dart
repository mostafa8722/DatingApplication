

import '../../../../model/response/chat.dart';

abstract class ChatControllerInterface{
  void initializeSocket();
  void initializePeople();
  void getMessages();
  void sendTextMessage();
  void deleteChat(Chat chat,{bool deleteForEveryOne=false});
  void call();
  void initUserStatus();
  void initTypingStatus();
  void videoCall();
  void showEmoj();
  void showGift();
  void sendFileMessage(String filePath);
  void sendAudioMessage(String filePath);
  void sendMultimediaMessage(String filePath);
}