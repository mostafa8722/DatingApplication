import 'package:get/get.dart';

import 'actionController.dart';

class ActionBinding extends Bindings{
  @override
  void dependencies() {
    Get.lazyPut(() => ActionController());
  }

}