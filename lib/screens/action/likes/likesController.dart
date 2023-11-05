
import 'package:get/get.dart';

import '../../../base/baseController.dart';
import '../../../model/argument/chatArguments.dart';
import '../../../model/response/response.dart';
import '../../../model/response/signlePeople.dart';
import '../../../model/response/user.dart';
import '../../../repositories/peopleRepository.dart';
import '../../../utils/log.dart';
import '../../../utils/route.dart';
import '../actionController.dart';
import 'interfaces/likesControllerInterface.dart';


class LikesController extends BaseController implements LikesControllerInterface{
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
    _peopleRepository.likedList(
        success: (data) {
          loading.value = false;
          printLog(data);
          var responseModel = responseFromJson(data.toString());
          list.value = (responseModel.data as List).map((item) => SinglePeople.fromJson(item)).toList();
        },
        failure: (error) {
          printLog("error #h1:");
          printLog(error);
          loading.value = false;
        });
  }

  @override
  void onClickAction(SinglePeople user) {
    Map<String,dynamic> body = {
      "target_id":user.target!.id!
    };
    _peopleRepository.unlike(
        id:user.target!.id!,
        success: (data) {
          var responseModel = responseFromJson(data.toString());
          if(responseModel.status!){
            list.remove(user);
            filterList.remove(user);
          }
        },
        failure: (error) {
          printLog("error #uf1:");
          printLog(error);
        });
  }

  @override
  void onClickItem(User user) {
    Get.toNamed(MyRoute.chatRoute,
        arguments: {"data": ChatArguments.fromUser(user)});
  }

}