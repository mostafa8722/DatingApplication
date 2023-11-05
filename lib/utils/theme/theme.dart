import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';

import 'colors.dart';

var lightTheme = ThemeData(
    primaryColor: primaryColor,
    primarySwatch: primarySwatch,
    primaryColorDark: primarySwatch,
    scaffoldBackgroundColor:  Colors.white,
    backgroundColor: Colors.white,
    fontFamily: 'Urbanist',
    appBarTheme: appBarLightTheme);

var darkTheme = ThemeData(
    primaryColor: Colors.black,
    primarySwatch: Colors.grey,
    brightness: Brightness.dark,
    backgroundColor: const Color(0xFF212121),
    scaffoldBackgroundColor:  const Color(0xFF212121),
    appBarTheme: appBarLightTheme,
    // accentColor: Colors.white,
    // accentIconTheme: IconThemeData(color: Colors.black),
    dividerColor: Colors.black12,
    textTheme: const TextTheme(bodyText1: TextStyle(color: Colors.white)),
    primaryColorDark: Colors.blue);

const indicatorEffect = ExpandingDotsEffect(
    dotWidth: 8,
    dotHeight: 8,
    dotColor: Colors.black12,
    activeDotColor: primaryColor);

const homeSliderRounded = 32.0;
const actionRounded = 8.0;

const appBarLightTheme = AppBarTheme(
    backgroundColor: Colors.transparent,
    elevation: 0,
    titleTextStyle: TextStyle(fontWeight: FontWeight.bold,color: Colors.black,fontSize: 18.0,fontFamily: 'Urbanist'),
    systemOverlayStyle: SystemUiOverlayStyle(
        statusBarColor: Colors.white,
        statusBarIconBrightness: Brightness.dark));
