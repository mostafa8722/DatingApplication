
import 'package:Lover369/widgets/error_connection.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../utils/enums.dart';
import '../../../widgets/actionListItem.dart';
import '../../../widgets/empty.dart';
import '../../../widgets/loading.dart';
import 'favoritesController.dart';
import 'interfaces/favoritesViewInterface.dart';

class FavoritesView extends GetView<FavoritesController>
    implements FavoritesViewInterface {
  const FavoritesView({super.key});

  @override
  Widget build(BuildContext context) {
    controller.onInit();
    return Scaffold(
      body: body(context),
    );
  }

  @override
  Widget body(BuildContext context) {
    return Obx(() =>controller.showInternetConnection.value?
    ErrorConnection(controller.retryConnection): controller.loading.value
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
            name: item.target!.fullName,
            description: item.target!.description,
            image: item.target!.profile.toString(),
            actionMode: ActionMode.favorite,
            itemClicked: () => controller.onClickItem(item.target!),
            actionClicked: () => controller.onClickAction(item),
          );
        });});
  }
}
