
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../widgets/appBar.dart';
import '../../widgets/conversationItem.dart';
import '../../widgets/divider.dart';
import '../../widgets/onlineUserItem.dart';
import '../../widgets/titleWidget.dart';
import 'conversationController.dart';
import 'interfaces/conversationViewInterface.dart';


class ConversationView extends GetView<ConversationController> implements ConversationViewInterface{
  const ConversationView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: appBar(),
      body: body(context),
    );
  }

  @override
  appBar() {
    return searchAppBar(
        title: "Chats",
        onSearch: controller.onSearch,
        showLeading: false
    );
  }

  @override
  Widget body(BuildContext context) {
    controller.getConversations();
    return Column(
      children: [
        Obx(() => onlineUser()),
        const TransparentDivider(height: 8),
        Expanded(child: conversations())
      ],
    );
  }

  @override
  Widget conversations() {
    return Obx(() {
      var list = controller.searchText.value.isEmpty ? controller.conversations:controller.filterConversations;
        return ListView.builder(
            itemCount:list.length,
            itemBuilder: (context, index) {
              var conversation = list[index];

              return conversationItem(
                  image:conversation.user != null ?conversation.user?.target?.profile.toString():"",
                  name: conversation.user != null ? conversation.user?.target?.fullName.toString():"",
                  lastMessage: conversation.latestMessage!= null &&  conversation.latestMessage!.message!= null? conversation.latestMessage!.message.toString():"",
                  time: conversation.latestMessage!= null ? conversation.latestMessage!.date.toString():DateTime.now().toString(),
                  isOnline: false,
                  itemClicked: ()=>controller.gotoChat(conversation)
              );
            });}
    );
  }

  @override
  Widget onlineUser() {
    return Column(
      children: [
        titleWidget(title: "Online User(${controller.onlineUserCount})",
            widget:  Container(
              height: 80,
                child:ListView.builder(
                  itemCount: controller.onlineUsers.length+1,
                scrollDirection: Axis.horizontal,
                itemBuilder: (context, index) {
                    if(index==0){
                      return const VerticalTransparentDivider(width: 16);
                    }
              var onlineUser = controller.onlineUsers[index-1];
                return onlineUserItem(name: onlineUser.fullName,image: onlineUser.profileImage,itemClicked: ()=>controller.gotoChat(onlineUser));
            })),
            horizontalMargin: 16,seeAll: false)
      ],
    ).marginOnly(top: 12);
  }
}