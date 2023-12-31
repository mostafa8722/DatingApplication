
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
            borderRadius: BorderRadius.circular(35.0)),
        child:    ClipRRect(
          borderRadius: BorderRadius.circular(35.0),
          child: Image.network(
            image.toString(),
            height: 60.0,
            width: 60.0,
          ),
        ),

      ));
}

