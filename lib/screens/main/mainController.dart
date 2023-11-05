
import 'package:get/get.dart';

import '../../appControler.dart';
import '../../base/baseController.dart';

class MainController extends BaseController{
  final AppController appController = Get.find<AppController>();
  RxInt selectedIndex = 0.obs;

  @override
  void onInit() {
    appController.initializeSocket();
    super.onInit();
  }
}