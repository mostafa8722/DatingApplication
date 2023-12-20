
import 'package:flutter/material.dart';
import 'package:intl_phone_field/intl_phone_field.dart';
import 'package:intl_phone_field/phone_number.dart';

import '../utils/theme/colors.dart';
//import 'package:syncfusion_flutter_datepicker/datepicker.dart';
import 'package:flutter_holo_date_picker/flutter_holo_date_picker.dart';
Widget datePicker(BuildContext context, TextEditingController controller,
    {EdgeInsetsGeometry? padding,
    Color backgroundColor = textInputBackgroundColor,
    Color textColor = textInputColor,
    String hint = "",
    IconData? icon,
    IconData? suffixIcon,
    double iconSize = 24,
    bool isPassword = false,
    bool hasError = false,
    String errorMessage = "Invalid Input",
    Function? onClick}) {
  return Column(
    mainAxisSize: MainAxisSize.min,
    children: [
      // SfDateRangePicker(
      //   view: DateRangePickerView.month,
      //   monthViewSettings: DateRangePickerMonthViewSettings(firstDayOfWeek: 1),
      // )
      ElevatedButton(
        child: Text("open picker dialog"),
        onPressed: () async {
          var datePicked = await DatePicker.showSimpleDatePicker(
            context,
            // initialDate: DateTime(2020),
            firstDate: DateTime(1900),
            lastDate: DateTime.now(),
            dateFormat: "dd-MMMM-yyyy",
            locale: DateTimePickerLocale.en_us,
            looping: true,
          );

          final snackBar =
          SnackBar(content: Text("Date Picked $datePicked"));
          ScaffoldMessenger.of(context).showSnackBar(snackBar);
        },
      ),
    ],
  );
}




