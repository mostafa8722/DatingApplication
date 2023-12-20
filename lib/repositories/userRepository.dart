import 'dart:io';
import 'package:dio/dio.dart';

import 'package:get/get.dart' as Getx;

import '../appControler.dart';
import '../base/baseRepository.dart';
import '../model/request/forgetPasswordModel.dart';
import '../model/request/loginModel.dart';
import '../model/request/refreshToken.dart';
import '../model/request/registerModel.dart';
import '../model/request/sendEmailModel.dart';
import '../model/request/sendSmsModel.dart';
import '../model/request/updateProfileModel.dart';
import '../model/request/verifyHumanModel.dart';
import '../model/request/verifyPhoneModel.dart';
import '../model/response/token.dart';
import '../model/response/user.dart';
import '../network/authApi.dart';
import '../network/profileApi.dart';
import '../storage/userStorage.dart';

class UserRepository extends BaseRepository {
  late AuthApi _userApi;
  late ProfileApi _profileApi;
  late UserStorage _userStorage;

  UserRepository() {
    _userApi = AuthApi();
    _profileApi = ProfileApi();
    _userStorage = UserStorage();
  }

  void login(
      {required String email,
      required String password,
      Function(dynamic)? success,
      Function(DioError)? failure}) {
    var body = LoginRequestModel(email: email, password: password).toJson();

    callApi(_userApi.login(body), success, failure);
  }

  void register(
      {required String email,
      required String password,
      required String passwordConfirmation,
      required String gender,
      Function(dynamic)? success,
      Function(DioError)? failure}) {
    var body = RegisterRequestModel(
            email: email,
            password: password,
            passwordConfirmation: passwordConfirmation,
            gender: gender)
        .toJson();
    callApi(_userApi.register(body), success, failure);
  }

  void me({Function(dynamic)? success, Function(DioError)? failure}) {
    callApi(_userApi.me(), success, failure);
  }

  void forgetPassword(
      {required String email,
      Function(dynamic)? success,
      Function(DioError)? failure}) {
    var body = ForgetPasswordRequestModel(email: email).toJson();
    callApi(_userApi.forgotPassword(body), success, failure);
  }

  void refreshToken(
      {required String refreshToken,
      Function(dynamic)? success,
      Function(DioError)? failure}) {
    var body = RefreshTokenRequestModel(refreshToken: refreshToken).toJson();
    callApi(_userApi.refreshToken(body), success, failure);
  }

  void saveToken({Token? token}) {
    token != null ?
    _userStorage.saveData(_userStorage.tokenKey,token.toJson())
        :
    _userStorage.saveData(_userStorage.tokenKey,null);
  }

  Future<dynamic> getToken() async{
    dynamic jsonToken =await  _userStorage.getData(_userStorage.tokenKey);
    if(jsonToken != null) {
      Token? token = Token.fromJson(jsonToken);
      return token;
    }
    return null;
  }

  void saveInformation({User? user}) {
    _userStorage.saveData(_userStorage.informationKey,user!.toJson());
    try{
      var appController = Getx.Get.find<AppController>();
      appController.user.value = user;
      appController.user.trigger(user);
    }catch(_){
      print(_);
    }
  }

  Future<dynamic> getInformation() async{
    dynamic jsonInformation =await  _userStorage.getData(_userStorage.informationKey);
    if(jsonInformation != null) {
      User? information = User.fromJson(jsonInformation);
      return information;
    }
    return null;
  }

  void updateProfile(
      {
        String? profileImage,
      String? bannerImage,
      String? firstName,
      String? lastName,
      String? password,
      String? passwordConfirmation,
      String? locale,
      String? gender,
      double? lat,
      double? lng,
      String? birthday,
      String? description,
      String? lookingForDescription,
      String? lookingForGender,
      String? lookingForAgeGte,
      String? lookingForAgeLte,
      String? interests0,
      String? interests1,
      String? dynamicAttributes0,
      String? dynamicAttributes1,
      String? phone,
      String? email,
      Function(dynamic)? success,
      Function(DioError)? failure}) async{
    var body =await UpdateProfileRequestModel(
        profileImage: profileImage,
        bannerImage:bannerImage,
        firstName:firstName,
        lastName:lastName,
        password:password,
        passwordConfirmation:passwordConfirmation,
        locale:locale,
        gender:gender,
        lat:lat,
        lng:lng,
        birthday:birthday,
        description:description,
        lookingForDescription:lookingForDescription,
        lookingForGender:lookingForGender,
        lookingForAgeGte:lookingForAgeGte,
        lookingForAgeLte:lookingForAgeLte,
        interests0:interests0,
        interests1:interests1,
        dynamicAttributes0:dynamicAttributes0,
        dynamicAttributes1:dynamicAttributes1,
      phone: phone,
      email:email
    ).toFormData();
    print(gender);
    callApi(_profileApi.update(body), success, failure);
  }

  void sendVerificationEmail(
      { required String email,
        Function(dynamic)? success,
        Function(DioError)? failure}) {
    var body = SendEmailRequestModel(email: email).toJson();
    FormData formData = FormData.fromMap(body);
    callApi(_profileApi.update(formData), success, failure);
  }

  void sendVerificationSms(
      { required String phone,
        Function(dynamic)? success,
        Function(DioError)? failure}) {
    var body = SendSmsRequestModel(phone: phone).toJson();
    FormData formData = FormData.fromMap(body);
    callApi(_profileApi.update(formData), success, failure);
  }

  void verifyPhone(
      { required String code,
        Function(dynamic)? success,
        Function(DioError)? failure}) {
    var body = VerifyPhoneRequestModel(code: code).toJson();
    callApi(_profileApi.verifyPhone(body), success, failure);
  }

    void verifyHuman(
        { required File file,
          Function(dynamic)? success,
          Function(DioError)? failure,
          ProgressCallback? onSendProgress}) {
      var body = VerifyHumanRequestModel(file: file).toJson();
      callApi(_profileApi.verifyHuman(body,onSendProgress), success, failure);
  }
}
