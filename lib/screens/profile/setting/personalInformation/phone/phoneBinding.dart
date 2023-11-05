
import 'package:get/get.dart';

import 'phoneController.dart';

class PhoneBinding extends Bindings{
  @override
  void dependencies() {
    Get.lazyPut(() => PhoneController());
  }

}