import 'package:flutter/material.dart';

abstract class BaseViewWithAppBarInterface extends BaseViewInterface{
  appBar();
}

abstract class BaseViewInterface{
  Widget body(BuildContext context);
}

