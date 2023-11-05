import 'package:flutter/material.dart';

import '../../../../base/baseViewInterface.dart';

abstract class PackageViewInterface extends BaseViewWithAppBarInterface{
  Widget title();
  Widget description();
  Widget packages();
}