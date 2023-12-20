
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


  void sendDiscountCode(
      {
        required String package_id,
        required String code,
        Function(dynamic)? success,
        Function(DioError)? failure}) {
    Map<String,dynamic> body = {"package_id":package_id,"code":code};
    callApi(_appApi.discountCode(body), success, failure);
  }

  void buyPackage(
      {
        required String package_id,
        required String gateway_id,
        required String code,
        Function(dynamic)? success,
        Function(DioError)? failure}) {
    Map<String,dynamic> body = {"package_id":package_id,"code":code,"gateway_id":gateway_id};
    callApi(_appApi.buyPackage(body), success, failure);
  }


}
