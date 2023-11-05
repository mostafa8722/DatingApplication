
import 'package:Lover369/utils/extensions.dart';
import 'package:flutter/cupertino.dart';

import '../utils/res.dart';
import '../utils/theme/texts.dart';
import '../utils/translations.dart';
import 'divider.dart';

var introPages = [
  introPageItem(Res.intro1Image, MyText.intro1Text),
  introPageItem(Res.intro2Image, MyText.intro2Text,titleTop: false),
  introPageItem(Res.intro3Image, MyText.intro3Text)
];

Widget introPageItem(String asset,String title,{bool titleTop = true}){
  Widget image = Flexible(child: Image.asset(asset,fit:BoxFit.cover));
  Widget text = Text(title,style: introTextStyle,textAlign: TextAlign.center).padding(const EdgeInsets.symmetric(horizontal: 32.0));
  List<Widget> widgets = [text,const TransparentDivider(height: 32.0),image];
  return Column(
     // mainAxisAlignment: MainAxisAlignment.spaceAround,
    children: titleTop ? widgets : widgets.reversed.toList(),
  );
}