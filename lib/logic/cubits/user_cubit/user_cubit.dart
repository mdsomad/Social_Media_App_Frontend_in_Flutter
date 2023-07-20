import 'dart:developer';
import 'package:dio/dio.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:social_media_app_frontend_in_flutter/Models/Error_Model.dart';
import 'package:social_media_app_frontend_in_flutter/Models/Use_profiledetels_model.dart';
import 'package:social_media_app_frontend_in_flutter/Models/User_Model.dart';
import 'package:social_media_app_frontend_in_flutter/Repository/user_repository.dart';
import 'package:social_media_app_frontend_in_flutter/Resources/Components/log.dart';
import 'package:social_media_app_frontend_in_flutter/Services/preferences.dart';
import 'package:social_media_app_frontend_in_flutter/Services/session_manager.dart';
import 'package:social_media_app_frontend_in_flutter/logic/cubits/user_cubit/user_state.dart';




class UserCubit extends Cubit<UserState> {
  
   UserCubit() : super( UserInitialState() ) {
    //  log("UserInitialState Yse");
     Loggerclass.logger.w("UserInitialState Yse");
     _initialize();
  }


final UserRepository _userRepository = UserRepository();




 // TODO Create User _initialize function Local Save details get
  void _initialize() async {
    final saveData = await Preferences.fetchUserDetails();
    String? token = saveData?["token"];
    String? userId = saveData?["userId"];
    if(token != null &&  userId != null) {
        log("Save Token get --> $token");
        log("Save userId get --> $userId");
           SessionController().userid = userId.toString();
           SessionControllerTolen().token = token.toString();
         _emitLoggedInState(token:token.toString(),userId: userId);
    }
    else {
        emit(UserLoggedOutState());
        log("Save Token is Empty --> $token");
        log("Save userId is Empty --> $userId");
    }
  }






 // TODO Create User _emitLoggedInState function Local Save User details
  void _emitLoggedInState({
    required String token,
    required String userId
  }) async {
    await Preferences.saveUserDetails(token,userId);
    SessionController().userid = userId.toString();
    SessionControllerTolen().token = token;
    emit(UserLoggedInState(token,userId) );
  }







 // TODO Create User signIn function
  void signIn({
    required String email,
    required String password
  }) async {
    emit( UserLoadingState() );
    try {
      UserModel userModel = await _userRepository.signIn(email: email, password: password);
       
      _emitLoggedInState(token:userModel.token!,userId: userModel.userId!);
    } catch(ex) {
      // log(ex.toString());
      Loggerclass.logger.e(ex.toString());
 
      emit(UserErrorState(ex.toString()));
    }
  }





// TODO Create User createAccount function
  void createAccount({
    required String userName,
    required String email,
    required String password
  }) async {
    emit( UserLoadingState() );
    try {
      UserModel userModel = await _userRepository.createAccount(userName: userName,email: email, password: password);
        _emitLoggedInState(token:userModel.token.toString(),userId: userModel.userId!);

    }
    catch(ex) {
      emit(UserErrorState(ex.toString()) );
    }
  }
   
  






  
  
  
  
   
// TODO Create User signOut function
 Future<void> signOut() async {
    await Preferences.clear();
    emit(UserLoggedOutState());
  }
  
    
}