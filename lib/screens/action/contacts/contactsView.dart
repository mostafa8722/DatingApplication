
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../utils/enums.dart';
import '../../../widgets/actionListItem.dart';
import '../../../widgets/empty.dart';
import '../../../widgets/loading.dart';
import 'contactsController.dart';
import 'interfaces/contactsViewInterface.dart';

class ContactsView extends GetView<ContactsController> implements ContactsViewInterface {
  const ContactsView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: body(context),
    );
  }

  @override
  Widget body(BuildContext context) {
    return Obx(() =>
    controller.loading.value
        ? circularLoading() : controller.list.isNotEmpty
        ? list()
        : empty()
    );
  }

  @override
  Widget list() {
    return Obx(() {
      var list = controller.actionController.searchText.isEmpty ? controller
          .list : controller.filterList;
      return ListView.builder(
          itemCount: list.length,
          itemBuilder: (context, index) {
            var item = list[index];
            return actionListItem(
              name: item.target!.fullName.toString(),
              description: item.target!.description,
              actionMode: ActionMode.contact,
              image: item.target!.profile.toString(),
              itemClicked: () => controller.onClickItem(item.target!),
              // actionClicked: () => controller.onClickAction(item.target!.id!),
            );
          });
    });
  }
}
