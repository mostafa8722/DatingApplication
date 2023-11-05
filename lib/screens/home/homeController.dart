
import 'package:Lover369/base/baseController.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../appControler.dart';
import '../../model/argument/chatArguments.dart';
import '../../model/response/response.dart';
import '../../model/response/signlePeople.dart';
import '../../repositories/peopleRepository.dart';
import '../../utils/debouncer.dart';
import '../../utils/log.dart';
import '../../utils/route.dart';
import 'intrfaces/homeControllerInterface.dart';

class HomeController extends BaseController  with GetTickerProviderStateMixin implements HomeControllerInterface  {
  final PeopleRepository _peopleRepository = PeopleRepository();
  final appController  = Get.find<AppController>();

  TextEditingController searchController = TextEditingController();

  var peoples = <SinglePeople>[].obs;
  var searchedPeoples = <SinglePeople>[].obs;
  RxBool loading = false.obs;
  RxBool showSearchList = false.obs;
  final debouncer = Debouncer(milliseconds: 1000);

  @override
  void onInit() {
    searchController.addListener(() {
      showSearchList.value = searchController.text.isNotEmpty;
      search();
    });
    getDate();
    super.onInit();
  }

  @override
  void dispose() {
    searchController.dispose();
    super.dispose();
  }

  @override
  AnimationController animationController() {
    return AnimationController(
      duration: const Duration(milliseconds: 2500),
      vsync: this,
    );
  }

  @override
  void getDate() {
    loading.value = true;
    Map<String,dynamic>  body= {
      "col":"created_at",
      "orderType":"desc",
    };
    _peopleRepository.index(
        body: body,
        success: (data) {
          loading.value = false;
          printLog(data);
          var responseModel = responseFromJson(data.toString());
          peoples.value = (responseModel.data as List).map((item) => SinglePeople.fromJson(item)).toList();
        },
        failure: (error) {
          printLog("error #h1:");
          printLog(error);
          loading.value = false;
        });
  }


  search() {
    loading.value = true;
    Map<String,dynamic>  body= {
      "col":"created_at",
      "orderType":"desc",
      "full_name":searchController.text
    };
    _peopleRepository.index(
        body: body,
        success: (data) {
          loading.value = false;
          printLog(data);
          var responseModel = responseFromJson(data.toString());
          searchedPeoples.value = (responseModel.data as List).map((item) => SinglePeople.fromJson(item)).toList();
        },
        failure: (error) {
          printLog("error #h1:");
          printLog(error);
          loading.value = false;
        });
  }

  @override
  void chat(SinglePeople singlePeople) {
    Get.toNamed(MyRoute.chatRoute,
        arguments: {"data": ChatArguments.fromSinglePeople(singlePeople)});
  }

  @override
  void like(SinglePeople singlePeople) {
    _peopleRepository.like(
        id:singlePeople.target!.id!,
        success: (data) {
          loading.value = false;
          printLog(data);
        },
        failure: (error) {
          printLog("error #h3:");
          printLog(error);
          loading.value = false;
        });
  }

  @override
  void showSingle(SinglePeople singlePeople) {
    Get.toNamed(MyRoute.userProfileRoute,arguments: {"data":singlePeople});
  }

  @override
  void call(SinglePeople singlePeople) {
    ChatArguments chatArguments = ChatArguments.fromSinglePeople(singlePeople);
    Get.toNamed(MyRoute.callRoute,arguments: {"data":chatArguments,"type":'voice'});
  }
}