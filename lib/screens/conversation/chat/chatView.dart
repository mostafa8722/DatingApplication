
import 'package:Lover369/model/response/gift.dart';
import 'package:Lover369/widgets/error_connection.dart';
import 'package:Lover369/widgets/loading.dart';
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
import 'package:emoji_picker_flutter/emoji_picker_flutter.dart';

class ChatView extends GetView<ChatController> implements ChatViewInterface {
  final TextEditingController _controller = TextEditingController();

  ChatView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: appBar(),
      body: body(context),

    );
  }
  _onBackspacePressed() {

    controller.showEmoj();


  }
  _onEmojiSelected(Category? category, Emoji emoji) {

    controller.messageController.text = controller.messageController.text + "" + emoji.emoji ;

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
        Expanded(child :
       Center(
         child:  Stack(
           alignment: Alignment.center,
           children: [
           chats(),
           Obx(() => controller.loadingMore.value? Positioned(

               top: 5,
               child: Row(
                 mainAxisAlignment: MainAxisAlignment.center,
                 children: [
                   circularLoading()
                 ],
               )):SizedBox())
         ],),
       )
        ),
        inputLayout(context),
        emojiLayout(),
       giftLayout(),
       kissLayout(),

      ],
    ).paddingSymmetric(horizontal: 8);
  }
