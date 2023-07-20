import 'package:dio/dio.dart';
import 'package:pretty_dio_logger/pretty_dio_logger.dart';
import 'package:social_media_app_frontend_in_flutter/Services/session_manager.dart';

const String BASE_URL = "http://10.0.2.2:5000/api/v1";
const Map<String, dynamic> DEFAULT_HEADERS = {
   "Content-Type": "application/json"
};



//TODO: Create Class Api
class Api {
  final Dio _dio = Dio();

  Api() {
    _dio.options.baseUrl = BASE_URL;
    _dio.options.headers = DEFAULT_HEADERS;
    _dio.interceptors.add(PrettyDioLogger(
      requestBody: true,
      requestHeader: true, 
      responseBody: true,
      responseHeader: true
    ));
  }

  Dio get sendRequest => _dio;
}










//TODO: Create Class ApiBearerToken
class ApiBearerToken {

   final Dio _dio = Dio();

  ApiBearerToken() {
    _dio.options.baseUrl = BASE_URL;
    _dio.interceptors.add(PrettyDioLogger(
      requestBody: true,
      requestHeader: true, 
      responseBody: true,
      responseHeader: true
    ));
  }

  Dio get sendRequest => _dio;
}











//TODO: Create Class ApiResponse
class ApiResponse {
  bool status;
  String? token;
  String? userId;
  String? message;

  ApiResponse({
    required this.status,
    this.token,
    this.userId,
    this.message
  });

  factory ApiResponse.fromResponse(Response response) {
    final data = response.data as Map<String, dynamic>;
    return ApiResponse(
      status: data["status"],
      token: data["token"],
      userId: data["userId"],
      message: data["message"] ?? "Unexpected error"
    );
  }

  get statusCode => null;
}




//TODO: Create Class ApiResponse
class UserProfileDetelsApiResponse {
  bool success;
  dynamic user;
  String? message;

  UserProfileDetelsApiResponse({
    required this.success,
    this.user,
    this.message
  });

  factory UserProfileDetelsApiResponse.fromResponse(Response response) {
    final data = response.data as Map<String, dynamic>;
    return UserProfileDetelsApiResponse(
      success: data["success"],
      user: data["user"],
      message: data["message"] ?? "Unexpected error"
    );
  }

  get statusCode => null;
}




//TODO: Create Class ApiResponse
class SearchUserApiResponse {
  bool success;
  dynamic users;
  String? message;

  SearchUserApiResponse({
    required this.success,
    this.users,
    this.message
  });

  factory SearchUserApiResponse.fromResponse(Response response) {
    final data = response.data as Map<String, dynamic>;
    return SearchUserApiResponse(
      success: data["success"],
      users: data["users"],
      message: data["message"] ?? "Unexpected error"
    );
  }

  get statusCode => null;
}









// TODO: Create ApiResponsePost class
class ApiResponsePost {
  bool success;
  dynamic data;
  String? message;

  ApiResponsePost({
    required this.success,
    this.data,
    this.message
  });

  factory ApiResponsePost.fromResponse(Response response) {
    final data = response.data as Map<String, dynamic>;
    return ApiResponsePost(
      success: data["success"],
      data: data["post"],
      message: data["message"] ?? "Unexpected error"
    );
  }

  get statusCode => null;
}







// TODO: Create ApiResponseComments class
class ApiResponseComments {
  bool success;
  dynamic data;
  String? message;

  ApiResponseComments({
    required this.success,
    this.data,
    this.message
  });

  factory ApiResponseComments.fromResponse(Response response) {
    final data = response.data as Map<String, dynamic>;
    return ApiResponseComments(
      success: data["success"],
      data: data["comments"],
      message: data["message"] ?? "Unexpected error"
    );
  }

  get statusCode => null;
}





// TODO: Create ApiResponseFollowers class
class ApiResponseFollowers {
  bool success;
  dynamic data;
  String? message;

  ApiResponseFollowers({
    required this.success,
    this.data,
    this.message
  });

  factory ApiResponseFollowers.fromResponse(Response response) {
    final data = response.data as Map<String, dynamic>;
    return ApiResponseFollowers(
      success: data["success"],
      data: data["followers"],
      message: data["message"] ?? "Unexpected error"
    );
  }

  get statusCode => null;
}




//TODO: Create ApiResponseFollowing Class
class ApiResponseFollowing {
  bool success;
  dynamic data;
  String? message;

  ApiResponseFollowing({
    required this.success,
    this.data,
    this.message
  });

  factory ApiResponseFollowing.fromResponse(Response response) {
    final data = response.data as Map<String, dynamic>;
    return ApiResponseFollowing(
      success: data["success"],
      data: data["following"],
      message: data["message"] ?? "Unexpected error"
    );
  }

  get statusCode => null;
}






// TODO: Create ApiResponseUserToFollow class
class ApiResponseUserToFollow {
  bool success;
  dynamic user;
  String? message;

  ApiResponseUserToFollow({
    required this.success,
    this.user,
    this.message
  });

  factory ApiResponseUserToFollow.fromResponse(Response response) {
    final data = response.data as Map<String, dynamic>;
    return ApiResponseUserToFollow(
      success: data["success"],
      user: data["userToFollow"],
      message: data["message"] ?? "Unexpected error"
    );
  }

  get statusCode => null;
}









// TODO: Create ApiResponseUserToFollow class
class ApiResponseChangePassword {
  bool success;
  String? message;

  ApiResponseChangePassword({
    required this.success,
    this.message
  });

  factory ApiResponseChangePassword.fromResponse(Response response) {
    final data = response.data as Map<String, dynamic>;
    return ApiResponseChangePassword(
      success: data["success"],
      message: data["message"] ?? "Unexpected error"
    );
  }

  get statusCode => null;
}






