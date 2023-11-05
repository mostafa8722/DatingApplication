import 'package:get/get.dart';

import 'blocksController.dart';

class BlocksBinding extends Bindings{
  @override
  void dependencies() {
    Get.lazyPut(() => BlocksController());
  }

}