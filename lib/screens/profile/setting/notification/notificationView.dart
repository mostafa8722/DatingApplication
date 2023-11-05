
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:get/get.dart';

import '../../../../widgets/appBar.dart';
import '../../../../widgets/divider.dart';
import '../../../../widgets/switch.dart';
import 'interfaces/notificationViewInterface.dart';
import 'notificationController.dart';

class NotificationView extends GetView<NotificationController> implements NotificationViewInterface{
  const NotificationView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: appBar(),
      body: body(context),
    );
  }

  @override
  appBar() {
    return defaultAppBar(
        title: "Notification", showLeading: true, actions: null);
  }

  @override
  Widget body(BuildContext context) {
    List<Widget> items = [
      cupertinoSwitch( title: "Show Messages Previews", controller:controller.showPreviewsController),
      cupertinoSwitch( title: "New Messages", controller:controller.newMessagesController),
      cupertinoSwitch( title: "New Match", controller:controller.newMatchController),
      cupertinoSwitch( title: "Match Around Me", controller:controller.matchAroundMeController),
      cupertinoSwitch( title: "You Got Likes", controller:controller.gotLikesController),
      cupertinoSwitch( title: "You Got Star", controller:controller.gotStarController),
      cupertinoSwitch( title: "Subscription", controller:controller.subscriptionController),
      cupertinoSwitch( title: "Sound", controller:controller.soundController),
      cupertinoSwitch( title: "Vibrate", controller:controller.vibrateController),
      cupertinoSwitch( title: "New Updates", controller:controller.updateController),
      cupertinoSwitch( title: "VIP Status", controller:controller.vipStatusController),
      cupertinoSwitch( title: "New Services", controller:controller.servicesController),
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

}