import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:social_media_app_frontend_in_flutter/Models/Post_Model.dart';
import 'package:social_media_app_frontend_in_flutter/Models/Use_profiledetels_model.dart';
import 'package:social_media_app_frontend_in_flutter/Repository/followers_following_repository.dart';
import 'package:social_media_app_frontend_in_flutter/Resources/Components/log.dart';
import 'package:social_media_app_frontend_in_flutter/logic/cubits/followers_following_cubits/followers_following_state.dart';

class FollowersCubit extends Cubit<FollowersFollowingState> {
  UserProfileDetelsModel user;
  FollowersCubit(this.user) : super( FollowersFollowingInitialState() ) {
   _fetchFollowers();
     Loggerclass.logger.i("FollowersInitialState Yes");
  }

  final _followersFollowingRepository = FollowersFollowingRepository();




//TODO: Create _fetchFollowers Function
void  _fetchFollowers() async {
  emit(FollowersFollowingLoadingState(state.followers_following));
  try {
    final followers = await _followersFollowingRepository.fetchFollowers(user.sId!);
    Loggerclass.logger.i(followers);
    emit(FollowersFollowingLoadedState(followers) );
  }
  catch(ex) {
    Loggerclass.logger.e(ex);
    emit( FollowersFollowingErrorState(ex.toString(),state.followers_following) );
  }
}



  



  
  





}