
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../utils/res.dart';
import '../utils/theme/colors.dart';
import '../utils/theme/theme.dart';

Widget onlineUserItem({
  String? name,
  String? image,
  Function? itemClicked,
}) {
  return GestureDetector(
      onTap: () {
        itemClicked!();
      },
      child: Container(
        padding: const EdgeInsets.all(4),
        margin: const EdgeInsets.symmetric(horizontal: 4, vertical: 4),
        width: 70,
        height: 70,
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
          ],
        ),
      ));
}

