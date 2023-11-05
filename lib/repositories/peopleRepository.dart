
import 'package:dio/dio.dart';

import '../base/baseRepository.dart';
import '../network/peopleApi.dart';

class PeopleRepository extends BaseRepository {
  late PeopleApi _peopleApi;

  PeopleRepository() {
    _peopleApi = PeopleApi();
  }

  void getSuggestion(
      {Function(dynamic)? success, Function(DioError)? failure}) {
    callApi(_peopleApi.index(null, null), success, failure);
  }

  void index(
      {Map<String, dynamic>? body,Map<String, dynamic>? queryParams,Function(dynamic)? success, Function(DioError)? failure}) {
    callApi(_peopleApi.index(body, queryParams), success, failure);
  }

  void like(
      {required int id,Function(dynamic)? success, Function(DioError)? failure}) {
    callApi(_peopleApi.like(id, null), success, failure);
  }

  void block(
      {Map<String, dynamic>? body,Function(dynamic)? success, Function(DioError)? failure}) {
    callApi(_peopleApi.block(body), success, failure);
  }

  void unblock(
      {Map<String, dynamic>? body,Function(dynamic)? success, Function(DioError)? failure}) {
    callApi(_peopleApi.unblock(body), success, failure);
  }

  void unlike(
      {required int id,Function(dynamic)? success, Function(DioError)? failure}) {
    callApi(_peopleApi.unlike(id, null), success, failure);
  }

  void favorite(
      {required int id,Function(dynamic)? success, Function(DioError)? failure}) {
    callApi(_peopleApi.favorite(id, null), success, failure);
  }

  void unFavorite(
      {required int id,Function(dynamic)? success, Function(DioError)? failure}) {
    callApi(_peopleApi.unFavorite(id, null), success, failure);
  }

  void favoriteList(
      {Function(dynamic)? success, Function(DioError)? failure}) {
    callApi(_peopleApi.favoriteList(), success, failure);
  }

  void likedList(
      {Function(dynamic)? success, Function(DioError)? failure}) {
    callApi(_peopleApi.likedList(), success, failure);
  }

  void whoLikedMe(
      {Function(dynamic)? success, Function(DioError)? failure}) {
    callApi(_peopleApi.whoLikedMe(null), success, failure);
  }

  void blockList(
      {Function(dynamic)? success, Function(DioError)? failure}) {
    callApi(_peopleApi.blockList(null), success, failure);
  }

  void whoSeenMyProfile(
      {Function(dynamic)? success, Function(DioError)? failure}) {
    callApi(_peopleApi.whoSeenMyProfile(null), success, failure);
  }

  void getConversations(
      {Function(dynamic)? success, Function(DioError)? failure}) {
    callApi(_peopleApi.getConversations(), success, failure);
  }
}
