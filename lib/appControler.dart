
import 'package:Lover369/utils/translations.dart';
import 'package:flutter/material.dart';
import 'package:flutter_ringtone_player/flutter_ringtone_player.dart';
import 'package:get/get.dart';
import 'package:socket_io_client/socket_io_client.dart' as IO;
import 'package:socket_io_client/socket_io_client.dart';
import 'base/baseController.dart';
import 'base/baseSocket.dart';
import 'model/response/Languages.dart';
import 'model/response/call.dart';
import 'model/response/initialize.dart';
import 'model/response/response.dart';
import 'model/response/user.dart';
import 'repositories/appRepository.dart';
import 'repositories/userRepository.dart';
import 'utils/enums.dart';
import 'utils/header.dart';
import 'utils/log.dart';
import 'utils/route.dart';

class AppController extends BaseController {
  final AppRepository _appRepository = AppRepository();
  late IO.Socket socket;
  final UserRepository _userRepository = UserRepository();
  final Rxn<User> user = Rxn<User>();
  final Rxn<Initialize> initialize = Rxn<Initialize>();

  var profile = "".obs;
  var callStatus = CallStatus.none.obs;

  Rx<bool> loadedInitData = false.obs;
  Rx<bool> loading = false.obs;

  @override
  void onInit() async{
    getData();
    getLanguages();
    ever(user, (updatedUser)async{
      profile.value = "https://google.com";
      profile.refresh();
      Future.delayed(Duration(seconds: 1),(){
        profile.value = updatedUser!.profile.toString();
      });
      
    });

    ever(callStatus, (callback) {
      if(callback == CallStatus.ringing){
        FlutterRingtonePlayer.playRingtone(
           looping: true,
          asAlarm: true
        );
      }else{
        FlutterRingtonePlayer.stop();
      }
    });
    user.value =await _userRepository.getInformation() as User?;
    super.onInit();
  }


  getMe(){
    _userRepository.me(
        success: (data) {
          printLog(data);
          var responseModel = responseFromJson(data.toString());
          var userModel = User.fromJson(responseModel.data);
          _userRepository.saveInformation(user: userModel);
        },
        failure: (error) {
          printLog(error.response);
        });
  }

  getData() {

    _appRepository.getInitialize(
        success: (data) {
          printLog(data);
          loadedInitData.value = true;
          loading.value = false;

          var responseModel = responseFromJson(data.toString());
          initialize.value = Initialize.fromJson(responseModel.data);
        },
        failure: (error) {
          loadedInitData.value = false;
          loading.value = false;
        });
  }

  void initData(){
    loading.value = true;
    getData();
    getLanguages();
  }

  void initializeSocket() async {
    var header = await getSocketHeader();
    printLog("header!['token']");
    printLog(header!['token']);
    socket = IO.io(BaseSocket.socketUrl,
        OptionBuilder()
            .setTransports(['websocket',"polling"],) // for Flutter or Dart VM
            .setExtraHeaders(header)
            .enableAutoConnect()
            .enableReconnection()

            .setTimeout(60000)// optional

            .build()
    );
    socket.auth = header;
    socket.connect();


    socket.onError((data){
      debugPrint('error:$data');
      printLog("header ===>error $data");
    });
    socket.onConnectError((data){
      printLog("header ===>connect_error $data");

      debugPrint('connect_error:$data');
      socket.connect();
    });

    socket.onConnect((love) {
      printLog("header ===>love $love");
      print('connect333333333333333333333333333333333333333333');
      print("$love");
    });

    //When an event recieved from server, data is added to the stream
    // socket.on('event', (data) => streamSocket.addResponse);
    socket.onDisconnect((love) {
      print('disconnect');
      print("LOG:$love");
      socket.open().connect();
    });

    socket.onPing((data) {
    print('pinggggggggggg');
    print("LOG:$data");
    });
    socket.on(BaseSocket.callChannel.incomingCall, (data) {
      print("req222222222aa");
      Call call = Call.fromJson(data);
      print(call.callInfo!.status);
      print(call.callInfo!.toJson());
      print(callStatus.value);
      print(CallStatus.none);
      if(call.callInfo!.status=="Ended"){
        Get.back(canPop: true);


      }
      if(callStatus.value == CallStatus.none){
        print("aaaaaaaaa1");

        callStatus.value=CallStatus.ringing;
        Get.toNamed(MyRoute.callRoute,arguments: {"income-call":Call.fromJson(data)})
        ?.then((value){
          Future.delayed(Duration(milliseconds: 10)).then((value) => callStatus.value=CallStatus.none);
        }).onError((error, stackTrace) {
          Future.delayed(Duration(seconds: 10)).then((value) => callStatus.value=CallStatus.none);
        });
      }else{
        socket.emit(BaseSocket.callChannel.rejectIncomingCall);
        print("aaaaaaaaa2");

      }
    });

    socket.on(BaseSocket.callChannel.endCall, (data) {
      print("req222222222aa1");

      if(callStatus.value == CallStatus.none){

      }
    });
    socket.on(BaseSocket.callChannel.acceptIncomingCall, (data) {
      print("req222222222aa2");
      print(BaseSocket.callChannel.acceptIncomingCall);
      print(data);
    });
    socket.on(BaseSocket.callChannel.rejectIncomingCall, (data) {
      print("req222222222aa3");
      print(BaseSocket.callChannel.rejectIncomingCall);
      print(data);
    });
  }

