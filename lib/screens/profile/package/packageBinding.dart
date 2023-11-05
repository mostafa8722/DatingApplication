
import 'package:get/get.dart';

import 'packageController.dart';

class PackageBinding extends Bindings{
  @override
  void dependencies() {
   Get.lazyPut(() => PackageController());
  }

}