import 'package:dio/dio.dart';

class BaseRepository{
  bool fakeMode = true;

  callApi(Future<Response> request, Function(dynamic)? success,Function(DioError)? failure) async{
    try{
      var response = await request;
      if(success != null)success(response);



    }on DioError catch(e){
       if(failure != null)failure(e);
      print("response23");
      print(e.response);
      //print(e.type == DioErrorType.response);

    }
  }
}