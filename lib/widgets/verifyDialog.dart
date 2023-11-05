import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../utils/theme/colors.dart';
import 'button.dart';
import 'divider.dart';
import 'inputs.dart';

verifyDialog(
    BuildContext context,
    RxBool loading ,
{Function? onClick}
    ) {

  showDialog(
      context: context,
      builder: (BuildContext context) {
        TextEditingController controller = TextEditingController();
        return
          Column(
          mainAxisSize: MainAxisSize.min,
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Container(
                  margin:const EdgeInsets.symmetric(horizontal: 16),
                  alignment: Alignment.bottomCenter,
                  child: Card(
                    elevation: 8,
                    shadowColor: Colors.black87,
                    shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(16)),
                    child:SizedBox(
        width: double.maxFinite,
        child: Column(
                      mainAxisAlignment: MainAxisAlignment.spaceAround,
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        const Text("Verification!",style: TextStyle(color: primaryColor,fontSize: 22,fontWeight: FontWeight.bold),),
                        const TransparentDivider(height: 16,),
                        const Text("Please enter your verification code in below input",style: TextStyle(color: Colors.grey,fontSize: 13),),
                        const TransparentDivider(height: 16,),
                        inputBox(context, controller, hint: "Enter your verification code"),
                        const TransparentDivider(height: 16,),
                        submitButton(loading,(){onClick!(controller.text);})
                      ],
                    ).paddingAll(16.0),
                    )))
            ]).marginOnly(bottom: 70);
      });
}

Widget submitButton(RxBool loading,Function onClick) {
  return Obx(() => Button(
    onPressed:(){onClick();},
    text: "send code",
    loading: loading.value,
  ));
}