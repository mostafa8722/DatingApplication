import 'package:flutter/material.dart';

import '../utils/log.dart';

Widget bestPhotoItem({required String image,double width=100}){
  printLog("image");
  printLog(image);
  return AspectRatio(
    aspectRatio: 3/4,
    child:Container(
    height: 200,
    width: width,
    clipBehavior: Clip.hardEdge,
    decoration: BoxDecoration(
      borderRadius: BorderRadius.circular(16)
    ),
    child: Image.network(image,fit: BoxFit.cover),

  ));
}