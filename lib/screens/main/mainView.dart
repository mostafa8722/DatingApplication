

import 'package:Lover369/widgets/error_connection.dart';
import 'package:Lover369/widgets/loading.dart';
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
    return  Obx(() => controller.appController.loadedInitData.value?body():errorBody() ) ;
  }

  Widget body(){
    return Scaffold(
      backgroundColor: Colors.white,
      body: Obx(() => Container(child: pages[controller.selectedIndex.value],)),
      bottomNavigationBar: Obx(() => bottomNavigationBar(controller.selectedIndex)),
    );
  }
  Widget errorBody(){
    return Scaffold(
      backgroundColor: Colors.white,

      body: Obx(() =>  controller.appController.loading.value?circularLoading() :
          Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              ErrorConnection(controller.retryConnection,true)
            ],
          )

      ),
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


