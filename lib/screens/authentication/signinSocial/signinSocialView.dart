
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:sizer/sizer.dart';

import '../../../utils/res.dart';
import '../../../utils/route.dart';
import '../../../utils/theme/colors.dart';
import '../../../utils/theme/texts.dart';
import '../../../utils/translations.dart';
import '../../../widgets/button.dart';
import '../../../widgets/divider.dart';
import '../../../widgets/spannable.dart';
import '../../../widgets/text.dart';
import 'interfaces/signinSocialViewInterface.dart';
import 'signinSocialController.dart';

class SignInSocialView extends GetView<SignInSocialController>
    implements SignInSocialViewInterface {
  const SignInSocialView({super.key});

  @override
  Widget build(BuildContext context) {
    controller.initContext(context);
    return Scaffold(
      backgroundColor: Get.theme.backgroundColor,
      resizeToAvoidBottomInset: false,
      body: Get.testMode
          ? mobileBody()
          : SizerUtil.deviceType == DeviceType.tablet
              ? mobileBody() //todo tablet body
              : mobileBody(),
    );
  }

  Widget mobileBody() {
    return SafeArea(
        child: Container(
            color: Colors.white,
            width: double.infinity,
            height: MediaQuery.of(controller.context).size.height,
            padding: const EdgeInsets.symmetric(horizontal: 36),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisSize: MainAxisSize.min,
              children: [
                Expanded(child: image()),
                title(),
                const TransparentDivider(
                  height: 16.0,
                ),
                signInFacebookButton(),
                const TransparentDivider(
                  height: 8.0,
                ),
                signInGoogleButton(),
                const TransparentDivider(
                  height: 8.0,
                ),
                signInAppleButton(),
                const TransparentDivider(
                  height: 32.0,
                ),
                divider(),
                const TransparentDivider(
                  height: 32.0,
                ),
                signInButton(),
                const TransparentDivider(
                  height: 16.0,
                ),
                signUpButton(),
                const TransparentDivider(
                  height: 24.0,
                ),
              ],
            )));
  }

  Widget tabletBody() {
    return SafeArea(
        child: Container(
            color: Colors.white,
            width: double.infinity,
            padding: const EdgeInsets.symmetric(horizontal: 68),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [],
            )));
  }

  @override
  Widget signInAppleButton() {
    return OutlineButtonWithIcon(
      onPressed: () {
        controller.signinApple();
      },
      text: MyText.signinApple,
      icon: Icons.apple,
      textColor: Colors.black,
      iconColor: appleColor,
    );
  }

  @override
  Widget signInFacebookButton() {
    return OutlineButtonWithIcon(
      onPressed: () {
        controller.signinFacebook();
      },
      text: MyText.signinFacebook,
      icon: Icons.facebook,
      textColor: Colors.black,
      iconColor: facebookColor,
    );
  }

  @override
  Widget signInGoogleButton() {
    return OutlineButtonWithIcon(
      onPressed: () {
        controller.signinGoogle();
      },
      text: MyText.signinGoogle,
      imagePath: "assets/icons/google.png",
      textColor: Colors.black,
    );
  }

  @override
  Widget title() {
    return PaddingText(MyText.letsYouIn,
        padding: const EdgeInsets.symmetric(vertical: 2.0),
        style: introTextStyle,
        textAlign: TextAlign.center);
  }

  @override
  Widget divider() {
    return TextDivider(text: MyText.or,);
  }

  @override
  Widget image() {
    return Image.asset(Res.signinSocial);
  }

  @override
  Widget signInButton() {
    return Button(
        text: MyText.signinWithPassword, onPressed: () => controller.signin());
  }

  @override
  Widget signUpButton() {
    return Center(
        child: spannableText(MyText.dontHaveAccount,MyText.signup,(){
          Get.toNamed(MyRoute.signupRoute);
        }));
  }
}
