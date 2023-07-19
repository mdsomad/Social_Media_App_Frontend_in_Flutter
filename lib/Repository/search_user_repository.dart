import 'package:dio/dio.dart';
import 'package:social_media_app_frontend_in_flutter/Models/Use_profiledetels_model.dart';
import 'package:social_media_app_frontend_in_flutter/Resources/Components/log.dart';
import 'package:social_media_app_frontend_in_flutter/Services/session_manager.dart';
import 'package:social_media_app_frontend_in_flutter/core/api.dart';

class SearchUserRepository{

 final _api = Api();    //* <-- Create Api class object
final _apiBearerToken = ApiBearerToken();  //* <-- Create Api class object





  
   //TODO: Create SearchUser function 
  Future<List<UserProfileDetelsModel>> SearchUser({required String searchName}) async {
    try {
      Response response = await _apiBearerToken.sendRequest.get("/users?name=$searchName",
        options: Options(headers: {
            "Content-Type": "application/json",
            "Authorization": "Bearer ${SessionControllerTolen().token.toString()}",
          })
      );

      SearchUserApiResponse apiResponseComments = SearchUserApiResponse.fromResponse(response);

      if(!apiResponseComments.success) {
        throw apiResponseComments.message.toString();
      }
  
      return (apiResponseComments.users as List<dynamic>).map((json) => UserProfileDetelsModel.fromJson(json)).toList();

      
    }
    catch(ex) {
      Loggerclass.logger.e(ex);
      rethrow;
    }
  }










}