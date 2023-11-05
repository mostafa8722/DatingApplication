import 'package:flutter/material.dart';

import '../../../../base/baseViewInterface.dart';

abstract class CallViewInterface extends BaseViewInterface{
  Widget endCallView();
  Widget inCallView();
  Widget ringingView();
  Widget remoteView();
}