
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../utils/enums.dart';
import '../../../widgets/actionListItem.dart';
import '../../../widgets/empty.dart';
import '../../../widgets/loading.dart';
import 'interfaces/likedMeViewInterface.dart';
import 'likedMeController.dart';

class LikedMeView extends GetView<LikedMeController> implements LikedMeViewInterface {
  const LikedMeView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: body(context),
    );
  }

  @override
  Widget body(BuildContext context) {
    return Obx(() => controller.loading.value
        ? circularLoading():controller.list.isNotEmpty
            ? list()
            : empty()
        );
  }

  @override
  Widget list() {
    return Obx(() {
      var list = controller.actionController.searchText.isEmpty ? controller.list:controller.filterList;
      return ListView.builder(
          itemCount: list.length,
          itemBuilder: (context, index) {
            var item = list[index];
          return actionListItem(
            name: item.target!.fullName.toString(),
            description: item.target!.description,
            image: item.target!.profile.toString(),
            actionMode: ActionMode.seenMyProfile,
            itemClicked: () => controller.onClickItem(item.target!),
            actionClicked: () => controller.onClickAction(item.target!.id!),
          );
        });});
  }
}
