
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:get/get.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';
import 'package:flutter_speed_dial/flutter_speed_dial.dart';
import '../../../utils/res.dart';
import '../../../utils/theme/colors.dart';
import '../../../utils/theme/theme.dart';
import '../../../widgets/bestPhotoItem.dart';
import '../../../widgets/button.dart';
import '../../../widgets/divider.dart';
import '../../../widgets/image.dart';
import '../../../widgets/label.dart';
import '../../../widgets/titleWidget.dart';
import 'interfaces/userViewInterface.dart';
import 'userController.dart';

class UserView extends GetView<UserController> implements UserViewInterface {
  const UserView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: SafeArea(child: body(context)),
        floatingActionButton: circularMenu());
  }

  @override
  appBar() {
   return AppBar(
       leading: IconButton(
                   onPressed: () {Get.back();}, icon: const Icon(Icons.arrow_back)),
               // actions: [IconButton(onPressed: () {}, icon: Icon(Icons.menu))],
   );
  }

  @override
  Widget body(BuildContext context) {
    return SingleChildScrollView(
      child: Column(
      mainAxisSize: MainAxisSize.min,
      children: [
        info(context),
        const TransparentDivider(height: 16),
        bestPhotos(),
        const TransparentDivider(height: 24),
        about(),
        const TransparentDivider(height: 24),
        interest(),
        const TransparentDivider(height: 60),
      ],
      ));
  }

  @override
  Widget about() {
    return Obx(() => titleWidget(
            title: "About",
            widget: Text(controller.about.value.toString())
        )).paddingOnly(left: 16, right: 16);
  }

  @override
  Widget bestPhotos() {
    return  Obx(() =>controller.bestPhotos.isNotEmpty ? titleWidget(
        title: "Best Photos",
        horizontalMargin: 16,
        widget: SizedBox(
            height: 180,
            child: ListView.separated(
                scrollDirection: Axis.horizontal,
                itemBuilder: (context, index) {
                  return index == 0
                      ? const SizedBox(width: 12)
                      : bestPhotoItem(image: controller.bestPhotos[index]);
                },
                separatorBuilder: (context, index) {
                  return const VerticalTransparentDivider(width: 4);
                },
                itemCount: controller.bestPhotos.length))):const SizedBox());
  }

  @override
  circularMenu() {
    return SpeedDial(
      overlayColor: const Color(0x09ffffff),
      icon: Icons.add,
      activeIcon: Icons.close,
      foregroundColor: Colors.white,
      children: [
        SpeedDialChild(
          child: const Icon(Icons.chat),
          backgroundColor: circularButtonBackgroundColor,
          foregroundColor: primaryColor,
          label: "chat",
          onTap: () => controller.gotoChat(),
        ),
        SpeedDialChild(
          child: const Icon(Icons.call),
          label: "call",
          backgroundColor: circularButtonBackgroundColor,
          foregroundColor: primaryColor,
          onTap: () => controller.gotoCall(),
        ),
        SpeedDialChild(
          label: "email",
          child: const Icon(Icons.mail),
          backgroundColor: circularButtonBackgroundColor,
          foregroundColor: primaryColor,
          onTap: () => debugPrint('SECOND CHILD'),
        )
      ],
    );
  }

  @override
  Widget interest() {
    return Obx(() => controller.interests.isNotEmpty
        ? titleWidget(
            title: "Interest",
            horizontalMargin: 0,
            widget: Wrap(
              spacing: 4.0, // gap between adjacent chips
              runSpacing: 6.0, // gap between lines
              children: controller.interests
                  .map(
                    (element) => label(
                        text: element.name.toString(),
                        backgroundColor: primaryColor,
                        borderRadius: 50,
                        textColor: Colors.white),
                  )
                  .toList(),
            )).paddingOnly(left: 16, right: 16)
        : const SizedBox());
  }
