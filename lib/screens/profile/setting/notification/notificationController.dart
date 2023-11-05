import 'package:get/get.dart';

import '../../../../base/baseController.dart';

class NotificationController extends BaseController{
  Rx<bool> showPreviewsController = false.obs;
  Rx<bool> newMessagesController = false.obs;
  Rx<bool> newMatchController = false.obs;
  Rx<bool> matchAroundMeController = false.obs;
  Rx<bool> gotLikesController = false.obs;
  Rx<bool> gotStarController = false.obs;
  Rx<bool> subscriptionController = false.obs;
  Rx<bool> soundController = false.obs;
  Rx<bool> vibrateController = false.obs;
  Rx<bool> updateController = false.obs;
  Rx<bool> vipStatusController = false.obs;
  Rx<bool> servicesController = false.obs;
}