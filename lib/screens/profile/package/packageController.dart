
import 'dart:convert';

import 'package:Lover369/appControler.dart';
import 'package:Lover369/model/response/gateways.dart';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:url_launcher/url_launcher.dart';

import '../../../base/baseController.dart';
import '../../../model/response/package.dart';
import '../../../model/response/response.dart';
import '../../../repositories/appRepository.dart';
import 'interfaces/packageControllerInterface.dart';

class PackageController extends BaseController implements PackageControllerInterface{
  final AppRepository _appRepository = AppRepository();
  TextEditingController discountController = TextEditingController();
  var packages = <Package>[].obs;
  var gateways = <Gateways>[].obs;
  RxBool loading = true.obs;
  RxBool loadingDiscountCode = false.obs;
  RxBool loadingPay = false.obs;
  var gateway = "1".obs;
  RxBool showInternetConnection = false.obs;
  AppController appController = Get.find();
  RxBool discountHasError = false.obs;
  RxString errorMessage = "".obs;
  RxString package_id = "0".obs;
  RxString package_price = "0".obs;
  @override
  void onInit() {
    getData();
    super.onInit();



  }

  @override
  void getData() {

    _appRepository.getPackages(
        success: (data) {
          loading.value = false;

          print(data);
          var responseModel = responseFromJson(data.toString());
          packages.value = (responseModel.data as List).map((item) => Package.fromJson(item)).toList();
        },
        failure: (error) {

          loading.value = false;
        });


   gateways.value = appController.initialize.value!.gateways!;

  }

  void checkCode() {
    loadingDiscountCode.value = true;
    _appRepository.sendDiscountCode(
        package_id: package_id.value,
        code: discountController.text,
        success: (data) {
          loadingDiscountCode.value = false;

          var responseModel = responseFromJson(data.toString());
         // packages.value = (responseModel.data as List).map((item) => Package.fromJson(item)).toList();

         discountValidator(true,"");
        },
        failure: (error) {

         // print(json.decode(error.response.toString()));

          loadingDiscountCode.value = false;
          discountValidator(false,json.decode(error.response.toString())["message"]);
        });




  }

  void buyPay() {
    loadingPay.value = true;
    print(  gateway.value);
    _appRepository.buyPackage(
        package_id: package_id.value,
        code: discountController.text,
        gateway_id: gateway.value,
        success: (data) async {
          loadingPay.value = false;

          var response = json.decode(data.toString());

          print(response["data"]["url"]);
          // packages.value = (responseModel.data as List).map((item) => Package.fromJson(item)).toList();
          final Uri url = Uri.parse(response["data"]["url"]);
          if (!await launchUrl(url)) {
          throw Exception('Could not launch $url');
          }
          discountValidator(true,"");
        },
        failure: (error) {





          print("errorww");
          print(error);
          print(error.response);
          loadingPay.value = false;

        });




  }

  void updatePackagePrice(String price){

    package_price.value = price;
  }
  void updatePackageId(String id){
    package_id.value = id;
  }
  @override
  void onChangedGateway(String?  id) {


    gateway.value = id!;

  }
  void discountValidator(isValid,message) {

    discountHasError.value = !isValid;
    errorMessage.value = message;

  }

}

