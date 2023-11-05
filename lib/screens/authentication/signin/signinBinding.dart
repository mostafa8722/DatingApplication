import 'package:get/get.dart';

import 'signinController.dart';

class SignInBinding extends Bindings{
  @override
  void dependencies() {
    Get.lazyPut(() => SignInController());
  }
}