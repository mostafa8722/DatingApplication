
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../base/baseController.dart';
import '../../../model/response/package.dart';
import '../../../model/response/response.dart';
import '../../../repositories/appRepository.dart';
import '../../../utils/log.dart';
import '../../../utils/route.dart';
import 'interfaces/packageControllerInterface.dart';

class PackageController extends BaseController implements PackageControllerInterface{
  final AppRepository _appRepository = AppRepository();
  var packages = <Package>[].obs;
  RxBool loading = false.obs;

  @override
  void onInit() {
    getData();
    super.onInit();
  }

  @override
  void getData() {
    loading.value = true;
    _appRepository.getPackages(
        success: (data) {
          loading.value = false;
          printLog(data);
          var responseModel = responseFromJson(data.toString());
          packages.value = (responseModel.data as List).map((item) => Package.fromJson(item)).toList();
        },
        failure: (error) {
          printLog("error #h1:");
          printLog(error);
          loading.value = false;
        });
  }


}