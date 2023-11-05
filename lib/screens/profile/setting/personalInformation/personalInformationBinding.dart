import 'package:get/get.dart';

import 'personalInformationController.dart';

class PersonalInformationBinding extends Bindings{
  @override
  void dependencies() {
    Get.lazyPut(() => PersonalInformationController());
  }

}