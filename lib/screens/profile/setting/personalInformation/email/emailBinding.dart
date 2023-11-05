
import 'package:get/get.dart';

import 'emailController.dart';

class EmailBinding extends Bindings{
  @override
  void dependencies() {
    Get.lazyPut(() => EmailController());
  }

}