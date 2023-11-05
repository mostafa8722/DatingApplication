import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../../../utils/translations.dart';
import '../../../../../widgets/appBar.dart';
import '../../../../../widgets/button.dart';
import '../../../../../widgets/divider.dart';
import '../../../../../widgets/inputs.dart';
import '../interfaces/personalInformationViewInterface.dart';
import 'emailController.dart';

class EmailView extends GetView<EmailController>
    implements PersonalInformationViewInterface {
  const EmailView({super.key});

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
      inputBox(context, controller.emailController, hint: "Email", suffixIcon: Icons.mail_rounded),
      const TransparentDivider(height: 16,),
      submitButton(),
      const TransparentDivider(height: 16,),
      const Text("You may receive email notifications from us \nfor security and login purposes.",textAlign: TextAlign.center,style: TextStyle(fontSize: 13,color: Colors.grey)),
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
