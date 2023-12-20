
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../utils/res.dart';
import '../utils/theme/colors.dart';
import '../utils/theme/texts.dart';
import '../utils/theme/theme.dart';
import 'button.dart';
import 'divider.dart';

Widget homeSliderItem({
  required String image,
  required String name,
  required String age,
  required String distance,
  required Function() onClickCommunication,
  required Function() onClickRemove,
  required Function() onClickLike,
  required Function() onClickCall,
  required Function() onClickChat,
}) {
  Rx<CoverMode> coverMode = CoverMode.hide.obs;
  return Container(
    width: double.infinity,
    clipBehavior: Clip.hardEdge,
    decoration: BoxDecoration(
      borderRadius: BorderRadius.circular(homeSliderRounded),
      color: Colors.white,
    ),
    child: Stack(
      children: [
        Image.network(
          image,
          fit: BoxFit.cover,
          width: double.infinity,
          height: double.maxFinite,
          ),
        Positioned(
          bottom: 0,
          left: 0,
          right: 0,
          child: Container(
            padding: const EdgeInsets.symmetric(horizontal: 16.0),
            color: homeSliderBackgroundColor,
            height: 110,
            alignment: Alignment.bottomCenter,
            child: SizedBox(
              height: 80,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Row(
                        children: [
                          Text(
                            name,
                            style: homeSliderUserNameTextStyle,
                            overflow: TextOverflow.ellipsis,
                          ),
                          const VerticalTransparentDivider(
                            width: 8,
                          ),
                          Image.asset(
                            Res.specialUserIcon,
                            width: 24,
                            height: 24,
                          )
                        ],
                      ),
                      const TransparentDivider(
                        height: 8,
                      ),
                      Text(
                        age,
                        style: homeSliderUserStateTextStyle,
                        overflow: TextOverflow.ellipsis,
                      )
                    ],
                  ),
                 /* Container(
                      padding: const EdgeInsets.symmetric(
                          horizontal: 10.0, vertical: 6.0),
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(50),
                          color: homeDistanceLabelBackgroundColor),
                      child: Row(
                        mainAxisSize: MainAxisSize.min,
                        children: [
                          const Icon(
                            Icons.place,
                            color: Colors.black,
                            size: 16,
                          ),
                          Text(
                            "$distance km",
                            style: homeSliderUserDistanceTextStyle,
                          )
                        ],
                      ))*/
                ],
              ),
            ),
          ),
        ),
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
                  onClickChat();
                },
                icon: Res.chatIcon2,
                size: 50,
                iconColor: homeSliderChatColor,
              ),
              const VerticalTransparentDivider(width: 8.0),
              MyFloatingButton(
                onPressed: (){
                  onClickCall();
                },
                icon: Res.callIcon,
                size: 50,
                iconColor: homeSliderCallColor,
              ),
              const VerticalTransparentDivider(width: 8.0),
              MyFloatingButton(
                onPressed: onClickCommunication,
                icon: Res.homeSliderCommunicateIcon,
                size: 50,
                iconColor: homeSliderCommunicateColor,
              ),
              const VerticalTransparentDivider(width: 8.0),
              MyFloatingButton(
                onPressed:() {
              //coverMode.value = CoverMode.like;
              onClickLike();
              },
                icon: Res.homeSliderLikeIcon,
                size: 50,
                iconColor: homeSliderLikeColor,
              ),
              const VerticalTransparentDivider(width: 8.0),
              MyFloatingButton(
                onPressed:(){
                  coverMode.value = CoverMode.remove;
                  onClickRemove();
                },
                icon: Res.homeSliderRemoveIcon,
                size: 50,
                iconColor: homeSliderRemoveColor,
              ),
            ],
          ),
        ),
        Obx(() =>coverMode.value != CoverMode.hide ? homeSliderItemActionCover(
            image: image, name: name, status: age, coverMode):const SizedBox())
      ],
    ),
  );
}

Widget homeSliderItemActionCover(Rx<CoverMode> coverMode,
    {required String image,
    required String name,
    required String status,
    required}) {
  late Color color;
  late IconData icon;
  switch (coverMode.value) {
    case CoverMode.remove:
      color = homeSliderRemoveColor;
      icon = Res.homeSliderFavoriteIcon;
      break;
    case CoverMode.like:
      color = homeSliderLikeColor;
      icon = Res.homeSliderLikeIcon;
      break;
    default:
      color = homeSliderFavoriteColor;
      icon = Res.homeSliderFavoriteIcon;
      break;
  }
  return Container(
      width: double.infinity,
      clipBehavior: Clip.hardEdge,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(homeSliderRounded),
      ),
      child: Stack(children: [
        Image.network(
          image,
          fit: BoxFit.cover,
          width: double.infinity,
          height: double.maxFinite,
        ),
        Container(
          decoration: BoxDecoration(
              gradient: LinearGradient(
                  colors: [color, Colors.transparent],
                  begin: Alignment.bottomCenter,
                  end: Alignment.topCenter)),
        ),
        Positioned(
          bottom: 0,
          left: 0,
          right: 0,
          child: Container(
            padding: const EdgeInsets.symmetric(horizontal: 16.0),
            height: 110,
            alignment: Alignment.bottomCenter,
            child: Container(
              height: 80,
              child: Row(
                mainAxisSize: MainAxisSize.max,
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(
                        name,
                        style: homeSliderCoverUserNameTextStyle,
                      ),
                      const TransparentDivider(
                        height: 8,
                      ),
                      Text(
                        status,
                        style: homeSliderCoverUserStateTextStyle,
                      )
                    ],
                  ),
                ],
              ),
            ),
          ),
        ),
        Center(
            child: MyFloatingButton(
          onPressed: () {},
          size: 60,
          icon: Icons.close,
          iconColor: color,
        ))
      ]));
}

enum CoverMode { remove, like, favorite, hide }
