import 'package:flutter/cupertino.dart';

import '../../authViewInterface.dart';
abstract class SignInSocialViewInterface extends AuthViewInterface{
  Widget image();
  Widget title();
  Widget divider();
  Widget signInButton();
  Widget signUpButton();
}