
import 'package:Lover369/model/response/locales.dart';
import 'package:Lover369/storage/appStorage.dart';
import 'package:get/get.dart';

import '../../../../appControler.dart';
import '../../../../base/baseController.dart';

class LanguageController extends BaseController{
  AppController appController = Get.find();
  Rx<String> cont =  'English'.obs;
  
  @override
  void onInit() {
    appStorage = AppStorage();
    appController.appStorage.getData(appStorage.languageKey)
        .then((value) {
          String iso = 'en';
          if(value != null){
            iso=value as String;
          }
          cont.value = appController.initialize.value!.locales!.firstWhere((element) => element.isoCode==iso).name!;
    })
    .catchError((err){});
    ever(cont, (callback) {
      String iso = appController.initialize.value!.locales!.firstWhere((element) => element.name==callback).isoCode!.toString();
      appController.appStorage.saveData(appStorage.languageKey, iso);
      appController.getLanguages();
    });
    super.onInit();
  }
}