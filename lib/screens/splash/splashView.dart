
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';
import '../../utils/res.dart';
import '../../utils/theme/theme.dart';
import '../../utils/translations.dart';
import '../../widgets/button.dart';
import '../../widgets/introPageItem.dart';
import 'interfaces/splashViewInterface.dart';
import 'splashController.dart';


class SplashView extends GetView<SplashController> implements SplashViewInterface{
  const SplashView({super.key});

  @override
  Widget build(BuildContext context) {
    controller.initContext(context);
    return Scaffold(
      backgroundColor: Get.theme.backgroundColor,
      resizeToAvoidBottomInset: false,
      body: body(context)
    );
  }

  @override
  Widget body(BuildContext context) {
    return SafeArea(child:
        Center(
          child:
          CircleAvatar(
            radius:  MediaQuery.of(context).size.width/3, // Image radius
            backgroundImage:AssetImage((Res.logo)
            ),),
            )
        );

  }
}
