import 'dart:convert';
import 'dart:developer';

import 'package:dio/dio.dart';
import 'package:social_media_app_frontend_in_flutter/Models/Use_profiledetels_model.dart';
import 'package:social_media_app_frontend_in_flutter/Models/User_Model.dart';
import 'package:social_media_app_frontend_in_flutter/core/api.dart';

class UserRepository {
  
  final _api = Api();




//TODO: Create createAccount function
Future<UserModel> createAccount({
    required String userName,
    required String email,
    required String password
  }) async {
    try {
      Response response = await _api.sendRequest.post(
        "/register",
        data: jsonEncode({
          "name": userName,
          "email": email,
          "password": password 
        })
      );

      ApiResponse apiResponse = ApiResponse.fromResponse(response);

      if(!apiResponse.status) {
        throw apiResponse.message.toString();
      }
      
      //* convert raw data to model
      return UserModel(token: apiResponse.token,status: apiResponse.status,userId: apiResponse.userId,message: apiResponse.message);
    }
    catch(ex) {
      rethrow;
    }
  }





//TODO: Create signIn function
Future<UserModel> signIn({
  required String email,
  required String password
}) async {
  try {
    Response response = await _api.sendRequest.post(
      "/login",
      data: jsonEncode({
        "email": email,
        "password": password 
      })
    );

     ApiResponse apiResponse = ApiResponse.fromResponse(response);

    if(!apiResponse.status) {
      log(apiResponse.message.toString());
      throw apiResponse.message.toString();
    }

    log(apiResponse.token.toString());
   
    UserModel userModel = UserModel(status:apiResponse.status,message:apiResponse.message,token:apiResponse.token ,userId:apiResponse.userId);

    return userModel;
  }
  catch(ex) {
    rethrow;
  }
}

















  

}