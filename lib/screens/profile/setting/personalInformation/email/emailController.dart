
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../../../../appControler.dart';
import '../../../../../base/baseController.dart';
import '../../../../../model/response/response.dart';
import '../../../../../repositories/userRepository.dart';
import '../../../../../utils/log.dart';
import '../../../../../utils/toast.dart';
import 'interfaces/emailControllerInterface.dart';


class EmailController extends BaseController implements EmailControllerInterface{
  final UserRepository _userRepository = UserRepository();
  final appController = Get.find<AppController>();
  TextEditingController emailController  = TextEditingController();
  Rx<bool> loading = false.obs;
  RxBool verifyLoading = false.obs;

  @override
  void onInit() {
    initializeData();
    super.onInit();
  }

  @override
  void dispose() {
    emailController.dispose();
    super.dispose();
  }

  @override
  void initializeData() {
    emailController.text=appController.user.value!.email ?? "";
  }

  @override
  void submit() {
    loading.value = true;
    _userRepository.sendVerificationEmail(
      email:emailController.text,
        success: (data) {
          loading.value = false;
          printLog(data);
          var responseModel = responseFromJson(data.toString());
         if(responseModel.status!){
           toast(fToast,responseModel.message.toString(),type: ToastType.Success);
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

}