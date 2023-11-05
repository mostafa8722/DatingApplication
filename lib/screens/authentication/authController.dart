
import 'package:get/get.dart';
import 'package:google_sign_in/google_sign_in.dart';

import '../../base/baseController.dart';
import '../../repositories/userRepository.dart';
import 'authInterface.dart';

class AuthController extends BaseController implements AuthInterface {
  UserRepository userRepository = UserRepository();
  final GoogleSignIn _googleSignIn = GoogleSignIn(
      clientId:
          "282575506652-s6oq1dfk80mj77h3arp582iutgs4tmh4.apps.googleusercontent.com");

  @override
  void onInit() {
    _googleSignIn.signOut();
    super.onInit();
  }

  @override
  void signinApple() {
    //for widget test
    if (Get.testMode) testClickedSigninApple = true;
  }

  @override
  void signinFacebook() {
    //for widget test
    if (Get.testMode) testClickedSigninFacebook = true;
  }

  @override
  void signinGoogle() async {
    //for widget test
    if (Get.testMode) testClickedSigninGoogle = true;

    _googleSignIn.signIn().then((signin) {
      // print("goooogle:::${signin}");
      signin?.authentication.then((auth) {
        print(auth.accessToken);
        print(auth.idToken);
      }).onError((error, stackTrace) {
        print("google auth error:::${error}");
      });
    }).onError((error, stackTrace) {
      print("err:::${error}");
    });
  }

  ////////////////////////////////testing variable///////////////////
  bool testClickedSigninGoogle = false;
  bool testClickedSigninFacebook = false;
  bool testClickedSigninApple = false;
////////////////////////////////testing variable///////////////////
}