/*
  @override
  Widget photoSlider(BuildContext context) {
    return Obx(() =>  SizedBox(
      height: MediaQuery.of(context).size.height / 1.5,
        child:Stack(
      fit: StackFit.expand,
      children: [
        PageView(
            controller: controller.pagerController,
            children: controller.sliderPhotos
                .map((element) => Image.network(element,fit: BoxFit.cover,))
                .toList()),
        Positioned(
          bottom: 0,
          right: 0,
          left: 0,
          child: Container(
            height: 30,
            decoration: const BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.only(
                    topLeft: Radius.circular(100),
                    topRight: Radius.circular(100))),
          ),
        ),
        Positioned(
          bottom: 38,
          right: 0,
          left: 0,
          child: Container(
            child: photoSliderIndicator(),
          ),
        ),
        Positioned(
          top: 0,
          right: 0,
          left: 0,
          child: appBar(),
        ),
      ],
    )));
  }*/

  @override
  Widget info(BuildContext context) {
    return Obx(() =>  SizedBox(
      height: MediaQuery.of(context).size.height / 1.5,
        child:Stack(
      fit: StackFit.expand,
      children: [
        image(networkImage: controller.banner.value),
        Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            circularImage(networkImage: controller.profile.toString(),size: 180),
            const TransparentDivider(height: 12.0),
            Text(
              controller.name.value,
              style:
              const TextStyle(fontSize: 20, color: Colors.black,shadows: [Shadow(color: Colors.white,blurRadius:40)]),
            ),
            const TransparentDivider(height: 4.0),
            Text(
              controller.birthday.value,
              style:
              const TextStyle(fontSize: 16, color: Colors.black,shadows: [Shadow(color: Colors.white,blurRadius:40)]),
            ),
            const TransparentDivider(height: 4.0),
            Row(
              crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Icon(Icons.circle_rounded,size: 12,color: controller.isOnline.value ?Colors.green:Colors.red,),
                const VerticalTransparentDivider(width: 4.0),
                Text(
                  controller.isOnline.value ? "Online":"Offline",
                  style:
                  const TextStyle(fontSize: 16, color: Colors.black,shadows: [Shadow(color: Colors.white,blurRadius:40)]),
                ),
            ],),
            const TransparentDivider(height: 24.0),
            Positioned(
              bottom: 80,
              right: 0,
              left: 0,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  MyFloatingButton(
                    onPressed:(){
                      controller.gotoChat();
                    },
                    icon: Res.chatIcon2,
                    size: 50,
                    iconColor: homeSliderChatColor,
                  ),
                  const VerticalTransparentDivider(width: 12.0),
                  MyFloatingButton(
                    onPressed: (){
                      controller.gotoCall();
                    },
                    icon: Res.callIcon,
                    size: 50,
                    iconColor: homeSliderCallColor,
                  ),
                  const VerticalTransparentDivider(width: 12.0),
                  MyFloatingButton(
                    onPressed: (){
                      controller.addToContact();
                    },
                    icon: Res.homeSliderAddContactIcon,
                    size: 50,
                    iconColor: homeSliderCommunicateColor,
                  ),
                  const VerticalTransparentDivider(width: 12.0),
                  MyFloatingButton(
                    onPressed:() {
                      controller.like();
                    },
                    icon: Res.homeSliderLikeIcon,
                    size: 50,
                    iconColor: homeSliderLikeColor,
                  ),
                  const VerticalTransparentDivider(width: 12.0),
                  MyFloatingButton(
                    onPressed:() {
                      controller.block();
                    },
                    icon: Res.homeSliderBlockIcon,
                    size: 50,
                    iconColor: homeSliderLikeColor,
                  ),
                ],
              ),
            ),
        ],),
        Positioned(
          top: 0,
          right: 0,
          left: 0,
          child: appBar(),
        ),
      ],
    )));
  }

  @override
  Widget photoSliderIndicator() {
    return Center(
        child: SmoothPageIndicator(
            controller: controller.pagerController, // PageController
            count: controller.sliderPhotos.length,
            effect: indicatorEffect, // your preferred effect
            onDotClicked: (index) {}));
  }

  @override
  Widget userTitle() {
    return Obx(() => Row(
          children: [
            Flexible(
                flex: 3,
                child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        controller.name.value,
                        style:
                            const TextStyle(fontSize: 24, color: Colors.black),
                      ),
                      const TransparentDivider(
                        height: 4,
                      ),
                      Row(
                        children: [
                          Text(controller.category.value),
                          const VerticalTransparentDivider(
                            width: 8,
                          ),
                          label(
                              text: controller.status.value,
                              backgroundColor: profileLabelBackgroundColor,
                              textColor: primaryColor)
                        ],
                      )
                    ])),
            Flexible(
              flex: 1,
              child: Center(
                child: label(
                    text: "3 km",
                    textColor: primaryColor,
                    borderRadius: 50,
                    borderColor: primaryColor),
              ),
            )
          ],
        ).paddingOnly(left: 16, right: 16));
  }
}
