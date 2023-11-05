import 'package:flutter/material.dart';

import '../../../base/baseViewInterface.dart';

abstract class ConversationViewInterface extends BaseViewWithAppBarInterface{
  Widget onlineUser();
  Widget conversations();
}