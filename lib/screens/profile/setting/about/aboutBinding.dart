import 'package:get/get.dart';

import 'aboutController.dart';

class AboutBinding extends Bindings{
  @override
  void dependencies() {
    Get.lazyPut(() => AboutController());
  }

}