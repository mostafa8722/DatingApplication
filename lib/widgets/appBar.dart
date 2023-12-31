import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:easy_search_bar/easy_search_bar.dart';

import 'image.dart';

Widget homeAppBar(
    {required String profile,
    required String status,
    required String fullName,
    Function? onClickFilter,
    Function? onClickProfile}) {
  return SizedBox(
      child: Row(
    mainAxisAlignment: MainAxisAlignment.spaceBetween,
    children: [
      GestureDetector(
          onTap: () => onClickProfile,
          child: Row(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Container(child: circularImage(networkImage: profile).marginAll(4.0)),
              Column(
                // mainAxisAlignment: MainAxisAlignment.spaceBetween,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  // Text(status, style: TextStyle(fontSize: 13)),
                  Text(fullName,
                      textAlign: TextAlign.start,
                      style:
                          TextStyle(fontSize: 15, fontWeight: FontWeight.bold))
                ],
              ),
            ],
          )),
      // GestureDetector(onTap: () => onClickFilter, child: Icon(Icons.menu))
    ],
  ));
}

AppBar defaultAppBar(
    {required var title,
      required List<Widget>? actions,
      bool showLeading = true,
      double elevation = 0,
      Widget? subtitle,
      String? image,
      }) {
  return AppBar(
    title:Row(
      mainAxisAlignment: MainAxisAlignment.start,
      children: [
      // IconButton(onPressed: (){Get.back();}, icon:const Icon(Icons.arrow_back_rounded)),

        image!=null?
        ClipRRect(
          borderRadius: BorderRadius.circular(25.0),
          child: Image.network(
            image,
            height: 50.0,
            width: 50.0,
          ),
        ): SizedBox(width: 0,),
         SizedBox(width: 5,),
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            title is Rx<String> ? Obx(() => Text(title.value)):Text(title),
            subtitle ?? Container()
          ],
        )
      ],
    ),

    titleSpacing: 0,
    leading: showLeading ? IconButton(onPressed: (){Get.back();}, icon:const Icon(Icons.arrow_back_rounded)):null,
    actions: actions,
    backgroundColor: Colors.white,
    elevation: elevation,
  );
}


searchAppBar(
    {required String title,
      required Function(String) onSearch,
      bool showLeading = true,
      double elevation = 0,
      }) {
  return EasySearchBar(
    title: Text(title),
    leading: showLeading ? IconButton(onPressed: (){Get.back();}, icon:const Icon(Icons.arrow_back_rounded)):null,
    backgroundColor: Colors.white,
    elevation: elevation,
    onSearch: onSearch,
  );
}
