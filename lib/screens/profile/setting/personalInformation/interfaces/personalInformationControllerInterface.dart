import 'package:intl_phone_field/phone_number.dart';

abstract class PersonalInformationControllerInterface{
  void initializeData();
  void initializeBirthDateListener();
  void onSelectionBirthDate(DateTime dateTime);
  void onChangedPhone(PhoneNumber phoneNumber);
  void onChangedGender(String? gender);
  void submit();
  void onClickEmail();
  void onClickPhone();
}