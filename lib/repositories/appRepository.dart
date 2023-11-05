
import 'package:Lover369/storage/appStorage.dart';
import 'package:dio/dio.dart';

import '../base/baseRepository.dart';
import '../network/appApi.dart';

class AppRepository extends BaseRepository {
  late AppApi _appApi;
  late AppStorage _appStorage;

  AppRepository() {
    _appApi = AppApi();
    _appStorage = AppStorage();
  }

  void getPackages(
      {Function(dynamic)? success, Function(DioError)? failure}) {
    callApi(_appApi.packages(null), success, failure);
  }

  void getInitialize(
      {Function(dynamic)? success, Function(DioError)? failure}) {
    callApi(_appApi.initialize(null), success, failure);
  }

  void getTranslation(
      {Function(dynamic)? success, Function(DioError)? failure}) async {
    String language='en';
    try {
      language = (await _appStorage.getData(_appStorage.languageKey)) as String;
    }catch(_){}
    callApi(_appApi.translation(null,language), success, failure);
  }

}
