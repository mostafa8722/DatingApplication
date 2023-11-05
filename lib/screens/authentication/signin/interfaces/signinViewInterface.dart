import 'package:flutter/cupertino.dart';

import '../../authViewInterface.dart';

abstract class SignInViewInterface extends AuthViewInterface{
  Widget image();
  Widget description();
  Widget inputUsername();
  Widget inputPassword();
  Widget forgotPasswordButton();
  Widget rememberMe();
  Widget signInButton();
  Widget registerButton();
  Widget divider();
}