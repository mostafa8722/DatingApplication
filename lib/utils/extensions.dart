import 'package:flutter/cupertino.dart';

extension ExtendWidget on Widget{
  Widget padding(EdgeInsets padding){
    return Padding(padding: padding,child: this);
  }
}