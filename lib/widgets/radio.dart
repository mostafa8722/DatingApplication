import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../utils/theme/texts.dart';

Widget radioButton(
    {
      required String title,
      required dynamic value,
      required Rx<dynamic> controller,
      FontWeight fontWeight= FontWeight.w400
    }){
  return Row(
    mainAxisAlignment: MainAxisAlignment.spaceBetween,
    children: [
      Text(title, style: normalTextStyle(color: Colors.black,fontWeight: fontWeight,size: 15)),
      Obx(() =>
          Radio(
              value: value,
              groupValue: controller.value,
              onChanged: (value) {
                controller.value = value!;
              },
          )
      )
    ],
  );
}