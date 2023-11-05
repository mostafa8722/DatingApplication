
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../utils/res.dart';
import '../utils/theme/colors.dart';
import '../utils/theme/theme.dart';

Widget storyItem({
  String? name,
  String? image,
  int unreadCount = 0,
  bool isOnline = false,
  Function? itemClicked,
}) {
  return GestureDetector(
      onTap: () {
        itemClicked!();
      },
      child: Container(
        padding: const EdgeInsets.all(8),
        margin: const EdgeInsets.symmetric(horizontal: 16, vertical: 4),
        width: 80,
        decoration: BoxDecoration(
            color: actionItemBackgroundColor,
            borderRadius: BorderRadius.circular(actionRounded)),
        child: Column(
          children: [
            Container(
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(4),
                    border:
                        Border.all(width: 2.0, color: const Color(0xFFFFFFFF))),
                child: AspectRatio(
                    aspectRatio: 1,
                    child: Image.network(
                      image.toString(),
                      fit: BoxFit.cover,
                    ))),
            SizedBox(
              height: 8,
              width: 0,
            ),
            Text(
              "ALi",
              style: TextStyle(fontSize: 14.0, fontWeight: FontWeight.bold),
              maxLines: 1,
              overflow: TextOverflow.ellipsis,
            )
          ],
        ),
      ));
}

Widget myStoryItem({
  String? name,
  String? image,
  int unreadCount = 0,
  bool isOnline = false,
  Function? itemClicked,
}) {
  return GestureDetector(
      onTap: () {
        itemClicked!();
      },
      child: Container(
        padding: const EdgeInsets.all(8),
        margin: const EdgeInsets.symmetric(horizontal: 16, vertical: 4),
        width: 80,
        decoration: BoxDecoration(
            color: actionItemBackgroundColor,
            borderRadius: BorderRadius.circular(actionRounded)),
        child: Column(
          children: [
            Container(
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(4),
                    border:
                        Border.all(width: 2.0, color: const Color(0xFFFFFFFF))),
                child: AspectRatio(
                    aspectRatio: 1,
                    child: Image.network(
                      image.toString(),
                      fit: BoxFit.cover,
                    ))),
            SizedBox(
              height: 8,
              width: 0,
            ),
            Container(
              padding: EdgeInsets.symmetric(horizontal: 8),
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(4),
                    color: Colors.white),
                child: Text(
                  "+",
                  style: TextStyle(
                      fontSize: 14.0,
                      fontWeight: FontWeight.bold,
                      color: Colors.black),
                  maxLines: 1,
                  overflow: TextOverflow.ellipsis,
                ))
          ],
        ),
      ));
}
