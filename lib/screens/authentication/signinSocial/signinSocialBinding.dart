import 'package:Lover369/screens/authentication/signinSocial/signinSocialController.dart';
import 'package:get/get.dart';

class SignInSocialBinding extends Bindings{
  @override
  void dependencies() {
    Get.lazyPut(() => SignInSocialController());
  }
}