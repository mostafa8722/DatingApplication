import 'package:flutter/cupertino.dart';

import '../../authViewInterface.dart';
abstract class SignUpViewInterface extends AuthViewInterface{
  Widget image();
  Widget description();
  Widget inputUsername();
  Widget inputPassword();
  Widget inputConfirmPassword();
  Widget genderSelectors();
  Widget rememberMe();
  Widget signInButton();
  Widget registerButton();
  Widget divider();
}