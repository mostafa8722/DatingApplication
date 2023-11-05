
import 'package:Lover369/base/baseController.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../model/argument/chatArguments.dart';
import '../../../model/response/signlePeople.dart';
import '../../../repositories/peopleRepository.dart';
import '../../../utils/log.dart';
import '../../../utils/route.dart';
import 'interfaces/selectedMapUserControllerInterface.dart';

class SelectedMapUserController extends BaseController with GetTickerProviderStateMixin implements  SelectedMapUserControllerInterface{
  final PeopleRepository _peopleRepository = PeopleRepository();
  Rxn<SinglePeople>  singlePeople = Rxn<SinglePeople>(null);

  @override
  void onInit() {
    initializeData();
    super.onInit();
  }

  @override
  void initializeData() {
    singlePeople.value = Get.arguments["data"];
  }

  @override
  AnimationController animationController() {
    return AnimationController(
      duration: const Duration(milliseconds: 2500),
      vsync: this,
    );
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
          printLog(data);
        },
        failure: (error) {
          printLog("error #h3:");
          printLog(error);
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