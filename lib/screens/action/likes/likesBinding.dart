import 'package:get/get.dart';

import 'likesController.dart';

class LikesBinding extends Bindings{
  @override
  void dependencies() {
    Get.lazyPut(() => LikesController());
  }

}