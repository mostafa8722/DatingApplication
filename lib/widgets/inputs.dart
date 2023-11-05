
import 'package:flutter/material.dart';
import 'package:intl_phone_field/intl_phone_field.dart';
import 'package:intl_phone_field/phone_number.dart';

import '../utils/theme/colors.dart';
import '../utils/theme/texts.dart';

Widget inputBox(BuildContext context, TextEditingController controller,
    {EdgeInsetsGeometry? padding,
    Color backgroundColor = textInputBackgroundColor,
    Color textColor = textInputColor,
    String hint = "",
    IconData? icon,
    IconData? suffixIcon,
    double iconSize = 24,
    bool isPassword = false,
    bool hasError = false,
    String errorMessage = "Invalid Input",
    Function? onClick}) {
  return Column(
    mainAxisSize: MainAxisSize.min,
    children: [
      GestureDetector(
          onTap: onClick!= null ? ()=>{onClick()}:null,
          child: Padding(
              padding: padding ?? const EdgeInsets.all(0),
              child: SizedBox(
                  width: double.maxFinite,
                  child: Card(
                    elevation: 0,
                    clipBehavior: Clip.hardEdge,
                    color: backgroundColor,
                    shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(15.0)),
                    child: Container(
                      padding: EdgeInsets.symmetric(vertical: 2.0, horizontal: 8.0),
                      child: TextFormField(
                        textAlignVertical: TextAlignVertical.center,
                        controller: controller,
                        selectionControls: MaterialTextSelectionControls(),
                        enabled: onClick == null,
                        style: normalTextStyle(),
                        cursorColor: textColor,
                        obscureText: isPassword,
                        decoration: InputDecoration(
                            iconColor: Colors.black,
                            alignLabelWithHint: true,
                            border: InputBorder.none,
                            hintStyle: TextStyle(color: Colors.grey),
                            hintText: hint,
                            suffixIcon: suffixIcon != null
                                ? IconTheme(
                                data: const IconThemeData(color: Colors.black87),
                                child: Icon(
                                  suffixIcon,
                                  size: iconSize,
                                ))
                                : null,
                            prefixIcon: icon != null
                                ? IconTheme(
                              data: const IconThemeData(color: Colors.grey),
                              child: Icon(
                                icon,
                                size: iconSize,
                              ),
                            )
                                : null),
                      ),
                    ),
                  )))),
      hasError ? Container(
        width: double.infinity,
          padding: EdgeInsets.only(left: 12),
          child: Text(errorMessage,style:const TextStyle(fontSize: 12,color: Colors.red),textAlign: TextAlign.start,)):const SizedBox(height:0,width:0)
    ],
  );
}

Widget inputPhoneBox(BuildContext context, TextEditingController controller,void Function(PhoneNumber) onPhoneChanged,
    {EdgeInsetsGeometry? padding,
    Color backgroundColor = textInputBackgroundColor,
    Color textColor = textInputColor,
    String hint = "",
    String initializeCode = "1",
    }) {
  return Padding(
      padding: padding ?? const EdgeInsets.all(0),
      child: SizedBox(
          width: double.maxFinite,
          child: Card(
            elevation: 0,
            clipBehavior: Clip.hardEdge,
            color: backgroundColor,
            shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(15.0)),
            child: Container(
              padding: EdgeInsets.symmetric(vertical: 2.0, horizontal: 8.0),
              child: IntlPhoneField(
                textAlignVertical: TextAlignVertical.center,
                controller: controller,
                style: normalTextStyle(),
                autofocus: false,
                cursorColor: textColor,
                decoration: InputDecoration(
                    iconColor: Colors.black,
                    alignLabelWithHint: true,
                    border: InputBorder.none,
                    hintStyle: TextStyle(color: Colors.grey),
                    hintText: hint),
                // initialCountryCode: '98',
                initialValue: "+$initializeCode",
                disableLengthCheck: true,
                showDropdownIcon: false,
                onChanged: onPhoneChanged,
              ),
            ),
          )));
}



