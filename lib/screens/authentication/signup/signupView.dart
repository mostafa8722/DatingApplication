
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:sizer/sizer.dart';

import '../../../utils/res.dart';
import '../../../utils/theme/colors.dart';
import '../../../utils/theme/texts.dart';
import '../../../utils/translations.dart';
import '../../../widgets/button.dart';
import '../../../widgets/checkbox.dart';
import '../../../widgets/divider.dart';
import '../../../widgets/dropdown.dart';
import '../../../widgets/inputs.dart';
import '../../../widgets/scrollBehavior.dart';
import '../../../widgets/spannable.dart';
import '../../../widgets/text.dart';
import 'interfaces/signupViewInterface.dart';
import 'signupController.dart';

class SignUpView extends GetView<SignUpController> implements SignUpViewInterface {
  const SignUpView({super.key});

  @override
  Widget build(BuildContext context) {
    controller.initContext(context);
    return Scaffold(
      backgroundColor: Get.theme.backgroundColor,
      resizeToAvoidBottomInset: false,
      body: Get.testMode ? mobileBody():SizerUtil.deviceType == DeviceType.tablet
          ? tabletBody()
          : mobileBody(),
    );
  }

  Widget mobileBody() {
    return NestedScrollView(
      headerSliverBuilder: (BuildContext context, bool innerBoxIsScrolled) {
        return <Widget>[
        SliverAppBar(
        pinned: false,
        floating: true,
          forceElevated: innerBoxIsScrolled,
          leading:IconButton(onPressed: ()=>Get.back(), icon: const Icon(Icons.arrow_back)),
        )];},
      body: Container(
          color: Colors.white,
          width: double.infinity,
          padding: const EdgeInsets.symmetric(horizontal: 36),
          child:ScrollConfiguration(
                    behavior: CustomScroll(),
                    child: ListView(
            children: [
              image(),
              const TransparentDivider(
                height: 8.0,
              ),
              description(),
              const TransparentDivider(
                height: 24,
              ),
              inputUsername(),
              const TransparentDivider(
                height: 4,
              ),
              inputPassword(),
              const TransparentDivider(
                height: 4,
              ),
              inputConfirmPassword(),
              const TransparentDivider(
                height: 4,
              ),
              genderSelectors(),
              const TransparentDivider(
                height: 12,
              ),
              // rememberMe(),
              // const TransparentDivider(
              //   height: 4,
              // ),
              registerButton(),
              const TransparentDivider(
                height: 16,
              ),
              divider(),
              const TransparentDivider(
                height: 24,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  signInFacebookButton(),
                  signInGoogleButton(),
                  signInAppleButton(),
                ],
              ),
              const TransparentDivider(
                height: 32,
              ),
              signInButton(),
              const TransparentDivider(
                height: 32,
              ),
            ],
          ))),
    );
    // return SafeArea(
    //     child: ScrollConfiguration(
    //         behavior: CustomScroll(),
    //         child:));
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
              children: [
                const Spacer(),
                image(),
                const TransparentDivider(
                  height: 16.0,
                ),
                description(),
                const TransparentDivider(
                  height: 16,
                ),
                inputUsername(),
                const TransparentDivider(
                  height: 8,
                ),
                inputPassword(),
                const TransparentDivider(
                  height: 16,
                ),
                inputConfirmPassword(),
                const TransparentDivider(
                  height: 16,
                ),
                genderSelectors(),
                const TransparentDivider(
                  height: 12,
                ),
                rememberMe(),
                const TransparentDivider(
                  height: 12,
                ),
                registerButton(),
                const TransparentDivider(
                  height: 24,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: [
                    signInFacebookButton(),
                    signInGoogleButton(),
                    signInAppleButton(),
                  ],
                ),
                signInButton(),
                const Spacer(),
              ],
            )));
  }

  @override
  Widget description() {
    return PaddingText(MyText.signupDescription,
        padding: const EdgeInsets.symmetric(vertical: 0.0),
        style:bigTitleStyle(size: 28),
        textAlign: TextAlign.center);
  }


  @override
  Widget inputPassword() {
    return Obx(() => inputBox(controller.context, controller.passwordController,
        icon: Icons.lock, hint: MyText.password,isPassword: true,hasError: controller.passwordHasError.value,errorMessage: "password got to more than 8 character"));
  }

  @override
  Widget inputUsername() {
    return Obx(() => inputBox(controller.context, controller.emailController,
        icon: Icons.mail, hint: MyText.username,hasError: controller.emailHasError.value,errorMessage: "email is incorrect"));
  }

  @override
  Widget inputConfirmPassword() {
    return Obx(() => inputBox(controller.context, controller.confirmPasswordController,
        icon: Icons.lock, hint: MyText.confirmPassword,isPassword:true,hasError: controller.confirmPasswordHasError.value,errorMessage: "not match to password"));
  }

  @override
  Widget rememberMe() {
    return Obx(() => MyCheckBox(changeController: controller.rememberMeController,title: MyText.rememberMe.value));
  }

  @override
  Widget registerButton() {
    return Obx(() => Button(
        onPressed: () {
          controller.register();
        },
        text: MyText.signupButton,
      loading: controller.loading.value,
    ));
  }

  @override
  Widget signInButton() {
    return Center(child:spannableText(MyText.alreadyHaveAccount,MyText.signin,()=>{}));
  }

  @override
  Widget signInAppleButton() {
    return ButtonIcon(
      onPressed: () {
        controller.signinApple();
      },
      icon: Icons.apple,
      iconColor: appleColor,
    );
  }

  @override
  Widget signInFacebookButton() {
    return ButtonIcon(
      onPressed: () {
        controller.signinFacebook();
      },
      icon: Icons.facebook,
      iconColor: facebookColor,
    );
  }

  @override
  Widget signInGoogleButton() {
    return ButtonIcon(
      onPressed: () {
        controller.signinGoogle();
      },
      imagePath: "assets/icons/google.png",
    );
  }

  @override
  Widget image() {
    return    CircleAvatar(
      radius: 120, // Image radius
      backgroundImage:AssetImage((Res.logo)
      ),);

  }


    @override
    Widget divider() {
      return TextDivider(text: MyText.orContinueWith,);
    }

  @override
  Widget genderSelectors() {
    List<DropdownMenuItem<String>> menuItems = [
      const DropdownMenuItem(value: "MALE", child: Text("Male")),
      const DropdownMenuItem(value: "FEMALE", child: Text("Female")),
    ];
   return dropdown(menuItems,controller.onChangedGender,controller.genderController);
  }

}
