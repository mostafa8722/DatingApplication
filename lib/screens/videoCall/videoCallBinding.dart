import 'package:get/get.dart';

import 'VideoCallController.dart';

class VideoCallBinding extends Bindings{
  @override
  void dependencies() {
    Get.lazyPut(() => VideoCallController());
  }
}