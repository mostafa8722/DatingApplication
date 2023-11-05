
import 'package:flutter/material.dart';

import '../../../../base/baseViewInterface.dart';


abstract class ChatViewInterface extends BaseViewWithAppBarInterface{
  Widget chats();
  Widget inputLayout();
  Widget sendButton();
  Widget inputMessage();
  Widget cameraButton();
  Widget attachButton();
  Widget emojiButton();
  void showAttachmentDialog();
  void openGallery();
  void openAudio();
  void openDocuments();
  void openCamera();
}