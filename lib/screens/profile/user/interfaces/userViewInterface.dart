import 'package:flutter/material.dart';

import '../../../../base/baseViewInterface.dart';

abstract class UserViewInterface extends BaseViewWithAppBarInterface{
  Widget info(BuildContext context);
  Widget photoSliderIndicator();
  Widget userTitle();
  Widget bestPhotos();
  Widget about();
  Widget interest();
  circularMenu();
}