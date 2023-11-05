
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';
import 'package:syncfusion_flutter_core/theme.dart';
import 'package:syncfusion_flutter_sliders/sliders.dart';

import '../utils/theme/texts.dart';
import 'divider.dart';

Widget rangeSlider({
  required double min,
  required double max,
  required Rx<SfRangeValues> controller,
  required String title
}) {
  var format = NumberFormat("##", "en_US");
  return Column(
    crossAxisAlignment: CrossAxisAlignment.start,
    children: [
      Text(title,style: normalTextStyle(color: Colors.black,fontWeight: FontWeight.bold,size: 15)),
      TransparentDivider(height: 48,),
      SfSliderTheme(
          data: SfSliderThemeData(
              tooltipBackgroundColor: Colors.yellowAccent,
              inactiveTickColor: Colors.black12
          ),
          child:  Obx(() =>SfRangeSlider(
            min: 0.0,
            max: 100.0,
            values: controller.value,
            enableTooltip: true,
            interval: 1,
            minorTicksPerInterval: 1,
            numberFormat: format,
            // inactiveColor: Colors.black12,
            shouldAlwaysShowTooltip: true,
            onChanged: (SfRangeValues values) {
              controller.value = values;
            },
          )))

    ],
  );
}
