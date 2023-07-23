import 'dart:convert';
import 'dart:developer';
import 'dart:io';

import 'package:dio/dio.dart';
import 'package:social_media_app_frontend_in_flutter/Models/Use_profiledetels_model.dart';
import 'package:social_media_app_frontend_in_flutter/Resources/Components/log.dart';
import 'package:social_media_app_frontend_in_flutter/Services/session_manager.dart';
import 'package:social_media_app_frontend_in_flutter/core/api.dart';

class UserProfileDetelsRepository {


  final _apiBearerToken = ApiBearerToken();  //* <-- Create Api class object
  final _api = Api();






//TODO: Create fetchProductsByCategory function 
Future<UserProfileDetelsModel> UserProfileDetelsGet() async {

  try {
   
    Response response = await _apiBearerToken.sendRequest.get("/me",
    options: Options(headers: {
            "Content-Type": "application/json",
            "Authorization": "Bearer ${SessionControllerTolen().token.toString()}",
          })
    );


   UserProfileDetelsApiResponse apiResponsePost = UserProfileDetelsApiResponse.fromResponse(response);

      if(!apiResponsePost.success) {
          throw apiResponsePost.message.toString();
      }

      return UserProfileDetelsModel.fromJson(apiResponsePost.user);

    } catch (ex) {
      Loggerclass.logger.e(ex);
      rethrow;
    }

  }





//TODO: Create fetchProductsByCategory function 
Future<UserProfileDetelsModel> fetchUserById(userId) async {

  try {
   
    Response response = await _apiBearerToken.sendRequest.get("/user/$userId",
    options: Options(headers: {
            "Content-Type": "application/json",
            "Authorization": "Bearer ${SessionControllerTolen().token.toString()}",
          })
    
    );


   UserProfileDetelsApiResponse apiResponsePost = UserProfileDetelsApiResponse.fromResponse(response);

      if(!apiResponsePost.success) {
          throw apiResponsePost.message.toString();
      }

      return UserProfileDetelsModel.fromJson(apiResponsePost.user);

    } catch (ex) {
      Loggerclass.logger.e(ex);
      rethrow;
    }

  }









//TODO: Create fetchProductsByCategory function 
Future<UserProfileDetelsModel> userToFollow(userId) async {

  try {
   
    Response response = await _apiBearerToken.sendRequest.get("/follow/$userId",
    options: Options(headers: {
            "Content-Type": "application/json",
            "Authorization": "Bearer ${SessionControllerTolen().token.toString()}",
          })
    
    );


   ApiResponseUserToFollow apiResponsePost = ApiResponseUserToFollow.fromResponse(response);
      

  
      if(!apiResponsePost.success) {
          throw apiResponsePost.message.toString();
      }

      return UserProfileDetelsModel.fromJson(apiResponsePost.user);

    } catch (ex) {
      Loggerclass.logger.e(ex);
      rethrow;
    }

  }








// TODO: Create updateUser function
Future<UserProfileDetelsModel> updateUser(dynamic updateUserDetels) async {
    try {
      Response response = await _apiBearerToken.sendRequest.put(
        "/update/profile",
         options: Options(headers: {
            "Content-Type": "application/json",
            "Authorization": "Bearer ${SessionControllerTolen().token.toString()}",
          }),
        data: jsonEncode(updateUserDetels)
      );
    
      
      UserProfileDetelsApiResponse userProfileDetelsApiResponse = UserProfileDetelsApiResponse.fromResponse(response);

      if(!userProfileDetelsApiResponse.success) {
        throw userProfileDetelsApiResponse.message.toString();
      }

      return UserProfileDetelsModel.fromJson(userProfileDetelsApiResponse.user);
    }
    catch(ex) {
      rethrow;
    }
  }








//TODO: Create UpdateProfileImage function 
Future<UserProfileDetelsModel> UpdateProfileImage(File file) async {

  try {

   String fileName = file.path.split('/').last;

    FormData formData = FormData.fromMap({
        "avater": await MultipartFile.fromFile(file.path,filename: fileName,),
        
    });
   
    Response response = await _apiBearerToken.sendRequest.put("/update/avater?avater",
    data: formData,
    options: Options(headers: {
             "Content-Type": "application/json",
            "Authorization": "Bearer ${SessionControllerTolen().token.toString()}",
          })
    );
   
   log(response.statusCode.toString());

   UserProfileDetelsApiResponse apiResponseProfileUpdate = UserProfileDetelsApiResponse.fromResponse(response);

      if(!apiResponseProfileUpdate.success) {
          throw apiResponseProfileUpdate.message.toString();
      }

      return UserProfileDetelsModel.fromJson(apiResponseProfileUpdate.user);

    } catch (ex) {
      Loggerclass.logger.e(ex);
      rethrow;
    }

  }









}