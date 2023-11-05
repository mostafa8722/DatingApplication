import 'package:flutter/material.dart';

Widget circularBackground({Color color=Colors.black,double size=40}){
  return Container(
    width: size,
    height: size,
    decoration: BoxDecoration(
      color: color,
      borderRadius: BorderRadius.circular(size)
    ),
  );
}