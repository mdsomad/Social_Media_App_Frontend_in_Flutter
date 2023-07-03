import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:social_media_app_frontend_in_flutter/Repository/user_profile_detels_repostory.dart';
import 'package:social_media_app_frontend_in_flutter/logic/cubits/user_details/user_details_state.dart';

class UserProfileDetelsCubit extends Cubit<UserProfileState> {
  UserProfileDetelsCubit() : super(UserProfileDetelsInitialState() ) {
    _initialize();
  }

  final _userProfileDetelsRepository = UserProfileDetelsRepository();
  


  void _initialize() async {
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




}