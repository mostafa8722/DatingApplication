import 'package:get/get.dart';

import 'privacyPermissionController.dart';

class PrivacyPermissionBinding extends Bindings{
  @override
  void dependencies() {
    Get.lazyPut(() => PrivacyPermissionController());
  }

}