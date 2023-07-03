import 'dart:developer';

import 'package:dio/dio.dart';
import 'package:pretty_dio_logger/pretty_dio_logger.dart';
import 'package:social_media_app_frontend_in_flutter/Models/Post_Model.dart';
import 'package:social_media_app_frontend_in_flutter/Resources/Components/log.dart';
import 'package:social_media_app_frontend_in_flutter/Services/session_manager.dart';
import 'package:social_media_app_frontend_in_flutter/core/api.dart';

class PostRepository {

  final _api = Api();    //* <-- Create Api class object

  final _apiBearerToken = ApiBearerToken();  //* <-- Create Api class object



  //TODO: Create fetchAllProducts function 
  Future<List<PostModel>> fetchAllPost() async {
    try {
      Response response = await _api.sendRequest.get("/getAllPost");

      ApiResponsePost apiResponsePost = ApiResponsePost.fromResponse(response);

      if(!apiResponsePost.success) {
        throw apiResponsePost.message.toString();
      }
     

  
      return (apiResponsePost.data as List<dynamic>).map((json) => 
      PostModel.fromJson(json)).toList();

      
    }
    catch(ex) {
      Loggerclass.logger.e(ex);
      rethrow;
    }
  }





//TODO: Create fetchProductsByCategory function 
Future<PostModel> LikeAndUnlikePost(String sId) async {

  try {
   
    Response response = await _apiBearerToken.sendRequest.get("/post/$sId",
    options: Options(headers: {
            "Content-Type": "application/json",
            "Authorization": "Bearer ${SessionControllerTolen().token.toString()}",
          })
    );


   ApiResponsePost apiResponsePost = ApiResponsePost.fromResponse(response);

      if(!apiResponsePost.success) {
          throw apiResponsePost.message.toString();
      }

      return PostModel.fromJson(apiResponsePost.data);

    } catch (ex) {
      Loggerclass.logger.e(ex);
      rethrow;
    }

  }




}