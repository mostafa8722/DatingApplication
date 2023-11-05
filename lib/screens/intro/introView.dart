
import 'package:Lover369/utils/extensions.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';
import '../../utils/theme/theme.dart';
import '../../utils/translations.dart';
import '../../widgets/button.dart';
import '../../widgets/divider.dart';
import '../../widgets/introPageItem.dart';
import 'interfaces/introViewImpl.dart';
import 'introController.dart';


class IntroView extends GetView<IntroController> implements IntroViewImpl{
  IntroView({super.key});

  @override
  Widget build(BuildContext context) {
    controller.initContext(context);
    return Scaffold(
      backgroundColor: Get.theme.backgroundColor,
      resizeToAvoidBottomInset: false,
      body: Column(
        children: [
          const TransparentDivider(height: 32.0),
          Flexible(child: pager()),
          const TransparentDivider(height: 32.0),
          indicators(),
          const TransparentDivider(height: 32.0),
          nextButton()
        ],
      ).padding(const EdgeInsets.symmetric(vertical: 32,horizontal: 16))
    );
  }

  @override
  Widget indicators() {
    return SmoothPageIndicator(
        controller: controller.pagerController,  // PageController
        count:  3,
        effect: indicatorEffect,  // your preferred effect
        onDotClicked: (index){}
    );
  }

  @override
  Widget nextButton() {
    return Button(
      onPressed: ()=>controller.gotoNextPage(),
      text: MyText.next,
    );
  }

  @override
  Widget pager() {
    return PageView(
      controller: controller.pagerController,
      children: introPages,
    );
  }
}
