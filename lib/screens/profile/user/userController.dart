import 'package:carousel_slider/carousel_controller.dart';

import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../base/baseController.dart';
import '../../../model/argument/chatArguments.dart';
import '../../../model/response/gallery.dart';
import '../../../model/response/interests.dart';
import '../../../model/response/signlePeople.dart';
import '../../../repositories/contactRepository.dart';
import '../../../repositories/peopleRepository.dart';
import '../../../utils/enums.dart';
import '../../../utils/log.dart';
import '../../../utils/route.dart';
import 'interfaces/userControllerInterface.dart';

class UserController extends BaseController implements UserControllerInterface{
  final PeopleRepository _peopleRepository = PeopleRepository();
  final ContactRepository _contactRepository = ContactRepository();
  PageController pagerController = PageController(initialPage: 0);
  CarouselController carouselController = CarouselController();
  var viewMode = UserViewMode.show.obs;
  SinglePeople? singlePeople;

  RxString distance = "".obs;
  RxString name = "".obs;
  RxString about = "".obs;
  RxString birthday = "".obs;
  RxBool isOnline = false.obs;
  RxString category = "".obs;
  RxString banner = "".obs;
  RxString profile = "".obs;
  RxString status = "".obs;
  RxList<String> bestPhotos = <String>[].obs;
  RxList<String> sliderPhotos = <String>[].obs;
  RxList<Interests> interests = <Interests>[].obs;

  @override
  void onInit() {
    initializeData();
    super.onInit();
  }

  @override
  void dispose() {
    pagerController.dispose();
    super.dispose();
  }

  @override
  void initializeData() {
    singlePeople = Get.arguments["data"];
    viewMode.value = singlePeople is SinglePeople ? UserViewMode.show:UserViewMode.editable;
    if(singlePeople is SinglePeople){
      distance.value = "15";
      banner.value = singlePeople!.target!.banner.toString();
      name.value = singlePeople!.target!.fullName.toString();
      profile.value = singlePeople!.target!.profile.toString();
      about.value = singlePeople!.target!.description.toString();
      birthday.value = singlePeople!.target!.birthDay.toString();
      category.value ="Model";//todo
      status.value = "Sagitarius";//todo
      initializeSlider(singlePeople!.target!.gallery!);
      initializeBestPhotos(singlePeople!.target!.gallery!);
      initializeInterests(singlePeople!.target!.interests!);
    }
  }

  @override
  void gotoChat() {
    Get.toNamed(MyRoute.chatRoute,arguments: {"data":ChatArguments.fromSinglePeople(singlePeople!)});
  }

  @override
  void gotoEmail() {
    // TODO: implement gotoEmail
  }

  @override
  void initializeBestPhotos(List<Gallery> list) {
    bestPhotos.value = list.map((e) => e.path!).toList();
    bestPhotos.insert(0, "");
  }

  @override
  void initializeInterests(List<Interests> list) {
   interests.value = list;
  }

  @override
  void initializeSlider(List<Gallery> gallery) {
    sliderPhotos.value = gallery.map((e) => e.path!).toList();
  }

  @override
  void gotoCall() {
    ChatArguments chatArguments = ChatArguments.fromSinglePeople(singlePeople!);
    Get.toNamed(MyRoute.callRoute,arguments: {"data":chatArguments,"type":'voice'});
  }

  @override
  void addToContact() {
    Map<String,dynamic> body = {
      "target_id":singlePeople!.target!.id!
    };
    _contactRepository.sendRequest(
        body: body,
        success: (data) {
          printLog(data);
        },
        failure: (error) {
          printLog("error #h3:");
        });
  }

  @override
  void block() {
    Map<String,dynamic> body = {
      "target_id":singlePeople!.target!.id!
    };
    _peopleRepository.block(
        body: body,
        success: (data) {
          printLog(data);
        },
        failure: (error) {
          printLog("error #h3:");
        });
  }

  @override
  void like() {
    _peopleRepository.like(
        id:singlePeople!.target!.id!,
        success: (data) {
          printLog(data);
        },
        failure: (error) {
          printLog("error #h3:");
        });
  }


}