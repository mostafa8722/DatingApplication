
import 'package:get/get.dart';

import '../../appControler.dart';
import '../../base/baseController.dart';

class MainController extends BaseController{
   AppController appController = Get.find<AppController>();
  RxInt selectedIndex = 0.obs;

  @override
  void onInit() {
    //appController.onInit();
    appController.initializeSocket();
    super.onInit();
  }
   void retryConnection(){
     appController.initData();
   }
}