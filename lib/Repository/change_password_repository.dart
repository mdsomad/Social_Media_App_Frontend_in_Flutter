import 'dart:convert';

import 'package:dio/dio.dart';
import 'package:social_media_app_frontend_in_flutter/Resources/Components/log.dart';
import 'package:social_media_app_frontend_in_flutter/Services/session_manager.dart';
import 'package:social_media_app_frontend_in_flutter/core/api.dart';

class ChangePasswordRepository{

 final _api = Api();    //* <-- Create Api class object
final _apiBearerToken = ApiBearerToken();  //* <-- Create Api class object





  //TODO: Create ChangePassword function 
  Future<String?> ChangePassword({required String OldPassword ,required String NewPassword}) async {
    try {

      Map<String, dynamic> data = {
        "oldPassword":OldPassword,
        "newPassword":NewPassword
      };
      
      Response response = await _apiBearerToken.sendRequest.put("/change/password",
      options: Options(headers: {
            "Content-Type": "application/json",
            "Authorization": "Bearer ${SessionControllerTolen().token.toString()}",
          }),
        data: jsonEncode(data)
      );

      ApiResponseChangePassword apiResponseChangePassword = ApiResponseChangePassword.fromResponse(response);

      if(!apiResponseChangePassword.success) {
        throw apiResponseChangePassword.message.toString();
      }
  
      return apiResponseChangePassword.message;

      
    }
    catch(ex) {
      Loggerclass.logger.e(ex);
      rethrow;
    }
  }













}