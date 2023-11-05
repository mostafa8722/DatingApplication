import 'package:flutter/material.dart';
import 'package:agora_rtc_engine/agora_rtc_engine.dart';
import 'package:get/get.dart';

import '../../../utils/enums.dart';
import '../../../utils/theme/colors.dart';
import '../../../widgets/button.dart';
import '../../../widgets/divider.dart';
import '../../../widgets/image.dart';
import 'callController.dart';
import 'interface/callViewInterface.dart';

class CallView extends GetView<CallController> implements CallViewInterface {
  const CallView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: body(context),
    );
  }

  @override
  Widget body(BuildContext context) {
    return Obx(
        () => controller.appController.callStatus.value == CallStatus.ringing
            ? ringingView()
            : controller.appController.callStatus.value == CallStatus.calling
                ? callingView()
                : controller.appController.callStatus.value == CallStatus.inCall
                    ? controller.isVideoCall.value
                        ? inCallView()
                        : callingView()
                    : Container());
  }

  @override
  Widget endCallView() {
    return Stack(
      children: [
        SizedBox(
          width: double.infinity,
          height: double.infinity,
          child: Obx(() => image(networkImage: controller.targetProfile.value)),
        ),
        Container(
          width: double.infinity,
          height: double.infinity,
          color: Colors.white38,
        ),
        Center(
            child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisSize: MainAxisSize.min,
          children: [
            Container(
              alignment: Alignment.center,
              width: 180,
              height: 180,
              decoration: BoxDecoration(
                  shape: BoxShape.circle,
                  border: Border.all(color: Colors.white, width: 2)),
              child: circularImage(
                  networkImage: controller.targetProfile.value, size: 180),
            ),
            TransparentDivider(
              height: 24,
            ),
            Obx(() => Text(
                  controller.targetName.value,
                  style: TextStyle(
                      color: Colors.white,
                      fontSize: 22,
                      shadows: [Shadow(color: Colors.black, blurRadius: 20)]),
                )),
            TransparentDivider(
              height: 8,
            ),
            Text(
              "04:35 minutes",
              style: TextStyle(
                  color: Colors.white,
                  fontSize: 14,
                  shadows: [Shadow(color: Colors.black, blurRadius: 20)]),
            )
          ],
        )),
        Positioned(
            bottom: 42,
            width: MediaQuery.of(Get.context!).size.width,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              mainAxisSize: MainAxisSize.min,
              children: [
                MyFloatingButton(
                  onPressed: () {},
                  icon: Icons.volume_up_rounded,
                  iconColor: Colors.white,
                  backgroundColor: Colors.black38,
                  size: 54,
                ),
                const VerticalTransparentDivider(
                  width: 16,
                ),
                MyFloatingButton(
                  onPressed: () {},
                  icon: Icons.mic,
                  iconColor: Colors.white,
                  backgroundColor: Colors.black38,
                  size: 54,
                ),
                const VerticalTransparentDivider(
                  width: 16,
                ),
                MyFloatingButton(
                  onPressed: () {},
                  icon: Icons.call,
                  iconColor: Colors.white,
                  backgroundColor: primaryColor,
                  size: 54,
                ),
              ],
            ))
      ],
    );
  }

  @override
  Widget inCallView() {
    return Stack(
      children: [
        SizedBox(
          width: double.infinity,
          height: double.infinity,
          child: Obx(() => remoteView()),
        ),
        Positioned(
            top: 36,
            right: 12,
            child: Container(
                width: 80,
                height: 120,
                clipBehavior: Clip.hardEdge,
                decoration:
                    BoxDecoration(borderRadius: BorderRadius.circular(8)),
                child: Obx(() => SizedBox(
                      width: 80,
                      height: 120,
                      child: Center(
                          child: controller.localUserJoined.value
                              ? AgoraVideoView(
                                  controller: VideoViewController(
                                    rtcEngine: controller.engine,
                                    canvas: const VideoCanvas(uid: 0),
                                  ),
                                )
                              : const CircularProgressIndicator()),
                    )))),
        Positioned(
            bottom: 42,
            width: MediaQuery.of(Get.context!).size.width,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              mainAxisSize: MainAxisSize.min,
              children: [
                // MyFloatingButton(onPressed: (){},icon: Icons.volume_up_rounded,iconColor: Colors.white,backgroundColor: Colors.black38,size: 54,),
                // const VerticalTransparentDivider(width: 16,),
                // MyFloatingButton(onPressed: (){},icon: Icons.mic,iconColor: Colors.white,backgroundColor: Colors.black38,size: 54,),
                // const VerticalTransparentDivider(width: 16,),
                MyFloatingButton(
                  onPressed: () => controller.endCall(),
                  icon: Icons.call,
                  iconColor: Colors.white,
                  backgroundColor: Colors.red,
                  size: 54,
                ),
              ],
            ))
      ],
    );
  }

  @override
  Widget ringingView() {
    return Stack(
      children: [
        SizedBox(
          width: double.infinity,
          height: double.infinity,
          child: Obx(() => image(networkImage: controller.targetProfile.value)),
        ),
        Positioned(
            bottom: 42,
            width: MediaQuery.of(Get.context!).size.width,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              mainAxisSize: MainAxisSize.min,
              children: [
                MyFloatingButton(
                  onPressed: () => controller.acceptCall(),
                  icon: Icons.call,
                  iconColor: Colors.white,
                  backgroundColor: primaryColor,
                  size: 54,
                ),
                const VerticalTransparentDivider(
                  width: 16,
                ),
                MyFloatingButton(
                  onPressed: () => controller.endCall(),
                  icon: Icons.call_end,
                  iconColor: Colors.red,
                  backgroundColor: Colors.white,
                  size: 54,
                ),
              ],
            ))
      ],
    );
  }

  @override
  Widget callingView() {
    return Stack(
      children: [
        SizedBox(
          width: double.infinity,
          height: double.infinity,
          child: Obx(() => image(networkImage: controller.targetProfile.value)),
        ),
        Positioned(
            bottom: 42,
            width: MediaQuery.of(Get.context!).size.width,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              mainAxisSize: MainAxisSize.min,
              children: [
                MyFloatingButton(
                  onPressed: () => controller.endCall(),
                  icon: Icons.call_end,
                  iconColor: Colors.red,
                  backgroundColor: Colors.white,
                  size: 54,
                ),
              ],
            ))
      ],
    );
  }

  Widget remoteView() {
    Widget widget;
    if (controller.remoteUid.value != null) {
      widget = AgoraVideoView(
          controller: VideoViewController.remote(
        rtcEngine: controller.engine,
        useFlutterTexture: false,
        canvas: VideoCanvas(uid: controller.remoteUid.value),
        connection: RtcConnection(
          channelId: controller.channel,
        ),
      ));
    } else {
      widget = const Text(
        'Please wait for remote user to join',
        textAlign: TextAlign.center,
      );
    }
    return Stack(
      children: [
        Center(
          child: widget,
        ),
        Align(
          alignment: Alignment.topLeft,
          child: SizedBox(
            width: 100,
            height: 150,
            child: Center(
              child: controller.localUserJoined.value
                  ? AgoraVideoView(
                      controller: VideoViewController(
                        rtcEngine: controller.engine,
                        canvas: const VideoCanvas(uid: 0),
                      ),
                    )
                  : const CircularProgressIndicator(),
            ),
          ),
        ),
      ],
    );
  }
}
