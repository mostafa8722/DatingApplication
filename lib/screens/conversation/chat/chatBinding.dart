import 'package:get/get.dart';

import 'chatController.dart';


class ChatBinding extends Bindings{
  @override
  void dependencies() {
    Get.lazyPut(() => ChatController());
  }

}