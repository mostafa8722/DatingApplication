
import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';
import 'package:google_sign_in/google_sign_in.dart';

import '../../../utils/route.dart';
import '../authController.dart';
import '../signin/interfaces/signinControllerInterface.dart';

class SignInSocialController extends AuthController implements SignInControllerInterface{
  TextEditingController usernameController = TextEditingController();
  TextEditingController passwordController = TextEditingController();

  @override
  void onInit() {
    super.onInit();
  }

  @override
  void dispose() {
    usernameController.dispose();
    passwordController.dispose();
    super.dispose();
  }

  @override
  void forgetPassword() {
    //for widget test
    if(Get.testMode) testClickedForgotPassword = true;
  }

  @override
  void signin() {
    //for widget test
    if(Get.testMode) testClickedSignin = true;
    Get.toNamed(MyRoute.signinRoute);
  }

  @override
  void register() {
    //for widget test
    if(Get.testMode) testClickedRegister = true;
    Get.toNamed(MyRoute.signinSocialRoute);
  }

  @override
  bool inputValidator() {
    return emailValidator() && passwordValidator();
  }

  @override
  bool emailValidator() {
    return usernameController.text.length >= 6;
  }

  @override
  bool passwordValidator() {
    return usernameController.text.length >= 8;
  }

  @override
  void gotoMain() {

  }

  ////////////////////////////////testing variable///////////////////
  bool testClickedForgotPassword = false;
  bool testClickedSignin = false;
  bool testClickedRegister = false;
  ////////////////////////////////testing variable///////////////////
}