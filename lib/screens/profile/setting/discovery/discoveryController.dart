import 'package:get/get.dart';
import 'package:syncfusion_flutter_sliders/sliders.dart';

import '../../../../base/baseController.dart';

class DiscoveryController extends BaseController{
  Rx<bool> expandedSearchController = false.obs;
  Rx<bool> hideLastSeenController = false.obs;
  Rx<SfRangeValues> ageController = (SfRangeValues(18, 30)).obs;
  Rx<SfRangeValues> distanceController = (SfRangeValues(4, 60)).obs;

}