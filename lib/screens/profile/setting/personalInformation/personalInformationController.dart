
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';
import 'package:intl_phone_field/phone_number.dart';

import '../../../../appControler.dart';
import '../../../../base/baseController.dart';
import '../../../../model/response/response.dart';
import '../../../../model/response/user.dart';
import '../../../../repositories/userRepository.dart';
import '../../../../utils/log.dart';
import '../../../../utils/route.dart';
import 'interfaces/personalInformationControllerInterface.dart';


class PersonalInformationController extends BaseController implements PersonalInformationControllerInterface{
  final UserRepository _userRepository = UserRepository();
  final appController = Get.find<AppController>();
  TextEditingController firstNameController  = TextEditingController();
  TextEditingController lastNameController  = TextEditingController();
  TextEditingController emailController  = TextEditingController();
  TextEditingController phoneController  = TextEditingController();
  TextEditingController birthdateController  = TextEditingController();

  Rxn<DateTime> selectedDateTime = Rxn<DateTime>();
  String  completePhoneNumber = "";
  String  gender = "male";
  Rx<bool> loading = false.obs;

  @override
  void onInit() {
    initializeData();
    initializeBirthDateListener();
    super.onInit();
  }

  @override
  void dispose() {
    firstNameController.dispose();
    lastNameController.dispose();
    emailController.dispose();
    phoneController.dispose();
    birthdateController.dispose();
    super.dispose();
  }

  @override
  void initializeData() {
   firstNameController.text = appController.user.value!.firstName  ?? "";
   lastNameController.text = appController.user.value!.lastName ?? "";
   phoneController.text = appController.user.value!.phone ?? "";
   emailController.text = appController.user.value!.email ?? "";
   lastNameController.text = appController.user.value!.lastName ?? "";
   birthdateController.text = appController.user.value!.birthDay ?? "";
   gender = appController.user.value!.gender.toString();
  }

  @override
  void onSelectionBirthDate(DateTime dateTime) {

    birthdateController.text = dateTime.toString();
  }
  void onSelectionBirthDate2(String dateTime) {

    birthdateController.text = dateTime.toString();
  }
  @override
  void initializeBirthDateListener() {
    selectedDateTime.listen((dateTime) {
      if(dateTime != null) {
        final f = DateFormat('yyyy-MM-dd');
        birthdateController.text = f.format(dateTime);
        print(f.format(dateTime));
      }
    });
  }

  @override
  void onChangedPhone(PhoneNumber? phoneNumber) {
    if(phoneNumber != null) {
      completePhoneNumber = phoneNumber.completeNumber;
    }
  }

  @override
  void onChangedGender(String? gender) {
    if(gender != null) {
      this.gender = gender;
    }
  }

  @override
  void submit() {
    print("ttttttttt9999");
    loading.value = true;
    _userRepository.updateProfile(
        firstName: firstNameController.text ?? "",
        lastName: lastNameController.text ?? "",
        gender: gender.toUpperCase(),
        birthday: birthdateController.text,
        success: (data) {
          loading.value = false;
          printLog(data);
          var responseModel = responseFromJson(data.toString());
          var userModel = User.fromJson(responseModel.data);
          _userRepository.saveInformation(user: userModel);
          Get.back();
        },
        failure: (error) {
          loading.value = false;
          printLog(error.response);
        });
  }

  @override
  void onClickEmail() {
    Get.toNamed(MyRoute.settingPersonalEmail)?.then((value) {

    });
  }

  @override
  void onClickPhone() {
    Get.toNamed(MyRoute.settingPersonalPhone)?.then((value) {

    }).then((value) => initializeData());
  }



}