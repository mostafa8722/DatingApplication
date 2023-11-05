
import 'package:get/get.dart';

import 'dataStorageController.dart';

class DataStorageBinding extends Bindings{
  @override
  void dependencies() {
    Get.lazyPut(() => DataStorageController());
  }

}