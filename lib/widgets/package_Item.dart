
import 'package:flutter/material.dart';

import '../utils/res.dart';
import '../utils/theme/colors.dart';
import 'divider.dart';

Widget packageItem(
    num price,
    num token,
    ){
  return Container(
      margin: EdgeInsets.all(16),
      padding: EdgeInsets.all(16),
      decoration: BoxDecoration(
          color: packageCardBackgroundColor,
          borderRadius: BorderRadius.all(Radius.circular(16)),
          border: Border.all(color: primaryColor,width: 2)
      ),
      child: Column(
      children: [
      Image.asset(Res.packageCrown, width: 60, height: 60),
  TransparentDivider(height: 8,),
  Row(
  mainAxisSize: MainAxisSize.min,
  crossAxisAlignment: CrossAxisAlignment.end,
  children: [
  Text("\$ $price",style: TextStyle(color: Colors.black,fontSize: 24,fontWeight: FontWeight.bold),),
  Text(" /$token tokens",style: TextStyle(color: Colors.black54,fontSize: 15,),),
  ],
  )
  ],
      )
  );
}