Widget _widgetGift (BuildContext context ,int index){
    var currentList = controller.giftList[index];
    return GestureDetector(
      onTap: (){
        controller.sendGift(currentList.toJson()["id"]);
      },
      child:


   Container(

     child:  Column(
       children: [
         Image.network(
           currentList.toJson()["image"].toString(),
           height: 90,
           width: 90,
         ),

         SizedBox(height: 10,),
         Center(
           child: Row(
             mainAxisAlignment: MainAxisAlignment.center,
             children: [
               Icon(Icons.monetization_on_outlined,color: Colors.amber,),
               Text(currentList.toJson()["token"].toString())
             ],
           ),
         )
       ],
     ),
   )
    );
}

  Widget _widgetKiss (BuildContext context ,int index){
    var currentList = controller.giftList[index];
    return GestureDetector(
        onTap: (){
          controller.sendKiss();
        },
        child:


        Container(

          child:  Column(
            children: [
              Image.network(
                "https://lover369.com/media/video/love.gif",
                height: 90,
                width: 90,
              ),


            ],
          ),
        )
    );
  }



  @override
  Widget chats() {
    return Obx(() =>controller.showInternetConnection.value?
    ErrorConnection(controller.retryConnection): controller.loading.value?circularLoading():
    NotificationListener<ScrollNotification>(
        onNotification: (scrollNotification) {
          if (scrollNotification is ScrollStartNotification) {
            _onStartScroll(scrollNotification.metrics);
          } else if (scrollNotification is ScrollUpdateNotification) {
            _onUpdateScroll(scrollNotification.metrics);
          } else if (scrollNotification is ScrollEndNotification) {
            _onEndScroll(scrollNotification.metrics);
          }
          return true;
        },
        child: SingleChildScrollView(
            reverse: true,

            controller: controller.scrollController,

            child: Obx(() =>
                Column(

                  children:message(controller.messages),
                )))
    )

    );
  }


  _onStartScroll(ScrollMetrics metrics) {
    print("Scroll22 Start");
  }

  _onUpdateScroll(ScrollMetrics metrics) {
    print("Scroll22 Update");
  }

  _onEndScroll(ScrollMetrics metrics) {
    print("Scroll22 End");
    controller.updateMessage();
  }

  List<Widget> message(RxList<Chat> messages) {
    printLog("2222222aa");
    printLog(  messages.value.length);
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
      if (chat.type.toString() == MessageType.file.name.toUpperCase() || chat.type.toString() == MessageType.gif.name.toUpperCase() || chat.type.toString() == MessageType.gift.name.toUpperCase()) {
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
              src: chat.file??"",
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


      if (chat.type.toString() == MessageType.kiss.name.toUpperCase()) {
        if (chat.sendOrReceive.toString() == "SEND") {
          MessageStatus status = MessageStatus.pending;
          if (chat.seen!) {
            status = MessageStatus.seen;
          }
          if (chat.sent!) {
            status = MessageStatus.sent;
          }
          widget = userKissMessage(
              id: chat.id!,
              status: status,
              src: chat.file??"",
              time: chat.date!,
              onPressed: (){
                deleteMessageDialog(Get.context!,onClick: (bool deleteForEveryone){
                  controller.deleteChat(chat,deleteForEveryOne: deleteForEveryone);
                });
              }
          );
        } else {
          widget = targetKissMessage(
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

  List<Widget> giftList(List<Gift> gifts) {
    return gifts.map(( gift) {

      printLog(giftToJson(gift));

      return GestureDetector(
        onTap: (){},
        child: Column(children: [
          Text(gift.toJson()["image"])
        ],),
      );
    }).toList();
  }

  @override
  Widget inputLayout(BuildContext context) {
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
                //attachButton(),
                cameraButton(context),
                videoButton(context)
              ],
            ))),
        sendButton(),
      ],
    ).marginOnly(bottom: 8);
  }

  @override
  Widget emojiLayout(){
    return  Obx(() =>Offstage(
          offstage: !controller.emojiShowing.value,
          child:Column(children: [
            SizedBox(
                height: 250,
                child:

                EmojiPicker(
                  textEditingController: _controller,
                  onBackspacePressed: _onBackspacePressed,
                  onEmojiSelected:_onEmojiSelected,
                  config: Config(
                    columns: 7,
                    // Issue: https://github.com/flutter/flutter/issues/28894
                    emojiSizeMax: 32 * 1.0,
                    verticalSpacing: 0,
                    horizontalSpacing: 0,
                    gridPadding: EdgeInsets.zero,
                    initCategory: Category.RECENT,
                    bgColor: const Color(0xFFF2F2F2),
                    indicatorColor: Colors.blue,
                    iconColor: Colors.grey,
                    iconColorSelected: Colors.blue,
                    backspaceColor: Colors.blue,
                    skinToneDialogBgColor: Colors.white,
                    skinToneIndicatorColor: Colors.grey,
                    enableSkinTones: true,
                    recentTabBehavior: RecentTabBehavior.RECENT,
                    recentsLimit: 28,
                    replaceEmojiOnLimitExceed: false,
                    noRecents: const Text(
                      'No Recents',
                      style: TextStyle(fontSize: 20, color: Colors.black26),
                      textAlign: TextAlign.center,
                    ),
                    loadingIndicator: const SizedBox.shrink(),
                    tabIndicatorAnimDuration: kTabScrollDuration,
                    categoryIcons: const CategoryIcons(),
                    buttonMode: ButtonMode.MATERIAL,
                    checkPlatformCompatibility: true,

                  ),
                )


            ),
           actionButton(),
          ],)

        ),
    );
  }

  @override
  Widget giftLayout(){
   return  Obx(() =>Offstage(
      offstage: !controller.giftShowing.value,
      child:Column(children: [
        SizedBox(
            height: 220,
            child: GridView.builder(
                itemCount: controller.giftList.length,
                gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                    crossAxisCount: 3),
                itemBuilder: _widgetGift)
        ),
        actionButton(),
      ],),
    )
    );
  }

  @override
  Widget kissLayout(){
    return  Obx(() =>Offstage(
      offstage: !controller.kissShowing.value,
      child:Column(children: [
        SizedBox(
            height: 220,
            child: GridView.builder(
                itemCount: 1,
                gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                    crossAxisCount: 3),
                itemBuilder: _widgetKiss)
        ),
        actionButton(),
      ],),
    )
    );
  }

  Widget actionButton(){
    return  Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        GestureDetector(
          onTap: (){
            if(!controller.emojiShowing.value)
                controller.showEmoj();
          },
          child:  Container(
            padding: EdgeInsets.symmetric(vertical: 5,horizontal: 10),
            decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(5),
                color:controller.emojiShowing.value? Colors.lightBlueAccent:Color(0xffeeeeee)
            ),
            child: Center(child: Text("Emoji",style: TextStyle(color: controller.emojiShowing.value?Colors.white:Colors.black),),),
          ),
        ),
        GestureDetector(
          onTap: (){
            if(!controller.giftShowing.value)
            controller.showGift();
          },
          child:  Container(
            padding: EdgeInsets.symmetric(vertical: 5,horizontal: 10),
            margin: EdgeInsets.symmetric(vertical: 5,horizontal: 5),
            decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(5),
                color:controller.giftShowing.value? Colors.lightBlueAccent:Color(0xffeeeeee)
            ),
            child: Center(child: Text("Gift",style: TextStyle(color: controller.giftShowing.value?Colors.white:Colors.black)),),
          ),
        ),
        GestureDetector(
          onTap: (){
            if(!controller.kissShowing.value)
              controller.showKiss();

          },
          child:  Container(
            padding: EdgeInsets.symmetric(vertical: 5,horizontal: 10),
            decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(5),
                color:controller.kissShowing.value? Colors.lightBlueAccent:Color(0xffeeeeee)
            ),
            child: Center(child: Text("Kiss",style: TextStyle(color: controller.kissShowing.value?Colors.white:Colors.black)),),
          ),
        )
      ],);
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
  Widget cameraButton(BuildContext context) {
    return GestureDetector(
        onTap: () {
          _showDialogForImage(context,"image");

        },
        child: const Icon(Icons.camera_alt_rounded, color: Colors.black45,))
        .paddingSymmetric(horizontal: 8, vertical: 16);
  }

  @override
  Widget videoButton(BuildContext context) {
    return GestureDetector(
        onTap: () {
          _showDialogForImage(context,"video");
        },
        child: const Icon(Icons.videocam, color: Colors.black45,))
        .paddingSymmetric(horizontal: 8, vertical: 16);
  }
  @override
  Widget emojiButton() {


    return GestureDetector(
        onTap: () {
          controller.showEmoj();
        },
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


 void _showDialogForImage(BuildContext context,type){
   showDialog<void>(

     context: context,
     builder: (BuildContext context) {
       return AlertDialog(
         shape: RoundedRectangleBorder(
           borderRadius: BorderRadius.circular(20),
         ),
         content:    Container(

           color: Colors.white,
           padding: EdgeInsets.symmetric(vertical: 15,horizontal: 5),

           child: Column(
             mainAxisAlignment: MainAxisAlignment.center,
             mainAxisSize: MainAxisSize.min,
             children: <Widget>[
               GestureDetector(
                 onTap: (){
                   Navigator.pop(context, false);
                   ImagesPicker.openCamera(
                     pickType:type=="image"?PickType.image: PickType.video,
                   ).then((medias) {
                     try{
                       controller.sendFileMessage(medias![0].path.toString());
                     }catch(_){}
                   });
                 },
                 child:  Row(children: [
                   SizedBox(
                     width: 10,
                   ),
                   Icon(Icons.camera),
                   SizedBox(
                     width: 10,
                   ),
                   Text("Camera"),
                 ],) ,

               ),
               SizedBox(height: 20,),
               Divider(height: 10,color: Color(0xffeeeeee)),
               SizedBox(height: 20,),
               GestureDetector(
                 onTap: (){
                   Navigator.pop(context, false);
                   ImagesPicker.pick(
                     count: 1,
                     pickType:type=="image"?PickType.image: PickType.video,
                   ).then((medias) {
                     try{
                       controller.sendFileMessage(medias![0].path.toString());
                     }catch(_){}
                   });
                 },
                 child:  Row(children: [
                   SizedBox(
                     width: 10,
                   ),
                   Icon(Icons.photo_library_rounded),
                   SizedBox(
                     width: 10,
                   ),
                   Text("Gallery")
                 ],) ,

               )


             ],
           ),
         ),
       );

     },
   );
 }
}