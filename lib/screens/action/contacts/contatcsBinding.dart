import 'package:get/get.dart';

import 'contactsController.dart';


class ContactsBinding extends Bindings{
  @override
  void dependencies() {
    Get.lazyPut(() => ContactsController());
  }

}