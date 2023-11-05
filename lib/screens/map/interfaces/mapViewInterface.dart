import 'package:flutter/material.dart';

import '../../../base/baseViewInterface.dart';

abstract class MapViewInterface extends BaseViewInterface{
  Widget map();
  Widget marker();
  Widget locationCard();
}