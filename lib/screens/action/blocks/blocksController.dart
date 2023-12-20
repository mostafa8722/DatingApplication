
import 'package:get/get.dart';

import '../../../base/baseController.dart';
import '../../../model/response/response.dart';
import '../../../model/response/signlePeople.dart';
import '../../../model/response/user.dart';
import '../../../repositories/peopleRepository.dart';
import '../../../utils/log.dart';
import '../actionController.dart';
import 'interfaces/blocksControllerInterface.dart';


class BlocksController extends BaseController implements BlocksControllerInterface{
  final PeopleRepository _peopleRepository = PeopleRepository();
  final ActionController actionController = Get.find();
  var list = <SinglePeople>[].obs;
  var filterList = <SinglePeople>[].obs;
  RxBool loading = true.obs;
  RxBool showInternetConnection = false.obs; 

  @override
  void onInit() {
    ever(actionController.searchText, (search) => filterList.value = list.where((element) => element.target!.fullName.toString().contains(search)).toList());
    getData();
    super.onInit();
  }

  retryConnection(){
    loading.value = true;
    showInternetConnection.value = false;
    getData();
  }
  @override
  void getData() {

    _peopleRepository.blockList(
        success: (data) {
          loading.value = false;
          printLog(data);
          var responseModel = responseFromJson(data.toString());
          list.value = (responseModel.data as List).map((item) => SinglePeople.fromJson(item)).toList();
        },
        failure: (error) {
          showInternetConnection.value = true;
          loading.value = false;
        });
  }

  @override
  void onClickAction(SinglePeople user) {
    Map<String,dynamic> body = {
      "target_id":user.target!.id!
    };
    _peopleRepository.unblock(
        body: body,
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
    //Get.toNamed(MyRoute.chatRoute,arguments: {"data": ChatArguments.fromUser(user)});
  }

}