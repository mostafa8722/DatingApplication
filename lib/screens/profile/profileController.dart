
import 'package:get/get.dart';

import '../../appControler.dart';
import '../../base/baseController.dart';
import '../../model/response/response.dart';
import '../../model/response/user.dart';
import '../../repositories/userRepository.dart';
import '../../utils/log.dart';
import '../../utils/route.dart';
import 'interfaces/profileControllerInterface.dart';

class ProfileController extends BaseController implements ProfileControllerInterface{
  final appController  = Get.find<AppController>();
  final UserRepository _userRepository = UserRepository();
  Rx<bool> loading = false.obs;
  RxBool showInternetConnection = false.obs;
  @override
  void updateProfile(String imagePath) {
    loading.value = true;
    _userRepository.updateProfile(
        profileImage: imagePath,
        success: (data) {
          loading.value = false;
          printLog(data);
          var responseModel = responseFromJson(data.toString());
          var userModel = User.fromJson(responseModel.data);
          _userRepository.saveInformation(user: userModel);
          Get.back();
        },
        failure: (error) {
          loading.value = false;
          printLog(error.response);
        });
  }

  @override
  void gotoHelpCenter() {
    Get.toNamed(MyRoute.helpCenterRoute);
  }

  @override
  void gotoInviteFriend() {
    Get.toNamed(MyRoute.invitationRoute);
  }

  @override
  void gotoPackages() {
    Get.toNamed(MyRoute.packagesRoute);
  }

  @override
  void gotoSetting() {
   Get.toNamed(MyRoute.settingRoute);
  }

  @override
  void logout() {
    _userRepository.saveToken(token: null);
    Get.offAllNamed(MyRoute.splashRoute);
  }
  void onClickPersonalInformation() {
    Get.toNamed(MyRoute.settingPersonal);
  }
  void onClickDiscoverySetting() {
    Get.toNamed(MyRoute.settingDiscover);
  }
  void onClickSecurity() {
    Get.toNamed(MyRoute.settingSecurity);
  }
}