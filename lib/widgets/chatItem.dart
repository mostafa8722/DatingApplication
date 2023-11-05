import 'dart:io';


import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';

import '../utils/enums.dart';
import '../utils/theme/colors.dart';
import 'divider.dart';

const chatCardRadius = Radius.circular(16.0);

String getChatTime(String date) {
  DateTime now = DateTime.parse(date);
  String formattedDate = DateFormat('KK:mm').format(now);
  return formattedDate;
}

Widget userMessage(int id, String text, String time, MessageStatus status,void Function() onPressed) {
  return GestureDetector(
    onLongPress: () {
      onPressed();
    },
    child: Container(
    width: double.infinity,
    margin: const EdgeInsets.symmetric(vertical: 8),
    child: Row(
        mainAxisSize: MainAxisSize.min,
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Container(),
          Container(
              padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 12),
              decoration: const BoxDecoration(
                  color: userChatItemColor,
                  borderRadius: BorderRadius.only(
                      topLeft: chatCardRadius,
                      topRight: chatCardRadius,
                      bottomLeft: chatCardRadius)),
              child: ConstrainedBox(
                constraints: BoxConstraints(
                    maxWidth: MediaQuery.of(Get.context!).size.width * 0.7),
                child: Column(
                    crossAxisAlignment: CrossAxisAlignment.end,
                    children: [
                      Text(
                        text,
                        maxLines: 10,
                        overflow: TextOverflow.visible,
                        textAlign: TextAlign.start,
                        style: const TextStyle(
                            color: Colors.white, fontSize: 14, height: 1.5),
                      ),
                      const SizedBox(
                        height: 4,
                        width: 0,
                      ), Row(
                          mainAxisSize: MainAxisSize.min,
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: [
                            Text(getChatTime(time),
                                style: const TextStyle(
                                    color: Colors.white, fontSize: 12)),
                            const SizedBox(
                              width: 4,
                              height: 0,
                            ),
                            Icon(
                              status == MessageStatus.pending
                                  ? Icons.access_time_sharp
                                  : status == MessageStatus.sent
                                      ? Icons.check
                                      : status == MessageStatus.seen
                                          ? Icons.check_circle
                                          : Icons.warning_amber,
                              size: 16,
                              color: Colors.white,
                            )
                          ])
                    ]),
              ))
        ]),
  ));
}

Widget targetMessage(
  int id,
  String text,
  String time,
    void Function() onPressed
) {
  return GestureDetector(
      onLongPress: () {
    onPressed();
  },
  child: Container(
    width: double.infinity,
    margin: const EdgeInsets.symmetric(vertical: 8),
    child: Row(
        mainAxisSize: MainAxisSize.min,
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Container(
              padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 12),
              decoration: const BoxDecoration(
                  color: targetChatItemColor,
                  borderRadius: BorderRadius.only(
                      topRight: chatCardRadius,
                      bottomLeft: chatCardRadius,
                      bottomRight: chatCardRadius)),
              child: ConstrainedBox(
                constraints: BoxConstraints(
                    maxWidth: MediaQuery.of(Get.context!).size.width * 0.7),
                child: Column(
                    crossAxisAlignment: CrossAxisAlignment.end,
                    children: [
                      Text(
                        text,
                        maxLines: 10,
                        overflow: TextOverflow.visible,
                        textAlign: TextAlign.start,
                        style: const TextStyle(fontSize: 14),
                      ),
                      const SizedBox(
                        height: 4,
                        width: 0,
                      ),
                      Text(
                        getChatTime(time),
                        style: const TextStyle(fontSize: 12),
                      )
                    ]),
              )),
          Container(),
        ]),
  ));
}

