
import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';

import '../utils/theme/colors.dart';
import 'divider.dart';

Widget titleWidget({required String title,Widget? widget,double horizontalMargin = 0,bool seeAll=false}){
  return Column(
    crossAxisAlignment: CrossAxisAlignment.start,
    children: [
      Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
        Text(title,style: const TextStyle(fontSize: 16.0,fontWeight: FontWeight.bold),),
        seeAll ? const Text("See All",style: TextStyle(fontSize: 14.0,fontWeight: FontWeight.bold,color: primaryColor),):const SizedBox(),
        ],
      ).marginSymmetric(horizontal:horizontalMargin ),
      const TransparentDivider(height: 4),
      widget ?? const SizedBox(width: 0,height: 0,)
    ],
  );
}