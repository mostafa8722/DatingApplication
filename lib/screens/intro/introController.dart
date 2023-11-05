
import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';

import '../../base/baseController.dart';
import '../../utils/route.dart';
import '../../widgets/introPageItem.dart';
import 'interfaces/introControllerImpl.dart';


class IntroController extends BaseController implements IntroControllerImpl{
  late PageController pagerController;

  @override
  void onInit() {
    pagerController = PageController();
    super.onInit();
  }

  @override
  void dispose() {
    pagerController.dispose();
    super.dispose();
  }

  @override
  void gotoNextPage() {
    if(pagerController.page!.toInt() < introPages.length-1) {
      pagerController.animateToPage(pagerController.page!.toInt() + 1,
          duration:const Duration(milliseconds: 300), curve: Curves.ease);
    }else{
      saveSeenIntro();
      gotoAuth();
    }
  }

  @override
  void gotoAuth() {
    Get.offAndToNamed(MyRoute.signinSocialRoute);
  }

  @override
  void saveSeenIntro() {
    appStorage.saveData(appStorage.seenIntroKey,true);
  }

}