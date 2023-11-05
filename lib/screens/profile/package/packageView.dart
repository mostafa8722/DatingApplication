
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:get/get.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';
import 'package:flutter_speed_dial/flutter_speed_dial.dart';
import '../../../utils/theme/colors.dart';
import '../../../utils/theme/theme.dart';
import '../../../utils/translations.dart';
import '../../../widgets/appBar.dart';
import '../../../widgets/label.dart';
import '../../../widgets/packageItem.dart';
import 'interfaces/packageViewInterface.dart';
import 'packageController.dart';

class PackageView extends GetView<PackageController> implements PackageViewInterface {
  const PackageView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: appBar(),
        body: body(context)
    );
  }

  @override
  appBar() {
    return Obx(() => defaultAppBar(title: MyText.packages.value, actions: null,showLeading: true));
  }

  @override
  Widget body(BuildContext context) {
    return Container(
      alignment: Alignment.topCenter,
        child:SingleChildScrollView(
      child: Column(
      mainAxisSize: MainAxisSize.min,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        title(),
        description(),
        packages()
      ],
      )));
  }

  @override
  Widget title() {
    return Container(
      child: Text(MyText.packages.toUpperCase(),style: TextStyle(color: primaryColor,fontSize: 24,fontWeight: FontWeight.bold),),
    ).paddingAll(16);
  }

  @override
  Widget description() {
    return Container(
      child: Text("Lorem ipsum dolor sit amet,\n consectetur adipiscing elit. Etiam ",style:TextStyle(color: Colors.black,fontSize: 15,fontWeight: FontWeight.normal),textAlign: TextAlign.center),
    ).paddingAll(8);
  }

  @override
  Widget packages() {
    return Obx(() => Column(
      children: controller.packages.map((element){return packageItem(element.price!,element.tokens!);}).toList() ),
    );
  }

}