  void getLanguages() {
    _appRepository.getTranslation(
        success: (data) {

          loadedInitData.value = true;
          loading.value = false;
          var responseModel = responseFromJson(data.toString());
          var translate = Languages.fromJson(responseModel.data);
          MyText.age.value = translate.sections!.appSettingAge![0];
          MyText.womenOnly.value = translate.sections!.appSettingWomenOnly![0];
          MyText.hideLastSeen.value = translate.sections!.appSettingHideLastSeen![0];
          MyText.searchArea.value = translate.sections!.appSettingSearchArea![0];
          MyText.distance.value = translate.sections!.appSettingDistance![0];
          MyText.location.value = translate.sections!.appSettingLocation![0];
          MyText.discoverySetting.value = translate.sections!.appSettingDiscovery![0];
          MyText.male.value = translate.sections!.appSettingMale![0];
          MyText.female.value = translate.sections!.appSettingFemale![0];
          MyText.firstName.value = translate.sections!.appSettingFirstName![0];
          MyText.lastName.value = translate.sections!.appSettingLastName![0];
          MyText.phoneNumber.value = translate.sections!.appSettingPhone![0];
          MyText.email.value = translate.sections!.appSettingEmail![0];
          MyText.personalInformation.value = translate.sections!.appSettingPersonalNformation![0];
          MyText.changePassword.value = translate.sections!.appSettingChangePassword![0];
          MyText.changePin.value = translate.sections!.appSettingChangePin![0];
          MyText.blockedList.value = translate.sections!.appActionsBlock![0];
          MyText.googleAuthenticator.value = translate.sections!.appSettingGoogleAuth![0];
          MyText.biometric.value = translate.sections!.appSettingBiometricId![0];
          MyText.faceid.value = translate.sections!.appSettingFaceId![0];
          MyText.security.value = translate.sections!.appSettingSecurity![0];
          MyText.setting.value = translate.sections!.appProfileSetting![0];
          MyText.inviteFriends.value = translate.sections!.appProfileInviteFriends![0];
          MyText.helpCenter.value = translate.sections!.appProfileHelpCenter![0];
          MyText.notification.value = translate.sections!.appSettingNotification![0];
          MyText.maps.value = translate.sections!.appNavMaps![0];
          MyText.chats.value = translate.sections!.appNavChats![0];
          MyText.actions.value = translate.sections!.appNavActions![0];
          MyText.home.value = translate.sections!.appNavHome![0];
          MyText.profiles.value = translate.sections!.appNavProfile![0];
          MyText.logout.value = translate.sections!.appProfileLogout![0];
        },
        failure: (error) {
          loadedInitData.value = false;
          loading.value = false;
        });
  }
}

