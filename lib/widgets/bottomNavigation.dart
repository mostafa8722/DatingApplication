
import 'package:flutter/material.dart';
import 'package:get/get_rx/get_rx.dart';

import '../utils/theme/colors.dart';
import '../utils/translations.dart';

BottomNavigationBar bottomNavigationBar(RxInt selectedIndex) {
  return BottomNavigationBar(
    items: items,
    currentIndex: selectedIndex.value,
    type: BottomNavigationBarType.fixed,
    selectedFontSize: 13,
    unselectedFontSize: 12,
    selectedLabelStyle: const TextStyle(fontWeight: FontWeight.bold),
    unselectedItemColor: unselectedNavColor,
    selectedItemColor: primaryColor,
    onTap: (position) => {
      selectedIndex.value = position,
    },
  );
}

BottomNavigationBarItem bottomNavigationItem(
    IconData icon, String title, bool visible) {
  return BottomNavigationBarItem(
    icon: Icon(icon),
    label: title,
  );
}

var items = <BottomNavigationBarItem>[
  bottomNavigationItem(Icons.home, MyText.home.value, true),
  bottomNavigationItem(Icons.map_rounded, MyText.maps.value, true),
  bottomNavigationItem(Icons.heart_broken_rounded, MyText.actions.value, true),
  bottomNavigationItem(Icons.chat, MyText.chats.value, true),
  bottomNavigationItem(Icons.person, MyText.profiles.value, true),
];