import 'dart:developer';
import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:social_media_app_frontend_in_flutter/Models/Use_profiledetels_model.dart';
import 'package:social_media_app_frontend_in_flutter/Repository/user_profile_detels_repostory.dart';
import 'package:social_media_app_frontend_in_flutter/Resources/Components/log.dart';
import 'package:social_media_app_frontend_in_flutter/Utils/utils.dart';
import 'package:social_media_app_frontend_in_flutter/core/api.dart';
import 'package:social_media_app_frontend_in_flutter/logic/cubits/user_details/user_details_state.dart';

class UserProfileDetelsCubit extends Cubit<UserProfileState> {
  UserProfileDetelsCubit() : super(UserProfileDetelsInitialState() ) {
    initialize();
  }

  final _userProfileDetelsRepository = UserProfileDetelsRepository();
  


  void initialize() async {
    emit(UserProfileDetelsLoadingState() );
    try {
      final userDetails = await _userProfileDetelsRepository.UserProfileDetelsGet();
      emit(UserProfileDetelsLoadedState(userDetails) );
    }
    catch(ex) {
      emit(UserProfileDetelsErrorState(ex.toString()) );
    }
  }


  void UserToFollow(String sId) async {
    try {
      final userDetails = await _userProfileDetelsRepository.userToFollow(sId);
       emit(UserProfileDetelsLoadedState(userDetails) );
    }
    catch(ex) {
      emit(UserProfileDetelsErrorState(ex.toString()) );
    }
  }




  // TODO Create updateUser function
  Future<bool> updateUser(String email, String name,UserProfileDetelsModel userModel,BuildContext context) async {

    Map<String, dynamic> updateUserDetels = {
       "email":email,
       "name":name
    };
    
    emit(UserProfileUpdateLoadingState());
    try {
      final updatedUser = await _userProfileDetelsRepository.updateUser(updateUserDetels);
      log("Updated user $updatedUser");
        emit(UserProfileDetelsLoadedState(updatedUser));
        Utils.ftushBarSussessMessage("User updated!",context);
        return false;
    }
    catch(ex) {
      log("error user $ex");
      emit(UserProfileUpdateErrorState(ex.toString()));
      emit(UserProfileDetelsLoadedState(userModel));
       return false;
    }
  }










// TODO Create UpdateProfileImage function
void UpdateProfileImage({required File file}) async {
    emit(UserProfileImageUpdateLoadingState());
    try {

      UserProfileDetelsModel updatedUser = await _userProfileDetelsRepository.UpdateProfileImage(file);

      
      emit(UserProfileDetelsLoadedState(updatedUser));


    } catch(ex) {
      Loggerclass.logger.e(ex.toString());
      emit(UserProfileImageUpdateErrorState(ex.toString()));
    }
  }












  




}