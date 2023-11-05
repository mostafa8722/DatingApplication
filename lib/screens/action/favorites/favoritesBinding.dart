import 'package:get/get.dart';

import 'favoritesController.dart';

class FavoritesBinding extends Bindings{
  @override
  void dependencies() {
    Get.lazyPut(() => FavoritesController());
  }

}