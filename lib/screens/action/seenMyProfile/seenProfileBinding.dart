
import 'package:Lover369/screens/action/seenMyProfile/seenProfileController.dart';
import 'package:get/get.dart';

class SeenProfileBinding extends Bindings{
  @override
  void dependencies() {
    Get.lazyPut(() => SeenProfileController());
  }

}