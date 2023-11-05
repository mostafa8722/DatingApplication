
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';
import 'package:intl_phone_field/intl_phone_field.dart';

import '../../../../../utils/translations.dart';
import '../../../../../widgets/appBar.dart';
import '../../../../../widgets/button.dart';
import '../../../../../widgets/divider.dart';
import '../../../../../widgets/inputs.dart';
import '../interfaces/personalInformationViewInterface.dart';
import 'phoneController.dart';

class PhoneView extends GetView<PhoneController>
    implements PersonalInformationViewInterface {
  const PhoneView({super.key});

  @override
  Widget build(BuildContext context) {
    controller.initContext(context);
    return Scaffold(
      resizeToAvoidBottomInset: false,
      appBar: appBar(),
      body: body(context),
    );
  }

  @override
  appBar() {
    return defaultAppBar(
        title: "Phone Number", showLeading: true, actions: null);
  }

  @override
  Widget body(BuildContext context) {
    List<Widget> items = [
      const TransparentDivider(height: 16,),
      Obx(() => inputPhoneBox(context, controller.phoneController,controller.onChangedPhone, hint: "Phone Number",initializeCode: controller.initializeCode.value)),
      const TransparentDivider(height: 16,),
      submitButton(),
      const TransparentDivider(height: 16,),
      const Text("You may receive SMS notifications from us \nfor security and login purposes.",textAlign: TextAlign.center,style: TextStyle(fontSize: 13,color: Colors.grey)),
    ];

    return Column(children: items).paddingSymmetric(horizontal: 18, vertical: 12);
  }

  @override
  Widget submitButton() {
    return Obx(() => Button(
      onPressed: () {
        controller.submit();
      },
      text: MyText.submit.value,
      loading: controller.loading.value,
    ));
  }
}
