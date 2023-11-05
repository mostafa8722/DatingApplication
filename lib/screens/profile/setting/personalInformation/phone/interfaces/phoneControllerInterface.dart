import 'package:intl_phone_field/phone_number.dart';

abstract class PhoneControllerInterface{
  void initializeData();
  void onChangedPhone(PhoneNumber phoneNumber);
  void submit();
  void showVerifyDialog();
}