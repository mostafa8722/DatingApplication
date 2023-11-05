
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../utils/log.dart';
import '../../widgets/appBar.dart';
import '../../widgets/tab.dart';
import 'actionController.dart';
import 'blocks/blocksView.dart';
import 'contacts/contactsView.dart';
import 'favorites/favoritesView.dart';
import 'interfaces/actionViewInterface.dart';
import 'likedMe/likedMeView.dart';
import 'likes/likesView.dart';
import 'seenMyProfile/seenProfileView.dart';

class ActionView extends GetView<ActionController>
    implements ActionViewInterface {
  const ActionView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: appBar(),
      body: body(context),
    );
  }

  @override
  appBar() {
    return searchAppBar(
      title: "Actions",
      onSearch: controller.onSearch,
      showLeading: false
    );
  }

  @override
  Widget body(BuildContext context) {
    return DefaultTabController(
        length: 6,
        child: Column(children: [
          tabBar(controller.tabController ,tabs(),isScrollable:true).marginSymmetric(horizontal: 16),
          Expanded(child: tabBarView()),
        ]));
  }

  @override
  List<Tab> tabs() {
    return <Tab>[
      tab("Likes"),
      tab("Favorites"),
      tab("Contact"),
      tab("Block"),
      tab("Seen My Profile"),
      tab("Liked Me"),
    ];
  }

  @override
  Widget tabBarView() {
    return TabBarView(controller: controller.tabController, children: const [
      LikesView(),
      FavoritesView(),
      ContactsView(),
      BlocksView(),
      SeenProfileView(),
      LikedMeView()
    ]);
  }
}
