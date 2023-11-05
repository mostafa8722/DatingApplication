import 'dart:async';
import 'dart:typed_data';
import 'package:google_maps_flutter/google_maps_flutter.dart';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:location/location.dart';
import 'package:widgets_to_image/widgets_to_image.dart';
import 'package:http/http.dart' as http;
import '../../base/baseController.dart';
import '../../model/response/response.dart';
import '../../model/response/signlePeople.dart';
import '../../repositories/peopleRepository.dart';
import '../../utils/log.dart';
import '../../utils/route.dart';
import '../../widgets/marker.dart';
import 'interfaces/mapControllerInterface.dart';

class MapController extends BaseController implements MapControllerInterface {
  final PeopleRepository _peopleRepository = PeopleRepository();
  Completer<GoogleMapController> mapController = Completer();
  LatLng centerPosition = LatLng(29.597717, 52.572204);
  RxSet<Marker> markers = <Marker>{}.obs;
  RxList<MarkerData> markersWidget = <MarkerData>[].obs;
  var kGooglePlex = CameraPosition(
    target: LatLng(29.597717, 52.572204),
    zoom: 14.4746,
  ).obs;

  var peoples = <SinglePeople>[].obs;
  RxBool loading = false.obs;

  @override
  void onInit() {
    const v= Marker(
        markerId: MarkerId("#00"),
        position:LatLng(0, 0) ,
        icon: BitmapDescriptor.defaultMarker,
    );
    markers.add(v);
    getDate();
    super.onInit();
  }

  @override
  void getDate() {
    Map<String, dynamic>? body = {
      "lat":centerPosition.latitude,
      "lng":centerPosition.longitude
    };
    loading.value = true;
    _peopleRepository.index(
        success: (data) {
          loading.value = false;
          printLog(data);
          var responseModel = responseFromJson(data.toString());
          peoples.value = (responseModel.data as List).map((item) => SinglePeople.fromJson(item)).toList();
          addMarker();
        },
        failure: (error) {
          printLog("error #h1:");
          printLog(error);
          loading.value = false;
        });
  }

  void addMarker() async {
    for (var element in peoples) {
      var user = element.target;
      try{
        var foundPeople = markersWidget.where((markerWidget) => markerWidget.singlePeople == element);
        printLog(foundPeople.length);
        if(foundPeople.isNotEmpty) continue;
        markersWidget.add(MarkerData(element,markerWidget(user!.firstName.toString(),element.target!.profile.toString(),WidgetsToImageController()), LatLng(
          double.parse(user.lat.toString()),
          double.parse(user.lng.toString()),
        )));
        printLog(user.lat.toString());
        printLog(user.lng.toString());
      }catch(_){
        printLog(_);
      }
    }

    for (var element in markersWidget) {
      if(markers.value.where((marker) => marker.position == element.latLng).isNotEmpty ){
        continue;
      }
      try{
        Uint8List? bytes=await element.widgetsToImage.controller.capture();

        // await controller.capture()
        markers.add(Marker(
            markerId: MarkerId(element.widgetsToImage.controller.containerKey.hashCode.toString()),
            position:element.latLng ,
            icon: BitmapDescriptor.fromBytes(bytes!),
            onTap:(){selectPeople(element.singlePeople);}
        ));
      }catch(_){}

    }

  }

  @override
  void selectPeople(SinglePeople singlePeople) {
    Get.toNamed(MyRoute.mapUserRoute,arguments: {"data":singlePeople});
  }



  void currentLocation() async {
    GoogleMapController controller = await mapController.future;
    LocationData currentLocation;
    var location = Location();
    try {
      currentLocation = await location.getLocation();
      double? lat = currentLocation.latitude;
      double? lng = currentLocation.longitude;
      controller.animateCamera(CameraUpdate.newCameraPosition(
        CameraPosition(
          bearing: 0,
          target: LatLng(lat!, lng!),
          zoom: 17.0,
        ),
      ));
    } on Exception {}
  }
}

class MarkerData{
  late SinglePeople singlePeople;
  late WidgetsToImage widgetsToImage;
  late LatLng latLng;
  MarkerData(this.singlePeople,this.widgetsToImage,this.latLng);
}
