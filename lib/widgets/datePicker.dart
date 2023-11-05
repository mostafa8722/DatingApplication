import 'package:flutter/material.dart';
import 'package:get/get.dart';

datePickerDialog(BuildContext context,Function(DateTime) onSubmitDateTime,{DateTime? initializeDateTime}) {
  DateTime dateTime = initializeDateTime ?? DateTime.now();
  // showDialog(
  //     context: context,
  //     builder: (BuildContext context) {
  //       return Padding(
  //           padding: EdgeInsets.symmetric(vertical: MediaQuery.of(context).size.height/6, horizontal: MediaQuery.of(context).size.width/16),
  //           child: Container(
  //               margin:const EdgeInsets.all(36),
  //               decoration: BoxDecoration(
  //                   color: Colors.white,
  //                   borderRadius: BorderRadius.circular(12)
  //               ),
  //               child: SfDateRangePicker(
  //                 allowViewNavigation: true,
  //                 navigationMode: DateRangePickerNavigationMode.snap,
  //                 onSelectionChanged: (args) {
  //                     dateTime = args.value;
  //                 },
  //                 selectionMode: DateRangePickerSelectionMode.single,
  //                 showActionButtons: true,
  //                 toggleDaySelection: true,
  //                 showNavigationArrow: true,
  //                 headerHeight: 80,
  //                 onSubmit: (p0){
  //                   onSubmitDateTime(dateTime);
  //                   Get.back(canPop: false);
  //                 },
  //                 onCancel:()=> Get.back(canPop: false),
  //                 headerStyle:
  //                 const DateRangePickerHeaderStyle(textAlign: TextAlign.center),
  //                 selectionTextStyle: const TextStyle(color: Colors.white),
  //                 // initialSelectedDate: ,
  //               )));
  //     });
}