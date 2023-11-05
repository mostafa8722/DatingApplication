import 'package:get/get.dart';

import 'conversationController.dart';

class ConversationBinding extends Bindings{
  @override
  void dependencies() {
    Get.lazyPut(() => ConversationController());
  }

}