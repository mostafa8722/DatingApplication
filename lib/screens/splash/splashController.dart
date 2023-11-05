import 'dart:async';


import 'package:get/get.dart';

import '../../base/baseController.dart';
import '../../model/response/token.dart';
import '../../repositories/userRepository.dart';
import '../../utils/log.dart';
import '../../utils/route.dart';
import 'interfaces/splashControllerInterface.dart';

class SplashController extends BaseController
    implements SplashControllerInterface {
  final UserRepository _userRepository = UserRepository();
  @override
  void onInit() async {
    super.onInit();
    checkState();
  }

  @override
  void checkState() async {
    var isSeenIntro =
        (await appStorage.getData(appStorage.seenIntroKey)) as bool?;
    printLog("seen intro: $isSeenIntro");
    Future.delayed(const Duration(seconds: 2), () async {
      Token? token = await _userRepository.getToken() as Token?;
      if(token != null){
        gotoMain();
      }
      else
        if (isSeenIntro != null && isSeenIntro) {
        gotoAuth();
      } else {
        gotoIntro();
      }
    });
  }

  @override
  void gotoAuth() {
    Get.offAndToNamed(MyRoute.signinSocialRoute);
  }

  @override
  void gotoIntro() {
    Get.offAndToNamed(MyRoute.introRoute);
  }

  @override
  void gotoMain() {
    Get.offAndToNamed(MyRoute.mainRoute);
  }
}
