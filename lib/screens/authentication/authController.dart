
import 'package:flutter_facebook_auth/flutter_facebook_auth.dart';
import 'package:get/get.dart';
import 'package:google_sign_in/google_sign_in.dart';

import '../../base/baseController.dart';
import '../../repositories/userRepository.dart';
import 'authInterface.dart';
import 'package:flutter/material.dart';

class AuthController extends BaseController implements AuthInterface {
  UserRepository userRepository = UserRepository();
   FacebookAuth? _facebookAuth;
  static const  List<String> scopes = <String>[
    'email',
    'https://www.googleapis.com/auth/contacts.readonly',
  ];
  final GoogleSignIn _googleSignIn = GoogleSignIn(
    scopes: scopes,
      clientId: "543Q445W84.com.example.dating_application"

  );


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
  void signinFacebook() async{
    //for widget test
    if (Get.testMode) testClickedSigninFacebook = true;
    // print(
    //   "isWebSdkInitialized ${_facebookAuth.isWebSdkInitialized}",
    // );
    // print(
    //   "isAutoLogAppEventsEnabled ${await _facebookAuth.isAutoLogAppEventsEnabled}",
    // );

    try{
      // await FacebookAuth.instance.webAndDesktopInitialize(
      //   appId: "EAAWFReGpQ0QBO9s2EeCZA6lKjMNVd4Wnnh2x3Huj0xg5fHLPST2ZCZBwLp3Lt2w6090D6sf4AQ4uCx0hshJRHHjJANtioYv02YgCvfKTWwZAHZACZBHI0Dh486o0de8SCjCAKWTUSKzaffEHHOy0kgfsNZAnCuapASvyyYMRmCrsbdMhlDIApIyCMczfi38qZAZANz1G2xyRCviZCGmwP7owe2JBvq7fHUndmgZA55DY1QBiy6ydVDYRyxtflHX9JLkloAIRJZAr4wZDZD",
      //   cookie: true,
      //   xfbml: true,
      //   version: "v15.0",
      // );
      await FacebookAuth.instance.login(
          permissions: ["public_profile", "email"]
      ).then((value)  {
      print("value");
          print(value);
      });
    }
    catch(e){
      print("error");
      print(e);
    }
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
        ScaffoldMessenger.of(context).showSnackBar(SnackBar(
          content: Text("success"),
          duration: Duration(milliseconds: 2000),
        ));
      }).onError((error, stackTrace) {
        print("google auth error==?");
        print("google auth error:::${stackTrace}");
        print("google auth error:::${error}");
        ScaffoldMessenger.of(context).showSnackBar(SnackBar(
          content: Text("error 1"),
          duration: Duration(milliseconds: 2000),
        ));
      });
    }).onError((error, stackTrace) {
      print("google auth error:::${stackTrace}");
      print("err:::${error}");
      ScaffoldMessenger.of(context).showSnackBar(SnackBar(
        content: Text("error2222"),
        duration: Duration(milliseconds: 2000),
      ));
    });
  }

  ////////////////////////////////testing variable///////////////////
  bool testClickedSigninGoogle = false;
  bool testClickedSigninFacebook = false;
  bool testClickedSigninApple = false;
////////////////////////////////testing variable///////////////////
}
