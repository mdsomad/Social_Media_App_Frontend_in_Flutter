import 'package:dio/dio.dart';
import 'package:social_media_app_frontend_in_flutter/Models/Use_profiledetels_model.dart';
import 'package:social_media_app_frontend_in_flutter/Resources/Components/log.dart';
import 'package:social_media_app_frontend_in_flutter/core/api.dart';

class FollowersFollowingRepository{

 final _api = Api();    //* <-- Create Api class object


   //TODO: Create fetchComments function 
  Future<List<UserProfileDetelsModel>> fetchFollowers(String postId) async {
    try {
      Response response = await _api.sendRequest.get("/Fetch/followers/$postId");

      ApiResponseFollowers apiResponseComments = ApiResponseFollowers.fromResponse(response);

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








   //TODO: Create fetchComments function 
  Future<List<UserProfileDetelsModel>> fetchFollowing(String postId) async {
    try {
      Response response = await _api.sendRequest.get("/Fetch/following/$postId");

      ApiResponseFollowing apiResponseFollowing = ApiResponseFollowing.fromResponse(response);

      if(!apiResponseFollowing.success) {
        throw apiResponseFollowing.message.toString();
      }
  
      return (apiResponseFollowing.data as List<dynamic>).map((json) => UserProfileDetelsModel.fromJson(json)).toList();

      
    }
    catch(ex) {
      Loggerclass.logger.e(ex);
      rethrow;
    }
  }

















}