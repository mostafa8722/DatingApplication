
import 'package:get/get.dart';

import '../../../base/baseController.dart';
import '../../../utils/route.dart';
import 'interfaces/settingControllerInterface.dart';

class SettingController extends BaseController implements SettingControllerInterface{
  @override
  void onClickAbout() {
    Get.toNamed(MyRoute.settingAbout);
  }

  @override
  void onClickDataStorage() {
    Get.toNamed(MyRoute.settingStorage);
  }

  @override
  void onClickDiscoverySetting() {
    Get.toNamed(MyRoute.settingDiscover);
  }

  @override
  void onClickFeedback() {
    Get.toNamed(MyRoute.settingFeedback);
  }

  @override
  void onClickLanguage() {
    Get.toNamed(MyRoute.settingLanguage);
  }

  @override
  void onClickNotification() {
    Get.toNamed(MyRoute.settingNotification);
  }

  @override
  void onClickPersonalInformation() {
    Get.toNamed(MyRoute.settingPersonal);
  }

  @override
  void onClickPrivacyInformation() {
    Get.toNamed(MyRoute.settingPrivacy);
  }

  @override
  void onClickSecurity() {
    Get.toNamed(MyRoute.settingSecurity);
  }

}