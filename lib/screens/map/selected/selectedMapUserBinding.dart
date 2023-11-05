import 'package:get/get.dart';

import 'selectedMapUserController.dart';

class SelectedMapUserBinding extends Bindings{
  @override
  void dependencies() {
    Get.lazyPut(() => SelectedMapUserController());
  }

}