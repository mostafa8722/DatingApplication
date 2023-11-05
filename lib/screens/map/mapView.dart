
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:permission_handler/permission_handler.dart';

import '../../utils/log.dart';
import '../../utils/theme/colors.dart';
import '../../widgets/button.dart';
import '../../widgets/divider.dart';
import 'interfaces/mapViewInterface.dart';
import 'mapController.dart';

class MapView extends GetView<MapController> implements MapViewInterface {
  const MapView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: body(context),
      floatingActionButton: FloatingActionButton(
        onPressed:() async{
          if (await Permission.contacts.request().isGranted) {
            controller.currentLocation();
          }else{
            final status = await Permission.location.request();
            if(status.isGranted){
              controller.currentLocation();
            }
          }
// You can request multiple permissions at once.
        },
        child: Icon(Icons.location_on,color: Colors.white,),
      ),
    );
  }

  Future<void> _goToTheLake() async {
    controller.addMarker();
    // final GoogleMapController googleMapController = await controller.mapController.future;
    // googleMapController.animateCamera(CameraUpdate.newCameraPosition(controller.kLake));
  }

  @override
  Widget body(BuildContext context) {
    return SafeArea(child: Stack(children: [
      marker(),
      map(),
      // locationCard()
    ]));
  }

  @override
  Widget locationCard() {
    return Positioned(
        top: 0,
        right: 0,
        left: 0,
        child: Container(
            padding: const EdgeInsets.all(16),
            margin: const EdgeInsets.all(16),
            decoration: BoxDecoration(
                color: Colors.white, borderRadius: BorderRadius.circular(12)),
            child: Row(
              children: [
                Expanded(
                    child: Column(
                  mainAxisSize: MainAxisSize.min,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.start,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: const [
                        Icon(Icons.place, color: primaryColor),
                        VerticalTransparentDivider(width: 8),
                        Text("Location (within 10 Km)"),
                      ],
                    ),
                    const TransparentDivider(
                      height: 8,
                    ),
                    const Text(
                      "Jakarta,Indonesia",
                      style: TextStyle(
                          fontSize: 16.0, fontWeight: FontWeight.bold),
                      textAlign: TextAlign.start,
                    ),
                  ],
                )),
                Center(
                    child: ButtonWithIcon(
                  text: "change",
                  onPressed: () {},
                  icon: Icons.edit,
                  iconColor: Colors.white,
                  iconSize: 18,
                ))
              ],
            )));
  }

  @override
  Widget map() {
    return Obx(() => GoogleMap(
        mapType: MapType.normal,
        zoomControlsEnabled: false,
        initialCameraPosition: controller.kGooglePlex.value,
        markers: controller.markers.value,
        // myLocationButtonEnabled: true,
        myLocationEnabled: true,
        onMapCreated: (GoogleMapController mapController) {
          controller.mapController.complete(mapController);
        },
        onCameraIdle: () async{
          final GoogleMapController googleMapController = await controller.mapController.future;
         googleMapController.getVisibleRegion().then((value) {
         printLog(value.northeast);
         printLog(value.southwest);
         });
         controller.getDate();
        },
      onCameraMove: (position) {
        controller.centerPosition = position.target;
      },

    ));
  }

  @override
  Widget marker() {
    return Obx(() => Stack(
        children: controller.markersWidget
            .map((element) => element.widgetsToImage)
            .toList()));
  }
}
