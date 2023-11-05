import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../utils/theme/texts.dart';

class TransparentDivider extends StatelessWidget{
  const TransparentDivider({
    super.key,
  this.height}
      );
  final double? height;

  @override
  Widget build(BuildContext context) {
    return Divider(height: height,color: Colors.transparent);
  }
}

class VerticalTransparentDivider extends StatelessWidget{
  const VerticalTransparentDivider({
    super.key,
    this.width}
      );
  final double? width;

  @override
  Widget build(BuildContext context) {
    return VerticalDivider(width: width,color: Colors.transparent);
  }
}



class TextDivider extends StatelessWidget{
  TextDivider({super.key,required this.text});

  String text;

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisSize: MainAxisSize.max,
      mainAxisAlignment: MainAxisAlignment.center,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        Expanded(
            child: Container(
                color: Colors.black12,
                height: 1,
                margin: const EdgeInsets.symmetric(horizontal: 4))),
        Text(text,style: normalTextStyle(fontWeight: FontWeight.w500,size: 14),),
        Expanded(
            child: Container(
              color: Colors.black12,
              height: 1,
              margin: const EdgeInsets.symmetric(horizontal: 4),
            ))
      ],
    );
  }

}