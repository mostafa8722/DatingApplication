

import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:get/get.dart';

import '../../widgets/bottomNavigation.dart';
import '../action/actionView.dart';
import '../conversation/conversationView.dart';
import '../home/homeView.dart';
import '../map/mapView.dart';
import '../profile/profileView.dart';
import 'mainController.dart';

class MainView extends GetView<MainController>{
  const MainView({super.key});


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Obx(() => Container(child: pages[controller.selectedIndex.value],)),
      bottomNavigationBar: Obx(() => bottomNavigationBar(controller.selectedIndex)),
    );
  }
}

List<GetView> pages = [
  HomeView(),
  const MapView(),
  const ActionView(),
  const ConversationView(),
  const ProfileView(),
];