Widget userFileMessage(
    {required int id,
    required String src,
    required String time,
    required MessageStatus status,
    required void Function() onPressed
    }) {
   return GestureDetector(
      onLongPress: () {
    onPressed();
  },
  child:Row(mainAxisAlignment: MainAxisAlignment.spaceBetween, children: [
    Expanded(flex: 5, child: Container()),
    Expanded(
        flex: 5,
        child: Container(
            padding: const EdgeInsets.all(1),
            decoration: const BoxDecoration(
                color: userChatItemColor,
                borderRadius: BorderRadius.only(
                    topLeft: chatCardRadius,
                    topRight: chatCardRadius,
                    bottomLeft: chatCardRadius)),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.end,
              children: [
                AspectRatio(
                    aspectRatio: 1,
                    child: Container(
                      clipBehavior: Clip.hardEdge,
                      decoration: const BoxDecoration(
                          color: userChatItemColor,
                          borderRadius: BorderRadius.only(
                            topLeft: chatCardRadius,
                            topRight: chatCardRadius,
                          )),
                      child: SizedBox(
                          width: double.infinity,
                          child: Image.network(
                            src,
                            fit: BoxFit.cover,
                            errorBuilder: (context, error, stackTrace) =>
                                Image.file(
                              File(src),
                              fit: BoxFit.cover,
                              errorBuilder: (context, error, stackTrace) =>
                                  Container(),
                            ),
                          )),
                    )),
                Row(
                    mainAxisSize: MainAxisSize.min,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      Text(getChatTime(time),
                          style: const TextStyle(
                              color: Colors.white, fontSize: 12)),
                      const SizedBox(
                        width: 4,
                        height: 0,
                      ),
                      Icon(
                        status == MessageStatus.pending
                            ? Icons.access_time_sharp
                            : status == MessageStatus.sent
                                ? Icons.check
                                : status == MessageStatus.seen
                                    ? Icons.check_circle
                                    : Icons.warning_amber,
                        size: 16,
                        color: Colors.white,
                      )
                    ]).marginAll(8)
              ],
            )))
  ]).marginSymmetric(vertical: 8));
}

Widget targetFileMessage({
  required int id,
  required String src,
  required String time,
  required void Function() onPressed
}) {
  return GestureDetector(
      onLongPress: () {
    onPressed();
  },
  child: Row(mainAxisAlignment: MainAxisAlignment.spaceBetween, children: [
    Expanded(
        flex: 5,
        child: Container(
            padding: const EdgeInsets.all(1),
            decoration: const BoxDecoration(
                color: targetChatItemColor,
                borderRadius: BorderRadius.only(
                    topRight: chatCardRadius,
                    bottomLeft: chatCardRadius,
                    bottomRight: chatCardRadius)),
            child:
                Column(crossAxisAlignment: CrossAxisAlignment.end, children: [
              AspectRatio(
                  aspectRatio: 1,
                  child:Container(
                    clipBehavior: Clip.hardEdge,
                    decoration: const BoxDecoration(
                        color: userChatItemColor,
                        borderRadius: BorderRadius.only(
                          topLeft: chatCardRadius,
                          topRight: chatCardRadius,
                        )),
                    child: Image.network(
                    src,
                    fit: BoxFit.cover,
                    errorBuilder: (context, error, stackTrace) => Container(),
                  ))),
              Text(
                getChatTime(time),
                style: const TextStyle(fontSize: 12),
              ).marginAll(8)
            ]))),
    Expanded(flex: 5, child: Container())
  ]).marginSymmetric(vertical: 8));
}

Widget userMultimediaMessage({required int id, required String src}) {
  return Row(mainAxisAlignment: MainAxisAlignment.spaceBetween, children: [
    Expanded(flex: 5, child: Container()),
    Expanded(
        flex: 5,
        child: Container(
            padding: const EdgeInsets.all(2),
            decoration: const BoxDecoration(
                color: userChatItemColor,
                borderRadius: BorderRadius.only(
                    topLeft: chatCardRadius,
                    topRight: chatCardRadius,
                    bottomLeft: chatCardRadius)),
            child: AspectRatio(
                aspectRatio: 1,
                child: Container(
                    child: Image.network(
                  src,
                  fit: BoxFit.cover,
                  errorBuilder: (context, error, stackTrace) => Container(),
                )))))
  ]).marginSymmetric(vertical: 8);
}

Widget targetMultimediaMessage({required int id, required String src}) {
  return Row(mainAxisAlignment: MainAxisAlignment.spaceBetween, children: [
    Expanded(
        flex: 5,
        child: AspectRatio(
            aspectRatio: 5,
            child: Image.network(
              src,
              fit: BoxFit.cover,
              errorBuilder: (context, error, stackTrace) => Container(),
            ))),
    Expanded(flex: 3, child: Container())
  ]).marginSymmetric(vertical: 8);
}

Widget dateMessage() {
  return Container();
}
