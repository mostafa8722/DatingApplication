import 'package:flutter/material.dart';

import '../../../../../base/baseViewInterface.dart';

abstract class SecurityViewInterface extends BaseViewWithAppBarInterface{
  Widget button(String text,Function onPressed);
}