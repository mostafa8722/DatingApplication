
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../utils/theme/texts.dart';
import 'backgrounds.dart';
import 'divider.dart';

Widget profileMenuItem({required String title,required IconData icon,required Function() onClick,Color iconColor = Colors.black,Color titleColor = Colors.black,bool showForwardIcon = true}){
  return GestureDetector(
    behavior: HitTestBehavior.opaque,
    onTap: onClick,
      child: Row(
    crossAxisAlignment: CrossAxisAlignment.center,
    children: [
      Icon(icon,color: iconColor,),
      const VerticalTransparentDivider(width: 12),
      Text(title,style: normalTextStyle(color: titleColor,fontWeight: FontWeight.w400,size: 15)),
      const Spacer(),
      showForwardIcon ? const Icon(Icons.chevron_right_sharp):const SizedBox(width: 0,height: 0)
    ],
  ).marginSymmetric(vertical: 12));
}

Widget settingMenuItem({required String title,required IconData icon,Function? onClick,Color iconColor = Colors.white,Color backgroundColor = Colors.black,Color titleColor = Colors.black,bool showForwardIcon = true,String? label}){
  return GestureDetector(
      behavior: HitTestBehavior.opaque,
      onTap: ()=>onClick!= null ? onClick():null,
  child:Row(
    crossAxisAlignment: CrossAxisAlignment.center,
    children: [
      Stack(
        children: [
          circularBackground(color: backgroundColor,size: 44),
          Positioned(
            left: 0,right: 0,top: 0,bottom: 0,
              child: Icon(icon,color: iconColor)),
        ],
      ),
      const VerticalTransparentDivider(width: 12),
      Text(title,style: normalTextStyle(color: titleColor,fontWeight: FontWeight.w400,size: 15)),
      const Spacer(),
      label != null ? Text(label,style: normalTextStyle(color: titleColor,fontWeight: FontWeight.w400,size: 15)):const SizedBox(),
      const VerticalTransparentDivider(width: 4),
      showForwardIcon ? const Icon(Icons.chevron_right_sharp):const SizedBox(width: 0,height: 0)
    ],
  ).marginSymmetric(vertical: 6,horizontal: 16));
}

Widget simpleMenuItem({required String title,Function? onClick,Color iconColor = Colors.white,Color backgroundColor = Colors.black,Color titleColor = Colors.black,bool showForwardIcon = true,String? label,FontWeight fontWeight= FontWeight.w400,}){
  return GestureDetector(
      behavior: HitTestBehavior.opaque,
      onTap: ()=>onClick!= null ? onClick():null,
      child:Row(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Text(title,style: normalTextStyle(color: titleColor,fontWeight: fontWeight,size: 15)),
          const Spacer(),
          label != null ? Text(label,style: normalTextStyle(color: titleColor,fontWeight: fontWeight,size: 15)):const SizedBox(),
          const VerticalTransparentDivider(width: 4),
          showForwardIcon ? const Icon(Icons.chevron_right_sharp):const SizedBox(width: 0,height: 0)
        ],
      ));
}