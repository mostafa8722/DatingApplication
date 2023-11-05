import '../../authInterface.dart';

abstract class SignUpControllerInterface{
  void signin();
  void register();
  bool inputValidator();
  bool emailValidator();
  bool passwordValidator();
  bool confirmPasswordValidator();
  void onChangedGender(String? gender);
  void gotoMain();
}