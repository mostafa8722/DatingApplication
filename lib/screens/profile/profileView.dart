
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:images_picker/images_picker.dart';

import '../../utils/res.dart';
import '../../utils/theme/colors.dart';
import '../../utils/translations.dart';
import '../../widgets/divider.dart';
import '../../widgets/image.dart';
import '../../widgets/menuItem.dart';
import 'interfaces/profileViewInterface.dart';
import 'profileController.dart';

class ProfileView extends GetView<ProfileController>
    implements ProfileViewInterface {
  const ProfileView({super.key});
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: appbar(),
      body: body(),
    );
  }

  @override
  Widget body() {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      mainAxisSize: MainAxisSize.min,
      children: [
        image(),
        const TransparentDivider(height: 16),
        packageCard(),
        const TransparentDivider(height: 16),
        menus()
      ],
    ).paddingSymmetric(vertical: 4, horizontal: 24);
  }

  @override
  AppBar appbar() {
    return AppBar(
      title: Obx(() => Text(MyText.profiles.value)),
    );
  }

  @override
  Widget image() {
    return Obx(() => GestureDetector(
      onTap: (){
        ImagesPicker.pick(
          count: 1,
          pickType: PickType.image,
          cropOpt: CropOption(aspectRatio: const CropAspectRatio(1, 1))
        ).then((medias) {
          try{
            controller.updateProfile(medias![0].path.toString());
          }catch(_){}
        });
      },
      child: circularImage(networkImage: controller.appController.profile.value, size: 160,),
    ));
  }

  @override
  Widget menus() {
    return Obx(() => Column(
      children: [
        profileMenuItem(title:MyText.setting.value, icon: Icons.settings, onClick: controller.gotoSetting),
        profileMenuItem(title: MyText.helpCenter.value, icon: Icons.help, onClick: () {}),
        profileMenuItem(
            title: MyText.inviteFriends.value,
            icon: Icons.person_add_alt_1,
            onClick: () {}),
        profileMenuItem(
            title: MyText.logout.value,
            icon: Icons.exit_to_app_rounded,
            onClick: controller.logout,
            showForwardIcon: false,
            iconColor: Colors.red,
            titleColor: Colors.red),
      ],
    ));
  }

  @override
  Widget packageCard() {
    return GestureDetector(
      onTap: (){controller.gotoPackages();},
      child:Container(
      height: 160.0,
      clipBehavior: Clip.hardEdge,
      decoration: BoxDecoration(
          color: Colors.blue, borderRadius: BorderRadius.circular(24.0)),
      child: Stack(
        fit: StackFit.expand,
        children: [
          Image.asset(
            Res.bgPackage,
            fit: BoxFit.fitWidth,
            width: double.infinity,
          ),
          Container(
              child: Row(
            children: [
              Expanded(
                  child: Column(
                    mainAxisSize: MainAxisSize.max,
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const Text(
                    "Enjoy All Benefits!",
                    style: TextStyle(
                        color: Colors.white,
                        fontWeight: FontWeight.bold,
                        fontSize: 22)
                  ),
                  const Text(
                    "Lorem ipsum dolor sit amet, consectetur adipiscing elit. Etiam ",
                    style: TextStyle(color: Colors.white, fontSize: 13),
                  ),
                  Container(
                    padding:const EdgeInsets.symmetric(vertical: 4,horizontal: 8),
                    margin: EdgeInsets.only(left: 16),
                    decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(8)
                    ),
                    child:Obx(() => Text('\$ ${controller.appController.user.value!.wallet}',style: TextStyle(fontWeight: FontWeight.bold,color: primaryColor,fontSize: 16),)),
                  )
                ],
              )),
              Image.asset(Res.packageCrown, width: 80, height: 80)
            ],
          )).paddingAll(24.0)
        ],
      ),
    ));
  }
}
