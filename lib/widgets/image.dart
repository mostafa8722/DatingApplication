import 'package:flutter/material.dart';

Widget circularImage({String? assetImage,String? networkImage,double size=42}){
  late Widget image;
  if(assetImage!= null){
    image = Image.asset(assetImage,fit: BoxFit.fill,height:size,width: size,);
  }
  if(networkImage!= null){
    image = Image.network(networkImage,fit: BoxFit.fill,height:size,width: size,);
  }
  return Container(
    clipBehavior: Clip.hardEdge,
    decoration: BoxDecoration(
      borderRadius: BorderRadius.circular(size),
    ),
    child: image,
  );
}

Widget image({String? assetImage,String? networkImage}){
  late Widget image;
  if(assetImage!= null){
    image = Image.asset(assetImage,fit: BoxFit.cover);
  }
  if(networkImage!= null){
    image = Image.network(networkImage,fit: BoxFit.cover);
  }
   return image;

}