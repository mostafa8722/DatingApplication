import 'package:flutter/material.dart';

import '../../../base/baseViewInterface.dart';

abstract class ActionViewInterface extends BaseViewWithAppBarInterface{
  List<Tab> tabs();
  Widget tabBarView();
}