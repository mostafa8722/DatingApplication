import 'package:Lover369/utils/route.dart';
import 'package:agora_rtc_engine/agora_rtc_engine.dart';
import 'package:get/get.dart';
import 'package:permission_handler/permission_handler.dart';

import '../../../appControler.dart';
import '../../../base/baseController.dart';
import '../../../base/baseSocket.dart';
import '../../../model/argument/chatArguments.dart';
import '../../../model/request/callRequest.dart';
import '../../../model/response/call.dart';
import '../../../repositories/peopleRepository.dart';
import '../../../utils/enums.dart';
import '../../../utils/log.dart';
import 'interface/callControllerInterface.dart';
import 'package:flutter_ringtone_player/flutter_ringtone_player.dart';

class CallController extends BaseController implements CallControllerInterface {
  var appId = "<-- Insert App Id -->";
  var token = "<-- Insert Token -->";
  var channel = "<-- Insert Channel Name -->";
  var uid = 0;

  final RxnInt remoteUid = RxnInt();
  final RxBool localUserJoined = false.obs;
  late RtcEngine engine;

  final AppController appController = Get.find<AppController>();
  late ChatArguments chatArguments;
  late Call call;
  final PeopleRepository _peopleRepository = PeopleRepository();
  Rx<String> targetName = "".obs;
  Rx<String> targetProfile = "".obs;
  int targetId = 0;
  String targetEmail = "";
  var isVideoCall = false.obs;
  RxBool showInternetConnection = false.obs;

  @override
  void onInit() {
    initializeSocket();
    initializeData();
    super.onInit();
  }

  @override
  void initializeData() {
    if (Get.arguments["data"] != null) {
      chatArguments = Get.arguments["data"];
      targetName.value = chatArguments.name.toString();
      targetProfile.value = chatArguments.profile.toString();
      targetId = chatArguments.id!;
      targetEmail = chatArguments.email!;
      appController.callStatus.value = CallStatus.calling;
      if(Get.arguments["type"].toLowerCase()!='voice'){
        isVideoCall.value=true;
        videoCall();
      }else{
        isVideoCall.value=false;
        voiceCall();
      }

    } else if (Get.arguments["income-call"] != null) {
      call = Get.arguments["income-call"] as Call;
      targetName.value = call.callInfo!.targetFullName.toString();
      targetProfile.value = call.callInfo!.targetProfile.toString();
      appId = call.callInfo!.appID.toString();
      channel = call.callInfo!.callChannelName.toString();
      token = call.callInfo!.userToken.toString();
      uid = call.callInfo!.userUid!;
      // call.callInfo!.;
      if(call.callInfo!.type!.toLowerCase()!='voice'){
        isVideoCall.value=true;
      }
    }
  }

  @override
  void initializeSocket() async {
    appController.socket.on(BaseSocket.callChannel.endCall, (data) {
      Get.off(MyRoute.callRoute);
    });

    appController.socket.on(BaseSocket.callChannel.callRequest, (data) {


      Call call = Call.fromJson(data);
      printLog(call.callInfo!.status);


      if(call.callInfo!.status == "Rejected"){

        Get.back(canPop: true);
      }
      if(call.callInfo!.status == "Requested"){


        FlutterRingtonePlayer.play(fromAsset: "assets/audio/internal_ring.mp3");
      }else{
        FlutterRingtonePlayer.stop();
      }

      if(call.callInfo!.status == "Ended"){
        Get.back(canPop: true);
      }


      if(call.callInfo!.status == "Answered"){

        appController.callStatus.value = CallStatus.inCall;
        targetName.value = call.callInfo!.userFullName.toString();
        targetProfile.value = call.callInfo!.userProfile.toString();
        appId = call.callInfo!.appID.toString();
        channel = call.callInfo!.callChannelName.toString();
        token = call.callInfo!.targetToken.toString();
        uid = call.callInfo!.targetUid!;

        initializeAgora();
      }
    });
  }

  @override
  void initializeAgora() async {
    // retrieve permissions
    await [Permission.microphone, Permission.camera].request();

    //create the engine
    engine = createAgoraRtcEngine();
    await engine.initialize(RtcEngineContext(
      appId: appId,
      channelProfile: ChannelProfileType.channelProfileLiveBroadcasting,

    ));



    engine.registerEventHandler(
      RtcEngineEventHandler(
        onJoinChannelSuccess: (RtcConnection connection, int elapsed) {
          printLog("local user ${connection.localUid} joined");
          printLog(connection);
          localUserJoined.value = true;

        },
        onUserJoined: (RtcConnection connection, int _remoteUid, int _elapsed) {
          printLog("remote user $_remoteUid joined");
          remoteUid.value = _remoteUid;
        },
        onUserOffline: (RtcConnection connection, int _remoteUid,
            UserOfflineReasonType reason) {
          printLog("remote user $_remoteUid left channel");
          remoteUid.value = null;
        },
        onTokenPrivilegeWillExpire: (RtcConnection connection, String token) {
          printLog(
              '[onTokenPrivilegeWillExpire] connection: ${connection.toJson()}, token: $token');
        },
      ),
    );

    await engine!.setClientRole(role: ClientRoleType.clientRoleBroadcaster);
    await engine.enableAudio();
    await engine.enableVideo();
    await engine.startPreview();



    printLog("acc: ${appId} :::${channel}:::${token}:::${uid}");

    try{
     await engine.joinChannel(
    token: token,
    channelId: channel,
    uid: uid,
    options: const ChannelMediaOptions(),
    );
    }catch(e){
      printLog("accepted call_12455");
      print(e);
    }




  }

  @override
  void acceptCall() {
    appController.socket.emit(BaseSocket.callChannel.acceptIncomingCall, [{}]);
    appController.callStatus.value = CallStatus.inCall;
    initializeAgora();
  }

  @override
  void endCall() {
    appController.socket.emit(BaseSocket.callChannel.endCall, [{}]);
    appController.callStatus.value = CallStatus.end;
    appController.callStatus.value = CallStatus.none;
    Future.delayed(Duration(milliseconds: 500)).then((value) => Get.back(canPop: true,closeOverlays: true));
  }

  @override
  void videoCall() {
    var callObject = CallRequest(toMail: targetEmail, type: "VIDEO").toJson();
    print("callObject");
    printLog(callObject);
    appController.socket.emit(BaseSocket.callChannel.callRequest, [callObject]);

  }

  @override
  void voiceCall() {
    var callObject = CallRequest(toMail: targetEmail, type: "VOICE").toJson();
    print("ddddd000");
    printLog(callObject);
    appController.socket.emit(BaseSocket.callChannel.callRequest, [callObject]);

    print("ddddd000222");
  }
}
