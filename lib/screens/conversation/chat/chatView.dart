
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:images_picker/images_picker.dart';
import '../../../model/response/chat.dart';
import '../../../utils/enums.dart';
import '../../../utils/log.dart';
import '../../../utils/theme/colors.dart';
import '../../../utils/theme/texts.dart';
import '../../../widgets/appBar.dart';
import '../../../widgets/chatAttachmentPicker.dart';
import '../../../widgets/chatItem.dart';
import '../../../widgets/deleteMessageDialog.dart';
import 'chatController.dart';
import 'interface/chatViewInterface.dart';


class ChatView extends GetView<ChatController> implements ChatViewInterface {
  const ChatView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: appBar(),
      body: body(context),
    );
  }

  @override
  appBar() {
    return defaultAppBar(
        title: controller.targetName.value,
        actions: [
          IconButton(onPressed: () {controller.call();}, icon: const Icon(Icons.call)),
          IconButton(
              onPressed: () {controller.videoCall();}, icon: const Icon(Icons.videocam_rounded)),
        ],
        showLeading: false,
        elevation: 4,
      subtitle: Obx(() => Text(
          controller.status.value,
          style: TextStyle(
              fontSize: 12.0,
              fontWeight: FontWeight.normal,
              color: controller.status.value == "offline" ? Colors.black54
                  : controller.status.value == "online" ? Colors.green
                  : Colors.blue
          ))
    ));
  }

  @override
  Widget body(BuildContext context) {
    return Column(
      children: [
        Expanded(child: chats()),
        inputLayout()
      ],
    ).paddingSymmetric(horizontal: 8);
  }

  @override
  Widget chats() {
    return SingleChildScrollView(
        reverse: true,
        controller: controller.scrollController,
        child: Obx(() =>
            Column(
              children: message(controller.messages),
            )));
  }

  List<Widget> message(RxList<Chat> messages) {
    return messages.map((chat) {
      printLog(chat.file.toString());
      Widget widget = Container();
      if (chat.type.toString() == MessageType.chat.name.toUpperCase()) {
        if (chat.targetId != controller.appController.user.value!.id) {
          MessageStatus status = MessageStatus.pending;
          if (chat.sent!) {
            status = MessageStatus.sent;
          }
          if (chat.seen!) {
            status = MessageStatus.seen;
          }
          widget = userMessage(
              chat.id!, chat.message.toString(), chat.date!, status,(){
            deleteMessageDialog(Get.context!,onClick: (bool deleteForEveryone){
              controller.deleteChat(chat,deleteForEveryOne: deleteForEveryone);
            });
          });
        } else {
          widget = targetMessage(chat.id!, chat.message.toString(), chat.date!,(){
            deleteMessageDialog(Get.context!,showCheckBox: false,onClick: (bool deleteForEveryone){
              controller.deleteChat(chat,deleteForEveryOne: deleteForEveryone);
            });});
        }
      }
      if (chat.type.toString() == MessageType.file.name.toUpperCase()) {
        if (chat.sendOrReceive.toString() == "SEND") {
          MessageStatus status = MessageStatus.pending;
          if (chat.seen!) {
            status = MessageStatus.seen;
          }
          if (chat.sent!) {
            status = MessageStatus.sent;
          }
          widget = userFileMessage(
            id: chat.id!,
            status: status,
            src: chat.file!,
            time: chat.date!,
            onPressed: (){
              deleteMessageDialog(Get.context!,onClick: (bool deleteForEveryone){
                controller.deleteChat(chat,deleteForEveryOne: deleteForEveryone);
              });
            }
          );
        } else {
          widget = targetFileMessage(
            id: chat.id!,
            src: chat.file!,
            time: chat.date!,
              onPressed: (){
                deleteMessageDialog(Get.context!,showCheckBox: false,onClick: (bool deleteForEveryone){
                  controller.deleteChat(chat,deleteForEveryOne: deleteForEveryone);
                });
              }
          );
        }
      }
      return widget;
    }).toList();
  }

  @override
  Widget inputLayout() {
    return Row(
      mainAxisSize: MainAxisSize.max,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        Expanded(child:
        Container(
            margin: const EdgeInsets.symmetric(horizontal: 8),
            decoration: BoxDecoration(
                color: chatInputBackgroundColor,
                borderRadius: BorderRadius.circular(16)
            ),
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                emojiButton(),
                Expanded(child: inputMessage()),
                attachButton(),
                cameraButton()
              ],
            ))),
        sendButton(),
      ],
    ).marginOnly(bottom: 8);
  }

  @override
  Widget sendButton() {

    return FloatingActionButton(onPressed: controller.sendTextMessage,
        child: const Icon(Icons.send, color: Colors.white,));
  }

  //todo
  @override
  Widget attachButton() {
    return GestureDetector(
        onTap: openGallery,
        // child: const Icon(Icons.attach_file_rounded, color: Colors.black45,))//todo
        child: const Icon(Icons.photo_library_rounded, color: Colors.black45,))
        .paddingSymmetric(horizontal: 8, vertical: 16);
  }

  @override
  Widget cameraButton() {
    return GestureDetector(
        onTap: () {
          ImagesPicker.openCamera(
            pickType: PickType.image,
          ).then((medias) {
            try{
              controller.sendFileMessage(medias![0].path.toString());
            }catch(_){}
          });
        },
        child: const Icon(Icons.camera_alt_rounded, color: Colors.black45,))
        .paddingSymmetric(horizontal: 8, vertical: 16);
  }

  @override
  Widget emojiButton() {
    return GestureDetector(
        onTap: () {},
        child: const Icon(Icons.emoji_emotions_rounded, color: Colors.black45,))
        .paddingSymmetric(horizontal: 8, vertical: 16);
  }

  @override
  Widget inputMessage() {
    return TextFormField(
      textAlignVertical: TextAlignVertical.top,
      controller: controller.messageController,
      enabled: true,
      style: normalTextStyle(),
      cursorColor: textInputColor,
      autofocus: false,
      decoration: const InputDecoration(
        iconColor: Colors.black,
        alignLabelWithHint: true,
        border: InputBorder.none,
        hintStyle: TextStyle(color: Colors.grey),
        hintText: "Type a Message...",
      ),
    );
  }

  //todo
  @override
  void showAttachmentDialog() {
    chatAttachmentPickerDialog(Get.context!, onClickDocument: openDocuments,
        onClickGallery: openGallery,
        onClickAudio: openAudio);
  }

  @override
  void openAudio() {
    printLog("audio");
  }

  @override
  void openDocuments() {
    printLog("document");
  }

  @override
  void openGallery() {
    ImagesPicker.pick(
      count: 1,
      pickType: PickType.image,
    ).then((medias) {
      try{
        controller.sendFileMessage(medias![0].path.toString());
      }catch(_){}
    });
  }

  @override
  void openCamera() {
    // TODO: implement openCamera
  }

}