
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../model/response/signlePeople.dart';
import '../../utils/animations.dart';
import '../../utils/log.dart';
import '../../utils/theme/theme.dart';
import '../../widgets/appBar.dart';
import '../../widgets/divider.dart';
import '../../widgets/homeSliderItem.dart';
import '../../widgets/inputs.dart';
import 'homeController.dart';
import 'intrfaces/HomeViewInterface.dart';

class HomeView extends GetView<HomeController> implements HomeViewInterface {
  HomeView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
        backgroundColor: Colors.white, body: SafeArea(child: body()));
  }

  @override
  Widget appbar() {
    return Obx(() => homeAppBar(
        fullName: controller.appController.user.value!.fullName.toString(),
        status: "Good Morning",
        profile: controller.appController.profile.value));
  }

  @override
  Widget body() {
    return Column(
      children: [
        const TransparentDivider(
          height: 8.0,
        ),
        appbar(),
        const TransparentDivider(
          height: 8.0,
        ),
        inputBox(Get.context!, controller.searchController,
            hint: "Search",
            suffixIcon: Icons.search),
        const TransparentDivider(
          height: 16.0,
        ),
        Expanded(
          child: slider(),
        ),
        const TransparentDivider(
          height: 24.0,
        )
      ],
    ).marginSymmetric(horizontal: 16);
  }

  @override
  Widget slider() {
    List<SinglePeople> list;
    return Obx(() {
      if(controller.showSearchList.value){
        list = controller.searchedPeoples;
      }else{
        list = controller.peoples;
      }
      return controller.loading.value
        ? const Center(
            child: CircularProgressIndicator(),
          )
        : Container(
            clipBehavior: Clip.hardEdge,
            decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(homeSliderRounded),
                color: Colors.transparent,
                boxShadow: [BoxShadow(color: Colors.black38, blurRadius: 10)]),
            child: Stack(
                fit: StackFit.loose,
                children: list.map((element) {
                  AnimationController animationController =
                      controller.animationController();
                  return GestureDetector(
                      onHorizontalDragEnd: (details) {
                        animationController.forward().then((value) {

                        });
                        Future.delayed(const Duration(milliseconds: 500)).then((value)  {
                          list.remove(element);
                          list.insert(0,element);
                        });
                      },
                      onHorizontalDragUpdate: (details) {
                        if (details.delta.direction <= 0) {
                          print("right");
                        } else {
                          print("left");
                        }
                      },
                      child: SlideTransition(
                          position: homeCardAnimation(animationController),
                          key: GlobalKey(),
                          child: homeSliderItem(
                              image: element.target != null
                                  ? element.target!.profile.toString()
                                  : "",
                              name: element.target != null
                                  ? element.target!.firstName.toString()
                                  : "",
                              age: element.target != null
                                  ? element.target!.age != null ? '${element.target!.age .toString()} Years':""
                                  : "",
                              //todo
                              distance: "159630",
                              //todo
                              onClickCommunication: () {
                                controller.showSingle(element);
                              },
                              onClickRemove: () {
                                animationController.forward().then((value) {

                                });
                                Future.delayed(const Duration(milliseconds: 500)).then((value)  {
                                  list.remove(element);
                                  list.insert(0,element);
                              });
                              },
                              onClickLike: () {
                                animationController.forward();
                                printLog(element.target!.id!);
                                controller.like(element);
                              },
                              onClickCall: () {
                                controller.call(element);
                              },
                              onClickChat: () {
                                controller.chat(element);
                              })));
                }).toList()));});
  }

  @override
  Widget sliderIndicator() {
    // TODO: implement sliderIndicator
    throw UnimplementedError();
  }
}
