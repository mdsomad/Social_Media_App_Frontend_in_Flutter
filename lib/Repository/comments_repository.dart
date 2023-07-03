
import 'dart:convert';

import 'package:dio/dio.dart';
import 'package:social_media_app_frontend_in_flutter/Models/Comments_Model.dart';
import 'package:social_media_app_frontend_in_flutter/Models/Post_Model.dart';
import 'package:social_media_app_frontend_in_flutter/Resources/Components/log.dart';
import 'package:social_media_app_frontend_in_flutter/Services/session_manager.dart';
import 'package:social_media_app_frontend_in_flutter/core/api.dart';

class CommentsRepository{

 final _api = Api();    //* <-- Create Api class object
final _apiBearerToken = ApiBearerToken();  //* <-- Create Api class object

   //TODO: Create fetchComments function 
  Future<List<CommentsModel>> fetchComments(String postId) async {
    try {
      Response response = await _api.sendRequest.get("/post/getCommentById/$postId");

      ApiResponseComments apiResponseComments = ApiResponseComments.fromResponse(response);

      if(!apiResponseComments.success) {
        throw apiResponseComments.message.toString();
      }
  
      return (apiResponseComments.data as List<dynamic>).map((json) => CommentsModel.fromJson(json)).toList();

      
    }
    catch(ex) {
      Loggerclass.logger.e(ex);
      rethrow;
    }
  }






//TODO: Create fetchComments function 
Future<List<CommentsModel>> comment(String commentdata ,PostModel postId) async {
    try {

      Map<String, dynamic> data = {
        "comment":commentdata
      };
      
      Response response = await _apiBearerToken.sendRequest.post("/post/comment/${postId.sId}",
      options: Options(headers: {
            "Content-Type": "application/json",
            "Authorization": "Bearer ${SessionControllerTolen().token.toString()}",
          }),
        data: jsonEncode(data)
      );

      ApiResponseComments apiResponseComments = ApiResponseComments.fromResponse(response);

      if(!apiResponseComments.success) {
        throw apiResponseComments.message.toString();
      }
  
      return (apiResponseComments.data as List<dynamic>).map((json) => CommentsModel.fromJson(json)).toList();

      
    }
    catch(ex) {
      Loggerclass.logger.e(ex);
      rethrow;
    }
  }




  //TODO: Create fetchComments function 
  Future<List<CommentsModel>> yourDeleteComment(String commentId ,PostModel postId) async {
    try {

      Map<String, dynamic> data = {
        "comment_id":commentId
      };
      
      Response response = await _apiBearerToken.sendRequest.delete("/your/commentdelete/${postId.sId}",
      options: Options(headers: {
            "Content-Type": "application/json",
            "Authorization": "Bearer ${SessionControllerTolen().token.toString()}",
          }),
        data: jsonEncode(data)
      );

      ApiResponseComments apiResponseComments = ApiResponseComments.fromResponse(response);

      if(!apiResponseComments.success) {
        throw apiResponseComments.message.toString();
      }
  
      return (apiResponseComments.data as List<dynamic>).map((json) => CommentsModel.fromJson(json)).toList();

      
    }
    catch(ex) {
      Loggerclass.logger.e(ex);
      rethrow;
    }
  }






  //TODO: Create postOwnerDeleteComment function 
  Future<List<CommentsModel>> postOwnerDeleteComment(String commentId ,PostModel postId) async {
    try {

      Map<String, dynamic> data = {
        "commentId":commentId
      };
      
      Response response = await _apiBearerToken.sendRequest.delete("/postownerdelete/comment/${postId.sId}",
      options: Options(headers: {
            "Content-Type": "application/json",
            "Authorization": "Bearer ${SessionControllerTolen().token.toString()}",
          }),
        data: jsonEncode(data)
      );

      ApiResponseComments apiResponseComments = ApiResponseComments.fromResponse(response);

      if(!apiResponseComments.success) {
        throw apiResponseComments.message.toString();
      }
  
      return (apiResponseComments.data as List<dynamic>).map((json) => CommentsModel.fromJson(json)).toList();

      
    }
    catch(ex) {
      Loggerclass.logger.e(ex);
      rethrow;
    }
  }





  //TODO: Create postOwnerDeleteComment function 
  Future<List<CommentsModel>> updateComment({required String commentId ,required String upDateComment,required PostModel post}) async {
    try {
       
      // TODO: Create Map
      Map<String, dynamic> data = {
        "comment_id":commentId,
        "comment":upDateComment
      };
      
      Response response = await _apiBearerToken.sendRequest.put("/postupdate/comment/${post.sId}",
      options: Options(headers: {
            "Content-Type": "application/json",
            "Authorization": "Bearer ${SessionControllerTolen().token.toString()}",
          }),
        data: jsonEncode(data)
      );

      ApiResponseComments apiResponseComments = ApiResponseComments.fromResponse(response);

      if(!apiResponseComments.success) {
        throw apiResponseComments.message.toString();
      }
  
      return (apiResponseComments.data as List<dynamic>).map((json) => CommentsModel.fromJson(json)).toList();

      
    }
    catch(ex) {
      Loggerclass.logger.e(ex);
      rethrow;
    }
  }







}