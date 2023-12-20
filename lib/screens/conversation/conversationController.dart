
import 'package:get/get.dart';

import '../../appControler.dart';
import '../../base/baseController.dart';
import '../../base/baseSocket.dart';
import '../../model/argument/chatArguments.dart';
import '../../model/response/conversation.dart';
import '../../model/response/onlineUser.dart';
import '../../model/response/response.dart';
import '../../model/response/signlePeople.dart';
import '../../repositories/peopleRepository.dart';
import '../../utils/log.dart';
import '../../utils/route.dart';
import 'interfaces/conversationControllerInterface.dart';


class ConversationController extends BaseController implements ConversationControllerInterface{
  final AppController appController = Get.find<AppController>();
  final PeopleRepository _peopleRepository = PeopleRepository();
  var conversations = <Conversation>[].obs;
  var filterConversations = <Conversation>[].obs;
  var onlineUsers = <OnlineUser>[].obs;
  var onlineUserCount = 0.obs;
  RxString searchText = "".obs;
  var loading = true.obs;
  RxBool showInternetConnection = false.obs;

  @override
  void onInit() {
    appController.socket.on(BaseSocket.messageChannel.message, (message) {
      printLog('getConversations()');
      getConversations();
    });
    printLog('getConversations2()');
    ever(searchText, (search) => filterConversations.value = conversations.where((element) => element.user!.target!.fullName.toString().contains(search)).toList());
    initOnlineUsers();
    super.onInit();
  }
  retryConnection(){
    loading.value = true;
    showInternetConnection.value = false;
    getConversations();
  }
  @override
  void getConversations() {

    _peopleRepository.getConversations(
      success: (data) {
        var responseModel = responseFromJson(data.toString());
        loading.value = false;
        conversations.value = (responseModel.data as List).map((item) => Conversation.fromJson(item)).toList();
       // conversations.sort((a, b) => DateTime.parse(b.latestMessage!.date.toString()).millisecondsSinceEpoch.compareTo(DateTime.parse(a.latestMessage!.date.toString()).millisecondsSinceEpoch));
      //  conversations.refresh();
      },
      failure: (error) {
        showInternetConnection.value = true;
        printLog("#conv1-e");
        printLog(error.response?.data);
      },
    );
  }

  @override
  void gotoChat(dynamic data) {
    if(data is Conversation) {
      Get.toNamed(MyRoute.chatRoute,
          arguments: {"data": ChatArguments.fromConversation(data)});
    }else if(data is OnlineUser){
      var body = {"email":data.email.toString()};
      _peopleRepository.index(
        body: body,
        success: (resonse) {
          printLog(resonse);
          var responseModel = responseFromJson(resonse.toString());
          var people = (responseModel.data as List).map((item) => SinglePeople.fromJson(item)).toList();
          Get.toNamed(MyRoute.chatRoute,
              arguments: {"data": ChatArguments.fromSinglePeople(people[0])});
        },
        failure: (p0) {

        },
      );
    }
  }

  @override
  void initOnlineUsers() {
    appController.socket.on(BaseSocket.userChannel.onlineUsers, (data) {
      printLog(data);
      var onlines = OnlineUsers.fromJson(data);
      var _onlineUsers = <OnlineUser>[];

      for (var element in onlines.users!) {
        if(element.profileImage != appController.user.value?.profile.toString()){
          _onlineUsers.add(element);
        }
      }
      onlineUserCount.value = _onlineUsers.length!;
      onlineUsers.value = _onlineUsers;
    });
  }

  onSearch(String text){
    searchText.value= text;
  }

}