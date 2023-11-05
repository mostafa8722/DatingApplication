
import 'package:flutter/material.dart';

import '../../../../base/baseViewInterface.dart';
import '../../../../model/view/settingModel.dart';

abstract class SettingViewInterface extends BaseViewWithAppBarInterface{
  Widget list();
  List<SettingModel> settingItems();
}