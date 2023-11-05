
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:get/get.dart';

import '../../../utils/animations.dart';
import '../../../utils/theme/theme.dart';
import '../../../widgets/appBar.dart';
import '../../../widgets/button.dart';
import '../../../widgets/divider.dart';
import '../../../widgets/homeSliderItem.dart';
import 'interfaces/selectedMapUserViewInterface.dart';
import 'selectedMapUserController.dart';

class SelectedMapUserView extends GetView<SelectedMapUserController> implements SelectedMapUserViewInterface{
  const SelectedMapUserView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: appBar(),
      body: body(context),
    );
  }

  @override
  appBar() {
    return defaultAppBar(
        title: "Seleceted User", showLeading: true, actions: null);
  }

  @override
  Widget body(BuildContext context) {
    return Column(
      children: [
        const TransparentDivider(
          height: 8.0,
        ),
        Expanded(child:  userCard()),
        const TransparentDivider(
          height: 48.0,
        ),
        backButton()
      ],
    ).paddingSymmetric(horizontal: 16,vertical: 16);
  }

  @override
  Widget backButton() {
    return BlueButton(text:"back",onPressed: ()=>Get.back());
  }

  @override
  Widget userCard() {
    AnimationController animationController = controller.animationController();
    return Obx((){
      var people=controller.singlePeople.value!;
      var user=people.target!;
      return Container(
          clipBehavior: Clip.hardEdge,
          decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(homeSliderRounded),
              color: Colors.transparent,
              boxShadow: [BoxShadow(color: Colors.black38,blurRadius: 10)]
          ),
          child:SlideTransition(
          position: homeCardAnimation(animationController),
          key: GlobalKey(),
      child: homeSliderItem(
        image:  user.profile.toString(),
        name: user.firstName.toString(),
        age: user.age != null ? '${user.age.toString()} Years':"",//todo
        distance: "159630",//todo
        onClickCommunication: () {
          controller.showSingle(people);
        },
        onClickRemove: () {
          Get.back();
        },
        onClickLike: () {
          animationController.forward();
          controller.like(people);
        },
        onClickCall: () {
          controller.call(people);
        },onClickChat: (){
        controller.chat(people);
      })));});
  }

}