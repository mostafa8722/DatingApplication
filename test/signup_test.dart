// This is a basic Flutter widget test.
//
// To perform an interaction with a widget in your test, use the WidgetTester
// utility in the flutter_test package. For example, you can send tap and scroll
// gestures. You can also use WidgetTester to find child widgets in the widget
// tree, read text, and verify that the values of widget properties are correct.
import 'package:dating_application/screens/authentication/signin/signinBinding.dart';
import 'package:dating_application/screens/authentication/signin/signinController.dart';
import 'package:dating_application/screens/authentication/signin/signinView.dart';
import 'package:dating_application/screens/authentication/signup/signupController.dart';
import 'package:dating_application/utils/translations.dart';
import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:mockito/mockito.dart';

class MockBuildContext extends Mock implements BuildContext {}

void main() {
  MockBuildContext mockContext;
  setUp(() {
    mockContext = MockBuildContext();
  });
  // testWidgets('Signin widget test', (WidgetTester tester) async {
  //   Get.testMode = true;
  //   await tester.pumpWidget(
  //       GetMaterialApp(
  //         initialBinding: SignInBinding(),
  //         translations: MyTranslations(),
  //         home: const SignInView(),
  //       )
  //   );
  //   SignInController controller = Get.find();
  //
  //   await tester.tap(find.text(MyText.forgotPassword));
  //   await tester.tap(find.text(MyText.signinButton));
  //   await tester.tap(find.text(MyText.dontHaveAccount));
  //   await tester.tap(find.text(MyText.signinGoogle));
  //   await tester.tap(find.text(MyText.signinFacebook));
  //   await tester.tap(find.text(MyText.signinApple));
  //   await tester.pump();
  //
  //   expect(controller.testClickedForgotPassword, true);
  //   expect(controller.testClickedRegister, true);
  //   expect(controller.testClickedSignin, true);
  //   expect(controller.testClickedSigninGoogle, true);
  //   expect(controller.testClickedSigninFacebook, true);
  //   expect(controller.testClickedSigninApple, true);
  // });

  group('Signup Controller test', () {
    final controller = SignUpController();



    test('username controller testing', () {
      controller.emailController.text = "name1";
      expect(controller.emailController.text, 'name1');
      expect(controller.emailController.text,isNot("name"));
    });

    test('password controller testing', () {
      controller.passwordController.text = "password";
      expect(controller.passwordController.text,"password");
      expect(controller.passwordController.text,isNot("passwor"));
    });

    test('confirm password controller testing', () {
      controller.confirmPasswordController.text = "password";
      expect(controller.confirmPasswordController.text,"password");
      expect(controller.confirmPasswordController.text,isNot("passwor"));
    });

    test('password controller testing', () {
      controller.identificationCodeController.text = "password1";
      expect(controller.identificationCodeController.text,"password1");
      expect(controller.identificationCodeController.text,isNot("password"));
    });

    test('user name validator testing', () {
      controller.emailController.text = "a";
      expect(controller.usernameValidator(),false);

      controller.emailController.text = "abcdef";//length is 6
      expect(controller.usernameValidator(),true);
    });

    test('password validator testing', () {
      controller.passwordController.text = "a";
      expect(controller.passwordValidator(),false);

      controller.passwordController.text = "abcdefgh";//length is 8
      expect(controller.passwordValidator(),true);
    });

    test('confirm password validator testing', () {
      controller.confirmPasswordController.text = "a";
      expect(controller.confirmPasswordValidator(),false);

      controller.passwordController.text = "abcdefgh";
      controller.confirmPasswordController.text = "abcdefgh";//length is 8
      expect(controller.confirmPasswordValidator(),true);
    });

    test('identification code validator testing', () {
      controller.identificationCodeController.text = "a";
      expect(controller.identificationCodeValidator(),false);

      controller.identificationCodeController.text = "abcdefgh";//length is 8
      expect(controller.identificationCodeValidator(),true);
    });

    test('validator testing', () {
      controller.emailController.text = "a";

      expect(controller.inputValidator(),false);

      controller.emailController.text = "abcdef";//length is 6
      controller.passwordController.text = "abcdefgh";//length is 8
      controller.confirmPasswordController.text = "abcdefgh";//length is 8
      controller.identificationCodeController.text = "abcdefgh";//length is 8
      expect(controller.inputValidator(),true);
    });
  });
}
