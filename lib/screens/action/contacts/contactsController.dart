
import 'package:get/get.dart';

import '../../../base/baseController.dart';
import '../../../model/argument/chatArguments.dart';
import '../../../model/response/response.dart';
import '../../../model/response/signlePeople.dart';
import '../../../model/response/user.dart';
import '../../../repositories/contactRepository.dart';
import '../../../utils/log.dart';
import '../../../utils/route.dart';
import '../actionController.dart';
import 'interfaces/contactsControllerInterface.dart';


class ContactsController extends BaseController implements ContactsControllerInterface{
  final ContactRepository _contactRepository = ContactRepository();
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

    _contactRepository.index(
        success: (data) {
          loading.value = false;
          printLog(data);
          var responseModel = responseFromJson(data.toString());
          list.value = (responseModel.data as List).map((item) => SinglePeople.fromJson(item)).toList();
        },
        failure: (error) {
          showInternetConnection.value = true;

          printLog("error #h1:");
          printLog(error);
          loading.value = false;
        });
  }

  @override
  void onClickItem(User user) {
    Get.toNamed(MyRoute.chatRoute,
        arguments: {"data": ChatArguments.fromUser(user)});
  }

}