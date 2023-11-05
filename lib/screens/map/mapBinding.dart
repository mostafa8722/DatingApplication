import 'package:get/get.dart';

import 'mapController.dart';

class MapBinding extends Bindings{
  @override
  void dependencies() {
    Get.lazyPut(() => MapController());
  }

}