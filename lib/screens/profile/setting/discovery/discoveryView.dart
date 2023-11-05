
import 'package:Lover369/utils/translations.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:get/get.dart';
import 'package:syncfusion_flutter_sliders/sliders.dart';

import '../../../../widgets/appBar.dart';
import '../../../../widgets/divider.dart';
import '../../../../widgets/menuItem.dart';
import '../../../../widgets/slider.dart';
import '../../../../widgets/switch.dart';
import 'discoveryController.dart';
import 'interfaces/discoveryViewInterface.dart';

class DiscoveryView extends GetView<DiscoveryController> implements DiscoveryViewInterface{
  const DiscoveryView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: appBar(),
      body: body(context),
    );
  }

  @override
  appBar() {
    return  defaultAppBar(
        title: MyText.discoverySetting, showLeading: true, actions: null);
  }

  @override
  Widget body(BuildContext context) {
    SfRangeValues _values = SfRangeValues(40.0, 80.0);
    List<Widget> items = [
      Obx(() => simpleMenuItem(title: MyText.location.value,label: "New York,US",fontWeight: FontWeight.bold)),
    Obx(() => rangeSlider(title:MyText.age.value,min: 0,max: 100,controller:controller.ageController)),
    Obx(() => rangeSlider(title:MyText.distance.value,min: 1,max: 70,controller:controller.distanceController)),
    Obx(() => cupertinoSwitch( title: MyText.searchArea.value, controller:controller.expandedSearchController,fontWeight: FontWeight.bold)),
    Obx(() => simpleMenuItem(title: MyText.womenOnly.value,label: MyText.womenOnly.value,fontWeight: FontWeight.bold)),
    Obx(() => cupertinoSwitch( title: MyText.hideLastSeen.value, controller:controller.hideLastSeenController,fontWeight: FontWeight.bold)),
    ];
    return ListView.separated(
        itemBuilder: (context, index) {
          return GestureDetector(
              onTap: () {},
              child:
              items[index].paddingSymmetric(horizontal: 18, vertical: 4));
        },
        separatorBuilder: (context, index) {
          return const TransparentDivider(
            height: 8,
          );
        },
        itemCount: items.length);
  }

}