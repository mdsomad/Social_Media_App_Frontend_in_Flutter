import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:social_media_app_frontend_in_flutter/Models/Post_Model.dart';
import 'package:social_media_app_frontend_in_flutter/Models/Use_profiledetels_model.dart';
import 'package:social_media_app_frontend_in_flutter/Repository/followers_following_repository.dart';
import 'package:social_media_app_frontend_in_flutter/Resources/Components/log.dart';
import 'package:social_media_app_frontend_in_flutter/logic/cubits/followers_following_cubits/followers_following_state.dart';

class FollowingCubit extends Cubit<FollowersFollowingState> {
  UserProfileDetelsModel user;
  FollowingCubit(this.user) : super( FollowersFollowingInitialState() ) {
   _fetchFollowing();
     Loggerclass.logger.wtf("FollowingInitialState Yes");
  }

  final _followersFollowingRepository = FollowersFollowingRepository();




 //TODO: Create _fetchFollowing Function
void  _fetchFollowing() async {
  emit(FollowersFollowingLoadingState(state.followers_following));
  try {
    final following = await _followersFollowingRepository.fetchFollowing(user.sId!);
    Loggerclass.logger.i(following);
    emit(FollowersFollowingLoadedState(following) );
  }
  catch(ex) {
    Loggerclass.logger.e(ex);
    emit( FollowersFollowingErrorState(ex.toString(),state.followers_following) );
  }
  }




  
  





}