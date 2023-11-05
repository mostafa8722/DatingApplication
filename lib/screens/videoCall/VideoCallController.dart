import 'package:agora_rtc_engine/agora_rtc_engine.dart';
import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';
import 'package:permission_handler/permission_handler.dart';

import '../../base/baseController.dart';
import 'videoCallView.dart';

class VideoCallController extends BaseController{

  final RxnInt remoteUid = RxnInt();
  final RxBool localUserJoined = false.obs;
  late RtcEngine engine;

  @override
  void onInit() {

    super.onInit();
  }

  @override
  void dispose() {
    super.dispose();
  }

  Future<void> initAgora() async {
    // retrieve permissions
    await [Permission.microphone, Permission.camera].request();

    //create the engine
    engine = createAgoraRtcEngine();
    await engine.initialize(const RtcEngineContext(
      appId: appId,
      channelProfile: ChannelProfileType.channelProfileLiveBroadcasting,
    ));

    engine.registerEventHandler(
      RtcEngineEventHandler(
        onJoinChannelSuccess: (RtcConnection connection, int elapsed) {
          debugPrint("local user ${connection.localUid} joined");
          localUserJoined.value = true;
        },
        onUserJoined: (RtcConnection connection, int _remoteUid, int _elapsed) {
          debugPrint("remote user $_remoteUid joined");
          remoteUid.value = _remoteUid;
        },
        onUserOffline: (RtcConnection connection, int _remoteUid,
            UserOfflineReasonType reason) {
          debugPrint("remote user $_remoteUid left channel");
          remoteUid.value = null;
        },
        onTokenPrivilegeWillExpire: (RtcConnection connection, String token) {
          debugPrint(
              '[onTokenPrivilegeWillExpire] connection: ${connection.toJson()}, token: $token');
        },
      ),
    );

    await engine.setClientRole(role: ClientRoleType.clientRoleBroadcaster);
    await engine.enableVideo();
    await engine.startPreview();

    await engine.joinChannel(
      token: token,
      channelId: channel,
      uid: 0,
      options: ChannelMediaOptions(),
    );
  }
}