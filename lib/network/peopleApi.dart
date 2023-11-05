
import 'package:dio/dio.dart';

import '../base/baseNetwork.dart';
import '../utils/header.dart';

class PeopleApi extends BaseNetwork {
  Future<Response> index(Map<String, dynamic>? body,Map<String, dynamic>? queryParams) async=>
      dio.post('/people',data:body,queryParameters: queryParams, options: Options(headers: await getHeader()));

  Future<Response> show(dynamic id,Map<String, dynamic>? body) async=>
      dio.get('/people/$id', options: Options(headers: await getHeader()));

  Future<Response> like(dynamic id,Map<String, dynamic>? body) async=>
      dio.get('/people/like/$id', options: Options(headers: await getHeader()));

  Future<Response> unlike(dynamic id,Map<String, dynamic>? body) async=>
      dio.get('/people/unlike/$id', options: Options(headers: await getHeader()));

  Future<Response> favorite(dynamic id,Map<String, dynamic>? body) async=>
      dio.post('/people/favorite/$id',data: body, options: Options(headers: await getHeader()));

  Future<Response> unFavorite(dynamic id,Map<String, dynamic>? body) async=>
      dio.post('/people/unfavorite/$id',data: body, options: Options(headers: await getHeader()));

  Future<Response> whoLikedMe(Map<String, dynamic>? body) async=>
      dio.post('/people/who_liked_me',data: body, options: Options(headers: await getHeader()));

  Future<Response> whoSeenMyProfile(Map<String, dynamic>? body) async=>
      dio.post('/people/who_seen_my_profile',data: body, options: Options(headers: await getHeader()));

  Future<Response> blockList(Map<String, dynamic>? body) async=>
      dio.post('/people/blocked_list',data: body, options: Options(headers: await getHeader()));

  Future<Response> block(Map<String, dynamic>? body) async=>
      dio.post('/people/block_contact',data: body, options: Options(headers: await getHeader()));

  Future<Response> unblock(Map<String, dynamic>? body) async=>
      dio.post('/people/unblock_contact',data: body, options: Options(headers: await getHeader()));

  Future<Response> favoriteList() async=>
      dio.post('/people/favorite_list', options: Options(headers: await getHeader()));

  Future<Response> likedList() async=>
      dio.post('/people/liked_list', options: Options(headers: await getHeader()));

  Future<Response> getConversations() async=>
      dio.post('/people/chat_conversations', options: Options(headers: await getHeader()));
}
