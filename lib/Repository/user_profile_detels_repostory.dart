import 'package:dio/dio.dart';
import 'package:social_media_app_frontend_in_flutter/Models/Use_profiledetels_model.dart';
import 'package:social_media_app_frontend_in_flutter/Models/user_profile_detels.dart';
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




}