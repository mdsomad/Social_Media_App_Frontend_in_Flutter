import 'package:social_media_app_frontend_in_flutter/Models/Use_profiledetels_model.dart';
import 'package:social_media_app_frontend_in_flutter/Models/user_profile_detels.dart';




abstract class FollowersFollowingState {
  final List<UserProfileDetels> followers_following;
  FollowersFollowingState(this.followers_following);
}

class FollowersFollowingInitialState extends FollowersFollowingState {
  FollowersFollowingInitialState() : super([]);
}

class FollowersFollowingLoadingState extends FollowersFollowingState {
  FollowersFollowingLoadingState(super.followers_following);
}

class FollowersFollowingLoadedState extends FollowersFollowingState {
  FollowersFollowingLoadedState(super.followers_following);
}

class FollowersFollowingErrorState extends FollowersFollowingState {
  final String message;
  FollowersFollowingErrorState(this.message, super.followers_following);
}