import 'package:dio/dio.dart';
import 'package:social_media_app_frontend_in_flutter/Models/Use_profiledetels_model.dart';
import 'package:social_media_app_frontend_in_flutter/Resources/Components/log.dart';
import 'package:social_media_app_frontend_in_flutter/core/api.dart';

class SearchUserRepository{

 final _api = Api();    //* <-- Create Api class object
final _apiBearerToken = ApiBearerToken();  //* <-- Create Api class object

   //TODO: Create fetchComments function 
  Future<List<UserProfileDetelsModel>> SearchUser(String postId) async {
    try {
      Response response = await _api.sendRequest.get("/post/getCommentById/$postId");

      ApiResponseComments apiResponseComments = ApiResponseComments.fromResponse(response);

      if(!apiResponseComments.success) {
        throw apiResponseComments.message.toString();
      }
  
      return (apiResponseComments.data as List<dynamic>).map((json) => UserProfileDetelsModel.fromJson(json)).toList();

      
    }
    catch(ex) {
      Loggerclass.logger.e(ex);
      rethrow;
    }
  }










}