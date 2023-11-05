import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:sizer/sizer.dart';

import 'colors.dart';

var appbarTextStyle = TextStyle(
    color: appbarTitleColor, fontSize: 14, fontWeight: FontWeight.bold);

var bigTitleStyle = Get.testMode
    ? _bigTitleStylePhone
    : SizerUtil.deviceType == DeviceType.tablet
        ? _bigTitleStyleTablet
        : _bigTitleStylePhone;

var normalTextStyle = Get.testMode
    ? _normalTextStylePhone
    : SizerUtil.deviceType == DeviceType.tablet
        ? _normalTextStyleTablet
        : _normalTextStylePhone;

var normalButtonTextStyle = Get.testMode
    ? _normalButtonStylePhone
    : SizerUtil.deviceType == DeviceType.tablet
        ? _normalButtonStyleTablet
        : _normalButtonStylePhone;

var _bigTitleStyleTablet = (
        {Color color = Colors.black,
        FontWeight fontWeight = FontWeight.bold,
        double size = 28}) =>
    TextStyle(color: color, fontSize: size, fontWeight: fontWeight,fontFamily: 'Urbanist');

var _bigTitleStylePhone = (
        {Color color = Colors.black,
        FontWeight fontWeight = FontWeight.bold,
        double size = 22}) =>
    TextStyle(color: color, fontSize: size, fontWeight: fontWeight,fontFamily: 'Urbanist');

var _normalTextStyleTablet = (
        {Color color = Colors.black87,
        FontWeight fontWeight = FontWeight.normal,
        double size = 16}) =>
    TextStyle(color: color, fontSize: size, fontWeight: fontWeight,fontFamily: 'Urbanist');

var _normalTextStylePhone = (
        {Color color = Colors.black87,
        FontWeight fontWeight = FontWeight.normal,
        double size = 13}) =>
    TextStyle(color: color, fontSize: size, fontWeight: fontWeight,fontFamily: 'Urbanist');

var _normalButtonStyleTablet = (
        {Color color = Colors.black87,
        FontWeight fontWeight = FontWeight.bold,
        double size = 16}) =>
    TextStyle(color: color, fontSize: size, fontWeight: fontWeight,fontFamily: 'Urbanist');

var _normalButtonStylePhone = (
        {Color color = Colors.black87,
        FontWeight fontWeight = FontWeight.bold,
        double size = 13}) =>
    TextStyle(color: color, fontSize: size, fontWeight: fontWeight,fontFamily: 'Urbanist');

var introTextStyle =const TextStyle(color: Colors.black87, fontSize: 32.0, fontWeight: FontWeight.bold,fontFamily: 'Urbanist');

var homeSliderUserNameTextStyle =const TextStyle(color: Colors.black, fontSize: 24.0, fontWeight: FontWeight.bold,fontFamily: 'Urbanist');
var homeSliderUserStateTextStyle =const TextStyle(color: Colors.black, fontSize: 14.0, fontWeight: FontWeight.normal,fontFamily: 'Urbanist');
var homeSliderUserDistanceTextStyle =const TextStyle(color: Colors.black, fontSize: 13.0, fontWeight: FontWeight.normal,fontFamily: 'Urbanist');
var homeSliderCoverUserNameTextStyle =const TextStyle(color: Colors.white, fontSize: 24.0, fontWeight: FontWeight.bold,fontFamily: 'Urbanist');
var homeSliderCoverUserStateTextStyle =const TextStyle(color: Colors.white, fontSize: 14.0, fontWeight: FontWeight.normal,fontFamily: 'Urbanist');

const tabBarTextStyle = TextStyle(
    color: appbarTitleColor,
    fontSize: 14,
    fontFamily: 'Urbanist',
    fontWeight: FontWeight.bold);
