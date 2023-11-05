
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

import '../utils/res.dart';
import '../utils/theme/colors.dart';
import '../utils/theme/theme.dart';
import 'divider.dart';

String getConversationTime(String date) {
  DateTime now = DateTime.parse(date);
  String formattedDate = DateFormat('KK:mm').format(now);
  return formattedDate;
}

Widget conversationItem({
  String? name,
  String? lastMessage,
  String? image,
  String? time,
  int unreadCount = 0,
  bool isOnline = false,
  Function? itemClicked,
}) {
  return GestureDetector(
  onTap:(){itemClicked!();},
    child: Stack(
    children:[Container(
    padding: const EdgeInsets.all(8),
    margin: const EdgeInsets.symmetric(horizontal: 16, vertical: 4),
    height: 70,
    width: double.infinity,
    decoration: BoxDecoration(
        color: actionItemBackgroundColor,
        borderRadius: BorderRadius.circular(actionRounded)),
    child: Row(
      children: [
        Container(
                clipBehavior: Clip.hardEdge,
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(8)
                ),
                child: AspectRatio(
                    aspectRatio: 1,
                    child: Image.network(
                      image.toString(),
                      fit: BoxFit.cover,
                    )),
        ),
        const VerticalTransparentDivider(
          width: 8,
        ),
        Expanded(
            child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
            Text(name.toString(),
                style: const TextStyle(fontWeight: FontWeight.bold, fontSize: 15)),
            Text(lastMessage.toString(),
                style: const TextStyle(fontSize: 13, overflow: TextOverflow.ellipsis))
          ],
        )),
        const VerticalTransparentDivider(
          width: 8,
        ),
        Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
            unreadCount==0 ?Container():Container(
              padding:const  EdgeInsets.all(4),
              decoration:const BoxDecoration(
                shape: BoxShape.circle,
                color:badgeColor,
                boxShadow: [BoxShadow(color: Colors.blue,blurRadius: 3)]
              ),
              child: Text(unreadCount.toString(),
                  style: const TextStyle(fontSize: 13,color: Colors.white)),
            ),
            Text(getConversationTime(time!),
                style: const TextStyle(fontSize: 13, overflow: TextOverflow.ellipsis))
          ],
        )
      ],
    ),
  ),
  isOnline ? const Positioned(child: Icon(Icons.circle_rounded,size: 12,color: Colors.green,),left:64,bottom: 8,):Container()
  ]));
}
