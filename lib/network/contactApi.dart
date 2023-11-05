
import 'package:dio/dio.dart';

import '../base/baseNetwork.dart';
import '../utils/header.dart';

class ContactApi extends BaseNetwork {
  Future<Response> index(Map<String, dynamic>? body) async=>
      dio.get('/contacts', options: Options(headers: await getHeader()));

  Future<Response> receivedRequests(Map<String, dynamic>? body) async=>
      dio.get('/contacts/received_requests', options: Options(headers: await getHeader()));

  Future<Response> sentRequests(Map<String, dynamic>? body) async=>
      dio.get('/contacts/sent_requests', options: Options(headers: await getHeader()));

  Future<Response> sendRequest(Map<String, dynamic>? body) async=>
      dio.post('/contacts/send_request', data: body, options: Options(headers: await getHeader()));

  Future<Response> acceptReceivedRequest(Map<String, dynamic>? body) async=>
      dio.post('/contacts/accept_contact_request', data: body, options: Options(headers: await getHeader()));

  Future<Response> rejectReceivedRequest(Map<String, dynamic>? body) async=>
      dio.post('/contacts/reject_contact_request', data: body, options: Options(headers: await getHeader()));

  Future<Response> deleteRequest(Map<String, dynamic>? body) async=>
      dio.post('/contacts/delete_contact_request', data: body, options: Options(headers: await getHeader()));

  Future<Response> removeFromContact(Map<String, dynamic>? body) async=>
      dio.post('/contacts/remove_from_contact_list', data: body, options: Options(headers: await getHeader()));

}
