
import 'package:dio/dio.dart';

import '../base/baseRepository.dart';
import '../network/contactApi.dart';

class ContactRepository extends BaseRepository {
  late ContactApi _contactApi;

  ContactRepository() {
    _contactApi = ContactApi();
  }

  void index(
      {Map<String, dynamic>? body,Function(dynamic)? success, Function(DioError)? failure}) {
    callApi(_contactApi.index(body), success, failure);
  }

  void sendRequest(
      {Map<String, dynamic>? body,Function(dynamic)? success, Function(DioError)? failure}) {
    callApi(_contactApi.sendRequest(body), success, failure);
  }
}
