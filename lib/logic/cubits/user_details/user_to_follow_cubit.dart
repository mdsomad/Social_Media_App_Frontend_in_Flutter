import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:social_media_app_frontend_in_flutter/Repository/user_profile_detels_repostory.dart';
import 'package:social_media_app_frontend_in_flutter/logic/cubits/user_details/user_details_state.dart';

class UserToFollowCubit extends Cubit<UserProfileState> {
 
  UserToFollowCubit() : super(UserProfileDetelsInitialState() ) {
  }

  final _userDetelsFetchByIdRepository = UserProfileDetelsRepository();



  void UserToFollow(String sId) async {
    try {
      final userDetails = await _userDetelsFetchByIdRepository.userToFollow(sId);
       emit(UserProfileDetelsLoadedState(userDetails) );
    }
    catch(ex) {
      emit(UserProfileDetelsErrorState(ex.toString()) );
    }
  }







}