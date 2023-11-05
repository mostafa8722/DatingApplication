
import 'package:get/get.dart';

import 'feedbackController.dart';

class FeedbackBinding extends Bindings{
  @override
  void dependencies() {
    Get.lazyPut(() => FeedbackController());
  }

}