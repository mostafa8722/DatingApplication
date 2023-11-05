
import 'package:get/get.dart';

import '../../../base/baseController.dart';
import '../../../model/argument/chatArguments.dart';
import '../../../model/response/response.dart';
import '../../../model/response/signlePeople.dart';
import '../../../model/response/user.dart';
import '../../../model/response/whoSeenProfile.dart';
import '../../../repositories/peopleRepository.dart';
import '../../../utils/log.dart';
import '../../../utils/route.dart';
import '../actionController.dart';
import 'interfaces/seenProfileControllerInterface.dart';


class SeenProfileController extends BaseController implements SeenProfileControllerInterface{
  final PeopleRepository _peopleRepository = PeopleRepository();
  final ActionController actionController = Get.find();
  var list = <SinglePeople>[].obs;
  var filterList = <SinglePeople>[].obs;
  RxBool loading = false.obs;

  @override
  void onInit() {
    ever(actionController.searchText, (search) => filterList.value = list.where((element) => element.target!.fullName.toString().contains(search)).toList());
    getData();
    super.onInit();
  }

  @override
  void getData() {
    loading.value = true;
    _peopleRepository.whoSeenMyProfile(
        success: (data) {
          loading.value = false;
          printLog(data);
          var responseModel = responseFromJson(data.toString());
          var actionCountModel = ActionCount.fromJson(responseModel.data);
          list.value = (actionCountModel.data as List).map((item) => SinglePeople.fromJson(item)).toList();
        },
        failure: (error) {
          printLog("error #h1:");
          printLog(error);
          loading.value = false;
        });
  }

  @override
  void onClickAction(int id) {
    // _peopleRepository.unlike(
    //     id: id,
    //     success: (data) {
    //       var responseModel = responseFromJson(data.toString());
    //     },
    //     failure: (error) {
    //       printLog("error #uf1:");
    //       printLog(error);
    //     });
  }

  @override
  void onClickItem(User user) {
    Get.toNamed(MyRoute.chatRoute,
        arguments: {"data": ChatArguments.fromUser(user)});
  }

}