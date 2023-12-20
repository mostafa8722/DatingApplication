
import 'package:flutter/material.dart';

import '../../../../base/baseViewInterface.dart';


abstract class ChatViewInterface extends BaseViewWithAppBarInterface{
  Widget chats();
  Widget inputLayout(BuildContext context);
  Widget sendButton();
  Widget inputMessage();
  Widget cameraButton(BuildContext context);
  Widget attachButton();
  Widget emojiButton();
  Widget emojiLayout();
  Widget giftLayout();
  void showAttachmentDialog();
  void openGallery();
  void openAudio();
  void openDocuments();
  void openCamera();
}