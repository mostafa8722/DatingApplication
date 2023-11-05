import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:get/get.dart';

import '../../../../widgets/appBar.dart';
import '../../../../widgets/divider.dart';
import '../../../../widgets/radio.dart';
import 'interfaces/languageViewInterface.dart';
import 'languageController.dart';

class LanguageView extends GetView<LanguageController> implements LanguageViewInterface{
  const LanguageView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: appBar(),
      body: body(context),
    );
  }

  @override
  appBar() {
    return defaultAppBar(title: "Language", showLeading: true, actions: null);
  }

  @override
  Widget body(BuildContext context) {
    return Obx(() {
      if (controller.appController.initialize.value != null) {
        List<Widget> items = [];
        for (var element in controller.appController.initialize.value!.locales!) {
          items.add(radioButton(title: element.name.toString(),
              value: element.name.toString(),
              controller: controller.cont));
        }
        return ListView.separated(
            itemBuilder: (context, index) {
              return items[index].paddingSymmetric(horizontal: 18);
            },
            separatorBuilder: (context, index) {
              return const TransparentDivider(
                height: 8,
              );
            },
            itemCount: items.length);
      } else {
        return Container();
      }
    });
  }

}