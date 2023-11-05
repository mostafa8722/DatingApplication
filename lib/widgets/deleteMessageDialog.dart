import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'button.dart';
import 'divider.dart';
import 'inputs.dart';


deleteMessageDialog( BuildContext context,
    {Function? onClick,bool showCheckBox=true}) {
  // set up the buttons
  RxBool check = false.obs;
  Widget cancelButton = TextButton(
    child: const Text("Cancel"),
    onPressed:  () {
      Get.back(canPop: false);
    },
  );
  Widget continueButton = TextButton(
    child: const Text("Delete"),
    onPressed:  () {
      onClick!(check.value);
      Get.back(canPop: false);
    },
  );

  // set up the AlertDialog
  AlertDialog alert = AlertDialog(
    content: Column(
      mainAxisSize: MainAxisSize.min,
      children: [
        const Text("Do you want to delete this message?"),
        showCheckBox ? Row(
          children: [
            Obx(() => Checkbox(value: check.value,
              onChanged: (value) {
                check.value = value!;
              },
            )),
            const Text("Also delete for participant")
          ],
        ):const SizedBox(height: 0,width: 0,)

      ],
    ),
    actions: [
      cancelButton,
      continueButton,
    ],
  );

  // show the dialog
  showDialog(
    context: context,
    builder: (BuildContext context) {
      return alert;
    },
  );
}