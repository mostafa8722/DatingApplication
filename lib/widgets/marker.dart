import 'dart:typed_data';

import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:widgets_to_image/widgets_to_image.dart';

Widget buildImage(Uint8List bytes) => Image.memory(bytes);

WidgetsToImage markerWidget(String text,String image, WidgetsToImageController controller) {
  return WidgetsToImage(
      controller: controller,
      child: SizedBox(
          width: 30,
          height: 30,
          child: Stack(
            children: [
              Container(
                alignment: Alignment.center,
                  width: 30,
                  height: 30,
                  decoration: const BoxDecoration(
                      color: Color(0x3020DAE7), shape: BoxShape.circle),
                child: Container(
                  width: 15,
                  height: 15,
                  decoration: const BoxDecoration(
                      color: Color(0x5020DAE7),
                      shape: BoxShape.circle
                  ),
                ),
              ),
              Positioned(
                  left: 0,
                  right: 0,
                  top: 0,
                  bottom: 0,
                  child: Container(
                    width: 8,
                    height: 8,
                    clipBehavior: Clip.hardEdge,
                    decoration:  BoxDecoration(
                          borderRadius: BorderRadius.circular(50.0),

                    ),
                    child: Image.network(
                      image,
                      width: 8,
                      height: 8,
                      cacheWidth: 8,
                      cacheHeight: 8,
                    ),
                  )),
            ],
          )));
}
