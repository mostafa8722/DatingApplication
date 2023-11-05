
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';
import 'package:intl_phone_field/phone_number.dart';

import '../../../../../appControler.dart';
import '../../../../../base/baseController.dart';
import '../../../../../model/response/response.dart';
import '../../../../../repositories/userRepository.dart';
import '../../../../../utils/log.dart';
import '../../../../../utils/toast.dart';
import '../../../../../widgets/verifyDialog.dart';
import 'interfaces/phoneControllerInterface.dart';


class PhoneController extends BaseController implements PhoneControllerInterface{
  final UserRepository _userRepository = UserRepository();
  final appController = Get.find<AppController>();
  String  completePhoneNumber = "";
  Rx<String>  initializeCode = "1".obs;
  TextEditingController phoneController  = TextEditingController();
  Rx<bool> loading = false.obs;
  RxBool verifyLoading = false.obs;

  @override
  void onInit() {
    initializeData();

    super.onInit();
  }

  @override
  void dispose() {
    phoneController.dispose();
    super.dispose();
  }

  @override
  void initializeData() {
    phoneController.text=appController.user.value!.phone ?? "";
    var length=phoneController.text.length;
    switch(length){
      case 11:
        initializeCode.value = phoneController.text.substring(0,1);
        phoneController.text = phoneController.text.substring(1);
        break;
      case 12:
        initializeCode.value = phoneController.text.substring(0,2);
        phoneController.text = phoneController.text.substring(2);
        break;
      case 13:
        initializeCode.value = phoneController.text.substring(0,3);
        phoneController.text = phoneController.text.substring(3);
        break;
    }
  }


  @override
  void onChangedPhone(PhoneNumber? phoneNumber) {
    if(phoneNumber != null) {
      printLog(phoneNumber.completeNumber);
      completePhoneNumber = phoneNumber.completeNumber;
    }
  }



  @override
  void submit() {
    loading.value = true;
    _userRepository.updateProfile(
      phone:completePhoneNumber.replaceAll("+", ""),
        success: (data) {
          loading.value = false;
          printLog(data);
          var responseModel = responseFromJson(data.toString());
         if(responseModel.status!){
           showVerifyDialog();

         }else{
           toast(fToast,responseModel.message.toString(),type: ToastType.Warning);
         }
        },
        failure: (error) {
          loading.value = false;
          printLog(error.response);
          try{
            var responseModel = responseFromJson(error.response.toString());
            if(!responseModel.status!){
              toast(fToast,responseModel.message.toString(),type: ToastType.Warning);
            }
          }catch(_){}

        });
  }

  @override
  void showVerifyDialog() {
    verifyDialog(context,verifyLoading,onClick: (code){
      verifyLoading.value =true;
      _userRepository.verifyPhone(
          code: code,
          success: (data) {
            verifyLoading.value = false;
            printLog(data);
            var responseModel = responseFromJson(data.toString());
            if(responseModel.status!){
              toast(fToast,responseModel.message.toString(),type: ToastType.Success);
              appController.getMe();
              Get.back(canPop: false);
            }else{
              toast(fToast,responseModel.message.toString(),type: ToastType.Warning);
            }
          },
          failure: (error) {
            verifyLoading.value = false;
            printLog(error.response);
            try{
              var responseModel = responseFromJson(error.response.toString());
              if(!responseModel.status!){
                toast(fToast,responseModel.message.toString(),type: ToastType.Warning);
              }
            }catch(_){}

          });
    });
  }

}