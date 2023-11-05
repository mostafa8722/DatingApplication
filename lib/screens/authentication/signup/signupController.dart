
import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';
import 'package:google_sign_in/google_sign_in.dart';

import '../../../model/response/loginModel.dart';
import '../../../model/response/response.dart';
import '../../../model/response/token.dart';
import '../../../model/response/user.dart';
import '../../../utils/log.dart';
import '../../../utils/route.dart';
import '../authController.dart';
import 'interfaces/signupControllerInterface.dart';

class SignUpController extends AuthController implements SignUpControllerInterface{
  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();
  TextEditingController confirmPasswordController = TextEditingController();
  String genderController = "MALE";

  RxBool rememberMeController = false.obs;
  RxBool loading = false.obs;

  RxBool emailHasError = false.obs;
  RxBool passwordHasError = false.obs;
  RxBool confirmPasswordHasError = false.obs;

  RxBool emailErrorMessage = false.obs;
  RxBool passwordErrorMessage = false.obs;
  RxBool confirmPasswordErrorMessage = false.obs;

  @override
  void dispose() {
    emailController.dispose();
    passwordController.dispose();
    confirmPasswordController.dispose();
    super.dispose();
  }

  @override
  bool inputValidator() {
    return emailValidator() && passwordValidator() && confirmPasswordValidator();
  }

  @override
  bool emailValidator() {
    var isValid = emailController.text.isEmail;
    emailHasError.value = !isValid;
    return isValid;
  }

  @override
  bool passwordValidator() {
    var isValid = passwordController.text.length >= 8;
    passwordHasError.value = !isValid;
    return isValid;
  }

  @override
  bool confirmPasswordValidator() {
    var isValid = confirmPasswordController.text.length >= 8 && passwordController.text == confirmPasswordController.text;
    confirmPasswordHasError.value = !isValid;
    return isValid;
  }


  @override
  void onChangedGender(String? gender) {
    if(gender != null) {
      gender = gender;
    }
  }

  @override
  void register() {
    if (Get.testMode) testClickedSignin = true;
    if (!inputValidator()) return;
    loading.value = true;
    userRepository.register(
        email: emailController.text,
        password: passwordController.text,
        passwordConfirmation: confirmPasswordController.text,
        gender: genderController,
        success: (data) {
          loading.value = false;
          printLog(data);
          var responseModel = responseFromJson(data.toString());
          var loginModel = LoginModel.fromJson(responseModel.data);
          try{
            User? userModel = loginModel.user;
            userRepository.saveInformation(user: userModel);
          }catch(_){}

          try{
            Token? tokenModel = loginModel.token;
            userRepository.saveToken(token: tokenModel);
            gotoMain();
          }catch(_){
            printLog("error #1:");
            printLog(_);
          }
        },
        failure: (error) {
          printLog(error);
          loading.value = false;
        });
  }

  @override
  void signin() {
    // TODO: implement signin
  }

  @override
  void gotoMain() {
    Get.offAllNamed(MyRoute.mainRoute);
  }

  ////////////////////////////////testing variable///////////////////
  bool testClickedForgotPassword = false;
  bool testClickedSignin = false;
  bool testClickedRegister = false;
  ////////////////////////////////testing variable///////////////////
}