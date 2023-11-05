
import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';
import '../../../model/response/loginModel.dart';
import '../../../model/response/response.dart';
import '../../../model/response/token.dart';
import '../../../model/response/user.dart';
import '../../../utils/log.dart';
import '../../../utils/route.dart';
import '../authController.dart';
import 'interfaces/signinControllerInterface.dart';

class SignInController extends AuthController
    implements SignInControllerInterface {
  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();

  RxBool emailHasError = false.obs;
  RxBool passwordHasError = false.obs;

  RxBool emailErrorMessage = false.obs;
  RxBool passwordErrorMessage = false.obs;

  RxBool rememberMeController = false.obs;
  RxBool loading = false.obs;

  @override
  void onInit() {
    super.onInit();
  }

  @override
  void dispose() {
    emailController.dispose();
    passwordController.dispose();
    super.dispose();
  }

  @override
  void forgetPassword() {
    //for widget test
    if (Get.testMode) testClickedForgotPassword = true;
  }

  @override
  void signin() {
    if (Get.testMode) testClickedSignin = true;
    if (!inputValidator()) return;
    loading.value = true;
    userRepository.login(
        email: emailController.text,
        password: passwordController.text,
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
  void register() {
    if (Get.testMode) testClickedRegister = true;
  }

  @override
  bool inputValidator() {
    var isValidEmail =  emailValidator();
    var isValidPassword =  passwordValidator();
    return isValidEmail && isValidPassword;
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
  void gotoMain() {
    Get.offAllNamed(MyRoute.mainRoute);
  }
  ////////////////////////////////testing variable///////////////////
  bool testClickedForgotPassword = false;
  bool testClickedSignin = false;
  bool testClickedRegister = false;
  bool testClickedSigninGoogle = false;
  bool testClickedSigninFacebook = false;
  bool testClickedSigninApple = false;


////////////////////////////////testing variable///////////////////
}
