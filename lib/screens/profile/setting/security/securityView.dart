
import 'package:Lover369/screens/profile/setting/security/interfaces/securityViewInterface.dart';
import 'package:Lover369/utils/translations.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:get/get.dart';

import '../../../../widgets/appBar.dart';
import '../../../../widgets/button.dart';
import '../../../../widgets/divider.dart';
import '../../../../widgets/menuItem.dart';
import '../../../../widgets/switch.dart';
import 'securityController.dart';

class SecurityView extends GetView<SecurityController>
    implements SecurityViewInterface {
  const SecurityView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: appBar(),
      body: body(context),
    );
  }

  @override
  appBar() {
    return  defaultAppBar(title: MyText.security, showLeading: true, actions: null);
  }

  @override
  Widget body(BuildContext context) {
    List<Widget> items = [
      Obx(() => cupertinoSwitch(
          title: MyText.rememberMe.value, controller: controller.rememberMeController)),
    Obx(() =>cupertinoSwitch(
          title: MyText.faceid.value, controller: controller.faceIdController)),
    Obx(() =>cupertinoSwitch(
          title: MyText.biometric.value, controller: controller.bioMetricController)),
    Obx(() =>simpleMenuItem(title: MyText.googleAuthenticator.value).marginSymmetric(vertical: 8)),
    Obx(() =>simpleMenuItem(title: MyText.blockedList.value).marginSymmetric(vertical: 8)),
      const TransparentDivider(height: 16),
    Obx(() =>button(MyText.changePin.value, () {})),
    Obx(() =>button(MyText.changePassword.value, () {})),
    ];
    return ListView.separated(
        itemBuilder: (context, index) {
          return items[index].paddingSymmetric(horizontal: 18, vertical: 4);
        },
        separatorBuilder: (context, index) {
          return const TransparentDivider(
            height: 8,
          );
        },
        itemCount: items.length);
  }

  @override
  Widget button(String text, Function onPressed) {
    return BlueButton(text: text, onPressed: ()=>onPressed);
  }
}
