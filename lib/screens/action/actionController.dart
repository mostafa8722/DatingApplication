import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_state_manager/src/rx_flutter/rx_ticket_provider_mixin.dart';
import '../../../base/baseController.dart';

class ActionController extends BaseController  with GetSingleTickerProviderStateMixin{
  late final TabController tabController;
  RxString searchText = "".obs;
  @override
  void onInit() async {
    tabController = TabController(length: 6, vsync: this);
    super.onInit();
  }

  @override
  void dispose() {
    tabController.dispose();
    super.dispose();
  }

  onSearch(String text){
    searchText.value = text;
  }
}