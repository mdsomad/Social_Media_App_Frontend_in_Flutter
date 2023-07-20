import 'dart:developer';

import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:social_media_app_frontend_in_flutter/Models/Use_profiledetels_model.dart';
import 'package:social_media_app_frontend_in_flutter/Repository/user_profile_detels_repostory.dart';
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
  Future<void> updateUser(UserProfileDetelsModel userModel) async {
    emit(UserProfileUpdateLoadingState());
    try {
      UserProfileDetelsModel updatedUser = await _userProfileDetelsRepository.updateUser(userModel);
      emit(UserProfileDetelsLoadedState(updatedUser));
      // emit(UserProfileUpdateLoadedState(updatedUser.message.toString()));
      //  return true;
    }
    catch(ex) {
      emit(UserProfileDetelsErrorState(ex.toString()) );
      // return false;
    }
  }




}