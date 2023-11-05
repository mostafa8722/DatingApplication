
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../utils/theme/colors.dart';
import '../utils/theme/texts.dart';

Widget dropdown(
    List<DropdownMenuItem<String>> items,
    void Function(String?) onChanged,
    String? initializeValue,
    {EdgeInsetsGeometry? padding,
      Color backgroundColor = textInputBackgroundColor,
      Color textColor = textInputColor,
      String hint = "",
      double leftPadding = 24
    }) {
  var selectedValue = initializeValue.obs;
  return Obx(() => Padding(
      padding: padding ?? const EdgeInsets.all(0),
      child: SizedBox(
          width: double.maxFinite,
          child: Card(
              elevation: 0,
              clipBehavior: Clip.hardEdge,
              color: backgroundColor,
              shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(15.0)),
              child: Container(
                  padding:EdgeInsets.fromLTRB(leftPadding, 2, 8, 2),
                  child: DropdownButton(
                      icon:const Padding(padding: EdgeInsets.only(right: 8),child: Icon(Icons.arrow_drop_down,color: Colors.black,),),
                      style: normalTextStyle(),
                      underline: const SizedBox(),
                      iconSize: 34,
                      isExpanded: true,
                      value: selectedValue.value ,
                      onChanged: (String? value) {
                        selectedValue.value = value;
                        onChanged(value);
                      },
                      items: items
                  ))
          )
      )));
}
