import 'package:get/get.dart';

import '../../../../base/baseController.dart';

class SecurityController extends BaseController{
  Rx<bool> rememberMeController = false.obs;
  Rx<bool> faceIdController = false.obs;
  Rx<bool> bioMetricController = false.obs;
}