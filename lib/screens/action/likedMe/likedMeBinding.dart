import 'package:get/get.dart';

import 'likedMeController.dart';

class LikedMeBinding extends Bindings{
  @override
  void dependencies() {
    Get.lazyPut(() => LikedMeController());
  }

}