
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../utils/theme/colors.dart';
import '../utils/theme/texts.dart';

class MyCheckBox extends StatelessWidget{
  MyCheckBox({
    super.key,
   this.title,
    required this.changeController
  });

  final String? title;
  RxBool changeController = false.obs;
  void onChanged(bool? state) {
    changeController.value = state ?? false;
 }

 Widget titleWidget(){
    return Text(
      title.toString(),
      style: normalTextStyle(),
    );
 }

  @override
  Widget build(BuildContext context) {
    return Obx(() => Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Checkbox(
            value: changeController.value,
            onChanged: onChanged,
            activeColor: primaryColor,
          fillColor: MaterialStateProperty.all<Color>(primaryColor),
          shape:
          RoundedRectangleBorder(borderRadius: BorderRadius.circular(5)),
        ),
        titleWidget()
      ],
      ));
  }
}