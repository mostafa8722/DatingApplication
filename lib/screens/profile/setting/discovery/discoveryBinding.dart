
import 'package:get/get.dart';

import 'discoveryController.dart';

class DiscoveryBinding extends Bindings{
  @override
  void dependencies() {
    Get.lazyPut(() => DiscoveryController());
  }

}