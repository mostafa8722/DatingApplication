import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:get/get.dart';
import '../storage/appStorage.dart';

class BaseController extends GetxController{
  late AppStorage appStorage;
  late FToast fToast;
  late BuildContext context;

  initContext(BuildContext context){
    this.context = context;
    fToast = FToast().init(context);
  }

  @override
  void onInit() {
    appStorage = AppStorage();
    super.onInit();
  }
}