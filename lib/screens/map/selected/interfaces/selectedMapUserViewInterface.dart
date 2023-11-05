import 'package:flutter/material.dart';

import '../../../../base/baseViewInterface.dart';

abstract class SelectedMapUserViewInterface extends BaseViewWithAppBarInterface{
  Widget userCard();
  Widget backButton();
}