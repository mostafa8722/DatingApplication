import 'package:flutter/material.dart';

abstract class ProfileViewInterface{
  Widget body();
  AppBar appbar();
  Widget image();
  Widget packageCard();
  Widget menus();
}