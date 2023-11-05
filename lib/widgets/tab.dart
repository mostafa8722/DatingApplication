
import 'package:flutter/material.dart';
import 'package:tab_indicator_styler/tab_indicator_styler.dart';

import '../utils/theme/colors.dart';
import '../utils/theme/texts.dart';


Widget tabBar(TabController controller,List<Tab> tabs,{bool isScrollable= false,}) {
  return Container(
    color: Colors.white,
    child: TabBar(
      controller: controller,
      tabs: tabs,
      labelStyle: tabBarTextStyle,
      unselectedLabelColor: unselectedNavColor,
      labelColor: primaryColor,
      isScrollable: isScrollable,
      indicator: MaterialIndicator(
        height: 2,
        color: primaryColor,
        topLeftRadius: 1,
        topRightRadius: 1,
        tabPosition: TabPosition.bottom,
      ),
      indicatorSize: TabBarIndicatorSize.tab,
    ),
  );
}

Tab tab(String title) {
  return Tab(
    text: title,
  );
}