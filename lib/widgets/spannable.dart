import 'package:flutter/cupertino.dart';

import '../utils/theme/colors.dart';
import '../utils/theme/texts.dart';

Widget spannableText(String text,String spanText,Function() onPressed){
  return GestureDetector(
    onTap:()=> onPressed(),
    child: Text.rich(
      TextSpan(text: text, children: <InlineSpan>[
        TextSpan(
          text: spanText,
          style:const TextStyle(fontSize: 15, color: primaryColor),
        )
      ],style: normalTextStyle())));
}