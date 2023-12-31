
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:sizer/sizer.dart';

import '../../../utils/res.dart';
import '../../../utils/route.dart';
import '../../../utils/theme/colors.dart';
import '../../../utils/theme/texts.dart';
import '../../../utils/translations.dart';
import '../../../widgets/button.dart';
import '../../../widgets/checkbox.dart';
import '../../../widgets/divider.dart';
import '../../../widgets/inputs.dart';
import '../../../widgets/spannable.dart';
import '../../../widgets/text.dart';
import 'interfaces/signinViewInterface.dart';
import 'signinController.dart';

class SignInView extends GetView<SignInController> implements SignInViewInterface {
  const SignInView({super.key});

  @override
  Widget build(BuildContext context) {
    controller.initContext(context);
    return Scaffold(
      backgroundColor: Get.theme.backgroundColor,
      resizeToAvoidBottomInset: true,
      body: !Get.testMode ? mobileBody() : SizerUtil.deviceType ==
          DeviceType.tablet
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
        body:
        Padding(
        padding: EdgeInsets.symmetric(vertical: 20.0,horizontal: 36.0),
        child:
    SingleChildScrollView(
    child:
    Column(
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
          height: 12,
        ),
        // rememberMe(),
        // const TransparentDivider(
        //   height: 2,
        // ),
        signInButton(),
        const TransparentDivider(
          height: 16,
        ),
        forgotPasswordButton(),
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
        registerButton(),
        const TransparentDivider(
          height: 32,
        ),
      ],
    )),
    )
    );
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
                  height: 4,
                ),
                // rememberMe(),
                const TransparentDivider(
                  height: 12,
                ),
                signInButton(),
                const TransparentDivider(
                  height: 12,
                ),
                forgotPasswordButton(),
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
                registerButton(),
                const Spacer(),
              ],
            )));
  }

  @override
  Widget description() {
    return PaddingText(MyText.signinDescription,
        padding: const EdgeInsets.symmetric(vertical: 0.0),
        style:bigTitleStyle(size: 28),
        textAlign: TextAlign.center);
  }

  @override
  Widget forgotPasswordButton() {
    return GestureDetector(
      onTap: (){
        controller.forgetPassword();
      },
    child:SizedBox(
        width: MediaQuery.of(controller.context).size.width,
        child: PaddingText(MyText.forgotPassword,
            padding: const EdgeInsets.symmetric(vertical: 2.0),
            style: normalTextStyle(color: primaryColor),
            textAlign: TextAlign.center)));
  }

  @override
  Widget inputPassword() {
    return Obx(() =>  inputBox(controller.context, controller.passwordController,
        icon: Icons.lock, hint: MyText.password,isPassword: true,hasError: controller.passwordHasError.value));
  }

  @override
  Widget inputUsername() {
    return Obx(() => inputBox(controller.context, controller.emailController,
        icon: Icons.email, hint: MyText.username,hasError: controller.emailHasError.value));
  }

  @override
  Widget registerButton() {
    return Center(
      child: spannableText(MyText.dontHaveAccount,MyText.signup,(){
      Get.toNamed(MyRoute.signupRoute);
    }));
  }

  @override
  Widget signInButton() {
    return Obx(() => Button(
        onPressed: () {
          controller.signin();
        },
        text: MyText.signinButton,
      loading: controller.loading.value,
    ));
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
  Widget rememberMe() {
    return Obx(() => MyCheckBox(changeController: controller.rememberMeController,title: MyText.rememberMe.value,));
  }

}
