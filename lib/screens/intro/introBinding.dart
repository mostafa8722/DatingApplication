import 'package:get/get.dart';

import 'introController.dart';

class IntroBinding extends Bindings{
  @override
  void dependencies() {
    Get.lazyPut(() => IntroController());
  }
}