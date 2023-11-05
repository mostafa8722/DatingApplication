import 'package:get/get.dart';

import 'callController.dart';


class CallBinding extends Bindings{
  @override
  void dependencies() {
    Get.lazyPut(() => CallController());
  }

}