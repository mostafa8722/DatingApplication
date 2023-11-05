
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:get/get.dart';

import '../../../../utils/translations.dart';
import '../../../../widgets/appBar.dart';
import '../../../../widgets/button.dart';
import '../../../../widgets/datePicker.dart';
import '../../../../widgets/divider.dart';
import '../../../../widgets/dropdown.dart';
import '../../../../widgets/inputs.dart';
import 'interfaces/personalInformationViewInterface.dart';
import 'personalInformationController.dart';


class PersonalInformationView extends GetView<PersonalInformationController>
    implements PersonalInformationViewInterface {
  const PersonalInformationView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      appBar: appBar(),
      body: body(context),
    );
  }

  @override
  appBar() {
    return  defaultAppBar(
        title: MyText.personalInformation, showLeading: true, actions: null);
  }

  @override
  Widget body(BuildContext context) {
    List<DropdownMenuItem<String>> menuItems = [
      DropdownMenuItem(child: Obx(() => Text(MyText.male.value)),value: MyText.male.value),
      DropdownMenuItem(child: Obx(() => Text(MyText.female.value)),value: MyText.female.value),
    ];
    var selectedValue = "USA".obs;
    List<Widget> items = [
      Obx(() => inputBox(context, controller.emailController,
          hint: MyText.email.value, suffixIcon: Icons.mail_rounded,onClick: controller.onClickEmail)),
      const TransparentDivider(height: 4,),
      Obx(() => inputBox(context, controller.phoneController,
          hint: MyText.phoneNumber.value, suffixIcon: Icons.phone,onClick: controller.onClickPhone)),
      const TransparentDivider(height: 8,),
      const Divider(height: 1,),
      const TransparentDivider(height: 8,),
    Obx(() => inputBox(context, controller.firstNameController, hint: MyText.firstName.value)),
      const TransparentDivider(height: 4,),
    Obx(() => inputBox(context, controller.lastNameController, hint: MyText.lastName.value)),
      const TransparentDivider(height: 4,),
    Obx(() => inputBox(context, controller.birthdateController,
          hint: MyText.birthdate.value,
          suffixIcon: Icons.calendar_month_rounded, onClick: () {
        datePickerDialog(context, controller.onSelectionBirthDate);
      })),
      const TransparentDivider(height: 4,),
      dropdown(menuItems,controller.onChangedGender,controller.gender == MyText.male ? menuItems[0].value: menuItems[1].value,leftPadding: 8),
      const TransparentDivider(height: 16,),
      submitButton()
    ];
    // var listItem =  ListView.separated(
    //     itemBuilder: (context, index) {
    //       return GestureDetector(
    //           onTap: () {},
    //           child:
    //               items[index].paddingSymmetric(horizontal: 18, vertical: 4));
    //     },
    //     separatorBuilder: (context, index) {
    //       return const TransparentDivider(
    //         height: 4,
    //       );
    //     },
    //     itemCount: items.length);

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
