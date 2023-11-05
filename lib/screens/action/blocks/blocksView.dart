
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../utils/enums.dart';
import '../../../widgets/actionListItem.dart';
import '../../../widgets/empty.dart';
import '../../../widgets/loading.dart';
import 'blocksController.dart';
import 'interfaces/blocksViewInterface.dart';

class BlocksView extends GetView<BlocksController> implements BlocksViewInterface {
  const BlocksView({super.key});

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
            actionMode: ActionMode.block,
            itemClicked: () => controller.onClickItem(item.target!),
            actionClicked: () => controller.onClickAction(item),
          );
        });});
  }
}
