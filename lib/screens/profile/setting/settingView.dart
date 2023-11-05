import 'package:Lover369/screens/profile/setting/interfaces/settingViewInterface.dart';
import 'package:Lover369/utils/translations.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:get/get.dart';

import '../../../model/view/settingModel.dart';
import '../../../widgets/appBar.dart';
import '../../../widgets/menuItem.dart';
import 'settingController.dart';

class SettingView extends GetView<SettingController>
    implements SettingViewInterface {
  const SettingView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: appBar(),
      body: body(context),
    );
  }

  @override
  appBar() {
    return defaultAppBar(
        title: MyText.setting.value, actions: null, showLeading: true);
  }

  @override
  Widget body(BuildContext context) {
    return list();
  }

  @override
  Widget list() {
    return Obx(() {
      List<SettingModel> items = settingItems();
      return ListView.builder(
          itemCount: items.length,
          itemBuilder: (context, index) {
            SettingModel model = items[index];
            return settingMenuItem(
                title: model.title,
                icon: model.icon,
                backgroundColor: model.color,
                onClick: model.onClick,
                label: model.label);
          });
    });
  }

  @override
  List<SettingModel> settingItems() {
    List<SettingModel> settingItems = [];
    settingItems.add(SettingModel(
        MyText.personalInformation.value, Icons.person, const Color(0xFF9F24FF),
        onClick: controller.onClickPersonalInformation));
    settingItems.add(SettingModel("Discovery Settings",
        Icons.assistant_navigation, const Color(0xFFFD9A0E),
        onClick: controller.onClickDiscoverySetting));
    // settingItems.add(SettingModel("Privacy & Permission", Icons.lock,const Color(0xFF3E68FA),onClick: controller.onClickPrivacyInformation));
    settingItems.add(SettingModel(
        MyText.notification.value, Icons.notifications, const Color(0xFFFF5E76),
        onClick: controller.onClickNotification));
    settingItems.add(SettingModel(
        MyText.security.value, Icons.security, const Color(0xFF13C57D),
        onClick: controller.onClickSecurity));
    // settingItems.add(SettingModel("Data &Storage", Icons.folder,const Color(0xFFFCD330),onClick: controller.onClickDataStorage));
    // settingItems.add(SettingModel("Feedback", Icons.feedback,const Color(0xFF009689),onClick: controller.onClickFeedback));
    settingItems.add(SettingModel(
        MyText.language.value, Icons.text_snippet, const Color(0xFF1A96F0),
        onClick: controller.onClickLanguage));
    // settingItems.add(SettingModel("About ", Icons.info,const Color(0xFF607D8A),onClick: controller.onClickAbout));
    return settingItems;
  }
}
