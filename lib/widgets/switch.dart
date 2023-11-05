
import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';

import '../utils/theme/colors.dart';
import '../utils/theme/texts.dart';

Widget cupertinoSwitch(
{
  required String title,
  required Rx<bool> controller,
  FontWeight fontWeight= FontWeight.w400
}){
  return Row(
    mainAxisAlignment: MainAxisAlignment.spaceBetween,
    children: [
      Text(title, style: normalTextStyle(color: CupertinoColors.black,fontWeight: fontWeight,size: 15)),
      Obx(() => CupertinoSwitch(
        activeColor: primaryColor,
        value: controller.value,
        onChanged: (value) {
        controller.value = value;
      }))
    ],
  );
}