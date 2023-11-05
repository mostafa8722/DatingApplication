import 'package:get/get.dart';

import 'securityController.dart';

class SecurityBinding extends Bindings{
  @override
  void dependencies() {
    Get.lazyPut(() => SecurityController());
  }

}