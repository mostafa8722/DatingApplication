import 'package:flutter/material.dart';

Widget label({required String text,Color textColor= Colors.black,double borderRadius = 4,Color backgroundColor = Colors.transparent,Color borderColor = Colors.transparent,IconData? iconData}){
  return Container(
    clipBehavior: Clip.hardEdge,
    padding: const EdgeInsets.symmetric(vertical:6,horizontal:16),
    margin: const EdgeInsets.symmetric(horizontal: 4.0),
    decoration: BoxDecoration(
      borderRadius: BorderRadius.circular(borderRadius),
      color: backgroundColor,
      shape: BoxShape.rectangle,
      border: Border.all(width: 1,color: borderColor)
    ),
    child:Row(
      mainAxisSize: MainAxisSize.min,
      children: [
        iconData!=null ? Icon(iconData):const SizedBox(),
        Text(text,style: TextStyle(color: textColor,fontSize: 13),overflow: TextOverflow.ellipsis,)
      ],
    )
  );
}